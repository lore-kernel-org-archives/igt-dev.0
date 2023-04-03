Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EBC10E4AD
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 14:55:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------LcSzdt6f0ailr4QmHPvbCt24"
Message-ID: <2679f33b-76b8-def3-388e-1187b630c921@linux.intel.com>
Date: Mon, 3 Apr 2023 16:55:42 +0200
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230328124044.268766-1-maarten.lankhorst@linux.intel.com>
 <20230403053724.kctv5urufyh7aono@zkempczy-mobl2>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230403053724.kctv5urufyh7aono@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] xe_pm: Kill display for PM tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------LcSzdt6f0ailr4QmHPvbCt24
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey,

On 2023-04-03 07:37, Zbigniew Kempczyński wrote:
> On Tue, Mar 28, 2023 at 02:40:43PM +0200, Maarten Lankhorst wrote:
>> Display keeps PM alive, do the minimal initialization to disable
>> display for the PM tests entirely.
> What's the reason of enforcing releasing display before starting PM
> tests? Looks like introducing testing gap.

It's the easiest fix, and display is irrelevant for those tests. The 
system will not go into

a lower power when display keeps it in a high power state by holding a 
PM reference

What do you think of the below test instead?

----------->8---------

diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 23b8246ed..f681e253a 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -341,6 +341,30 @@ NULL));
  		igt_assert(in_d3(device, d_state));
  }
  
+static void test_pipe(device_t device, igt_display_t *display, enum pipe pipe,
+		      igt_output_t *output, enum igt_acpi_d_state d_state)
+{
+	struct igt_fb fb;
+
+	igt_assert(in_d3(device, d_state));
+
+	/* Just for fun, set a scaled fb as primary so scaler is active too */
+	igt_create_fb(display->drm_fd, 640, 480, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
+
+	igt_assert(in_d3(device, d_state));
+
+	igt_display_reset(display);
+	igt_output_set_pipe(output, pipe);
+	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_assert(out_of_d3(device, d_state));
+
+	igt_display_reset(display);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_remove_fb(display->drm_fd, &fb);
+	igt_assert(in_d3(device, d_state));
+}
+
  igt_main
  {
  	struct drm_xe_engine_class_instance *hwe;
@@ -363,19 +387,34 @@ igt_main
  		{ "d3cold", IGT_ACPI_D3Cold },
  		{ NULL },
  	};
+	enum pipe pipe;
+	igt_display_t display;
  
  	igt_fixture {
+		drmModeResPtr res;
+
  		memset(&device, 0, sizeof(device));
-		device.fd_xe = drm_open_driver(DRIVER_XE);
+		device.fd_xe = drm_open_driver_master(DRIVER_XE);
  		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
  		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
  
+		kmstest_set_vt_graphics_mode();
  		xe_device_get(device.fd_xe);
  
  		/* Always perform initial once-basic exec checking for health */
  		xe_for_each_hw_engine(device.fd_xe, hwe)
  			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
  
+		/* Kill display, if it exists */
+		res = drmModeGetResources(device.fd_xe);
+		if (res) {
+			drmModeFreeResources(res);
+			igt_display_require(&display, device.fd_xe);
+			igt_display_commit2(&display, COMMIT_ATOMIC);
+		} else {
+			display.drm_fd = -1;
+		}
+
  		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
  	}
@@ -435,11 +474,31 @@ igt_main
  				test_exec(device, hwe, 16, 32,
  					  NO_SUSPEND, d->state);
  		}
+
+		for_each_pipe_static(pipe) {
+			igt_subtest_f("%s-pipe-%s", d->name, kmstest_pipe_name(pipe)) {
+				igt_output_t *output;
+				bool valid_output = false;
+
+				igt_require(display.drm_fd != -1);
+				igt_require_pipe(&display, pipe);
+				igt_assert(setup_d3(device, d->state));
+
+				for_each_valid_output_on_pipe(&display, pipe, output)
+					test_pipe(device, &display, pipe, output, d->state);
+
+				igt_require(valid_output);
+			}
+		}
  	}
  
  	igt_fixture {
  		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
  		igt_restore_runtime_pm();
+
+		if (display.drm_fd != -1)
+			igt_display_fini(&display);
+
  		xe_device_put(device.fd_xe);
  		close(device.fd_xe);
  	}

--------------LcSzdt6f0ailr4QmHPvbCt24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey,<br>
    </p>
    <div class="moz-cite-prefix">On 2023-04-03 07:37, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230403053724.kctv5urufyh7aono@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">On Tue, Mar 28, 2023 at 02:40:43PM +0200, Maarten Lankhorst wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Display keeps PM alive, do the minimal initialization to disable
display for the PM tests entirely.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What's the reason of enforcing releasing display before starting PM
tests? Looks like introducing testing gap.</pre>
    </blockquote>
    <p>It's the easiest fix, and display is irrelevant for those tests.
      The system will not go into</p>
    <p>a lower power when display keeps it in a high power state by
      holding a PM reference</p>
    <p>What do you think of the below test instead?<br>
    </p>
    <pre>-----------&gt;8---------

diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 23b8246ed..f681e253a 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -341,6 +341,30 @@ NULL));
 		igt_assert(in_d3(device, d_state));
 }
 
+static void test_pipe(device_t device, igt_display_t *display, enum pipe pipe,
+		      igt_output_t *output, enum igt_acpi_d_state d_state)
+{
+	struct igt_fb fb;
+
+	igt_assert(in_d3(device, d_state));
+
+	/* Just for fun, set a scaled fb as primary so scaler is active too */
+	igt_create_fb(display-&gt;drm_fd, 640, 480, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+
+	igt_assert(in_d3(device, d_state));
+
+	igt_display_reset(display);
+	igt_output_set_pipe(output, pipe);
+	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), &amp;fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_assert(out_of_d3(device, d_state));
+
+	igt_display_reset(display);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_remove_fb(display-&gt;drm_fd, &amp;fb);
+	igt_assert(in_d3(device, d_state));
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -363,19 +387,34 @@ igt_main
 		{ "d3cold", IGT_ACPI_D3Cold },
 		{ NULL },
 	};
+	enum pipe pipe;
+	igt_display_t display;
 
 	igt_fixture {
+		drmModeResPtr res;
+
 		memset(&amp;device, 0, sizeof(device));
-		device.fd_xe = drm_open_driver(DRIVER_XE);
+		device.fd_xe = drm_open_driver_master(DRIVER_XE);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
 
+		kmstest_set_vt_graphics_mode();
 		xe_device_get(device.fd_xe);
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_hw_engine(device.fd_xe, hwe)
 			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
 
+		/* Kill display, if it exists */
+		res = drmModeGetResources(device.fd_xe);
+		if (res) {
+			drmModeFreeResources(res);
+			igt_display_require(&amp;display, device.fd_xe);
+			igt_display_commit2(&amp;display, COMMIT_ATOMIC);
+		} else {
+			display.drm_fd = -1;
+		}
+
 		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
 	}
@@ -435,11 +474,31 @@ igt_main
 				test_exec(device, hwe, 16, 32,
 					  NO_SUSPEND, d-&gt;state);
 		}
+
+		for_each_pipe_static(pipe) {
+			igt_subtest_f("%s-pipe-%s", d-&gt;name, kmstest_pipe_name(pipe)) {
+				igt_output_t *output;
+				bool valid_output = false;
+
+				igt_require(display.drm_fd != -1);
+				igt_require_pipe(&amp;display, pipe);
+				igt_assert(setup_d3(device, d-&gt;state));
+
+				for_each_valid_output_on_pipe(&amp;display, pipe, output)
+					test_pipe(device, &amp;display, pipe, output, d-&gt;state);
+
+				igt_require(valid_output);
+			}
+		}
 	}
 
 	igt_fixture {
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_restore_runtime_pm();
+
+		if (display.drm_fd != -1)
+			igt_display_fini(&amp;display);
+
 		xe_device_put(device.fd_xe);
 		close(device.fd_xe);
 	}

</pre>
  </body>
</html>

--------------LcSzdt6f0ailr4QmHPvbCt24--
