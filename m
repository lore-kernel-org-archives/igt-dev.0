Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B051A10E6B2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 15:13:27 +0000 (UTC)
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Wang, Chao-kai (Stylon)"
 <Stylon.Wang@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "Li, Sun
 peng (Leo)" <Sunpeng.Li@amd.com>, "petri.latvala@intel.com"
 <petri.latvala@intel.com>
Date: Fri, 11 Aug 2023 15:13:23 +0000
Message-ID: <PH8PR12MB69621F0CCB8753A4237C3539FD10A@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <20230810145257.88389-1-hersenxs.wu@amd.com>
In-Reply-To: <20230810145257.88389-1-hersenxs.wu@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] [i-g-t] lib/igt_kms: Re-try
 display_require if require output is not valid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Re-send for review request.
Thanks!
Hersen


-----Original Message-----
From: Hersen Wu <hersenxs.wu@amd.com>
Sent: Thursday, August 10, 2023 10:53 AM
To: igt-dev@lists.freedesktop.org; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.=
com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@a=
md.com>; Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; Mahfooz, Hamza <Ham=
za.Mahfooz@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>
Cc: markyacoub@google.com; Wu, Hersen <hersenxs.wu@amd.com>
Subject: [PATCH 1/2] [i-g-t] lib/igt_kms: Re-try display_require if require=
 output is not valid

Add igt_display_setup to re-try igt_display_require.

At entry of each test, display setup is done by igt_display_require and igt=
_display_require_output.
igt display require output may not be valid yet, this will let test be skip=
ped. By re-try igt_display_require, require output could be valid.
This will fix test case intermittent skip issue.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c index e0959ccff..5506e2eb2 10064=
4
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2862,6 +2862,25 @@ void igt_display_require_output(igt_display_t *displ=
ay)
        igt_skip("No valid crtc/connector combinations found.\n");  }

+/**
+ * is_igt_display_require_output_valid:
+ * @display: A pointer to an #igt_display_t structure
+ *
+ * Checks whether there's a valid @pipe/@output combination for the
+given @display
+ * Returns: true if a valid combination of @pipe and @output is found,
+or false
+ * if not found
+ */
+bool is_igt_display_require_output_valid(igt_display_t *display) {
+       enum pipe pipe;
+       igt_output_t *output;
+
+       for_each_pipe_with_valid_output(display, pipe, output)
+               return true;
+
+       return false;
+}
+
 /**
  * igt_display_require_output_on_pipe:
  * @display: A pointer to an #igt_display_t structure diff --git a/lib/igt=
_kms.h b/lib/igt_kms.h index 91355c910..350966214 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -485,6 +485,7 @@ int  igt_display_drop_events(igt_display_t *display);  =
int  igt_display_get_n_pipes(igt_display_t *display);  void igt_display_req=
uire_output(igt_display_t *display);  void igt_display_require_output_on_pi=
pe(igt_display_t *display, enum pipe pipe);
+bool is_igt_display_require_output_valid(igt_display_t *display);

 const char *igt_output_name(igt_output_t *output);  drmModeModeInfo *igt_o=
utput_get_mode(igt_output_t *output); @@ -722,6 +723,21 @@ uint64_t igt_pla=
ne_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
                igt_plane_set_prop_changed(plane, prop); \
        } while (0)

+#define IGT_DISPLAY_REQUIRE_OUTPUT_VALID_MAX_RETRY_TIMES 5
+
+#define igt_display_setup(display, fd, delay) \
+       for (int j__ =3D 0; j__ < IGT_DISPLAY_REQUIRE_OUTPUT_VALID_MAX_RETR=
Y_TIMES; j__++) { \
+               igt_display_require(display, fd); \
+               if (is_igt_display_require_output_valid(display)) { \
+                       if (j__ > 0) \
+                               igt_info("retry times:%d delay:%d seconds\n=
", j__, delay * j__); \
+                       break; \
+               } \
+               sleep(delay); \
+               if (j__ =3D=3D IGT_DISPLAY_REQUIRE_OUTPUT_VALID_MAX_RETRY_T=
IMES - 1) \
+                       igt_skip("No valid crtc/connector combinations foun=
d.\n"); \
+       }
+
 extern bool igt_plane_try_prop_enum(igt_plane_t *plane,
                                    enum igt_atomic_plane_properties prop,
                                    const char *val);
--
2.25.1
