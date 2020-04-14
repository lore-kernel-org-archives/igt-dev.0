Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B83A89C9D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 16:26:57 +0000 (UTC)
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
 <20200409053951.26929-3-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <fa141fa2-5e0e-a68d-99b4-cd3abf93610b@intel.com>
Date: Tue, 14 Apr 2020 21:56:47 +0530
MIME-Version: 1.0
In-Reply-To: <20200409053951.26929-3-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/5] lib/igt_pm: Add lib func to get
 lpsp capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0098969953=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0098969953==
Content-Type: multipart/alternative;
 boundary="------------6338008A30C45FE062CC2BAF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6338008A30C45FE062CC2BAF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09-04-2020 11:09, Anshuman Gupta wrote:
> This lib function evaluate the lpsp capability from
> the connector specific debugfs attribute i915_lpsp_info.
>
> v2:
> - changed the lib function prefix igt_output_is_lpsp_capable
>    to i915_output_is_lpsp_capable. [Martin]
> v3:
> - early return for the connector which doesn't support
>    lpsp on any platform.
> v4:
> - debugfs entry changed from i915_lpsp_info to i915_lpsp_capability.
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   lib/igt_pm.c | 37 +++++++++++++++++++++++++++++++++++++
>   lib/igt_pm.h |  1 +
>   2 files changed, 38 insertions(+)
>
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 9d441e1b..3418b69a 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -37,6 +37,7 @@
>   #include <dirent.h>
>   
>   #include "drmtest.h"
> +#include "igt_kms.h"
>   #include "igt_pm.h"
>   #include "igt_aux.h"
>   #include "igt_sysfs.h"
> @@ -827,3 +828,39 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
>   
>   	return true;
>   }
> +
> +/**
> + * i915_output_is_lpsp_capable:
> + * @drm_fd: fd to drm device
> + * @output: igt output for which lpsp capability need to be evaluated
> + * Check lpsp capability for a given output.
> + *
> + * Returns:
> + * True if given output is lpsp capable otherwise false.
> + */
> +bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
> +{
> +	drmModeConnectorPtr c = output->config.connector;
> +	char buf[256];
> +	int fd, len;
> +
> +	/* only eDP/DP/DSI/HDMI can support LPSP */
> +	if (c->connector_type != DRM_MODE_CONNECTOR_eDP &&
> +	    c->connector_type != DRM_MODE_CONNECTOR_DSI &&
> +	    c->connector_type != DRM_MODE_CONNECTOR_DisplayPort &&
> +	    c->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +	    c->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +		return false;

We can avoid check for Connector type as already taken care in kernel... rt?

Regards,
Animesh

> +
> +	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_require(fd >= 0);
> +	len = igt_debugfs_simple_read(fd, "i915_lpsp_capability",
> +				      buf, sizeof(buf));
> +
> +	if (len < 0)
> +		igt_assert_eq(len, -ENODEV);
> +
> +	close(fd);
> +
> +	return strstr(buf, "LPSP: capable");
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 5e438452..162d3ca3 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -53,5 +53,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void);
>   bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
>   bool igt_pm_dmc_loaded(int debugfs);
>   bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
> +bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
>   
>   #endif /* IGT_PM_H */

--------------6338008A30C45FE062CC2BAF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-04-2020 11:09, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200409053951.26929-3-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">This lib function evaluate the lpsp capability from
the connector specific debugfs attribute i915_lpsp_info.

v2:
- changed the lib function prefix igt_output_is_lpsp_capable
  to i915_output_is_lpsp_capable. [Martin]
v3:
- early return for the connector which doesn't support
  lpsp on any platform.
v4:
- debugfs entry changed from i915_lpsp_info to i915_lpsp_capability.

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
 lib/igt_pm.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 9d441e1b..3418b69a 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -37,6 +37,7 @@
 #include &lt;dirent.h&gt;
 
 #include "drmtest.h"
+#include "igt_kms.h"
 #include "igt_pm.h"
 #include "igt_aux.h"
 #include "igt_sysfs.h"
@@ -827,3 +828,39 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 
 	return true;
 }
+
+/**
+ * i915_output_is_lpsp_capable:
+ * @drm_fd: fd to drm device
+ * @output: igt output for which lpsp capability need to be evaluated
+ * Check lpsp capability for a given output.
+ *
+ * Returns:
+ * True if given output is lpsp capable otherwise false.
+ */
+bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
+{
+	drmModeConnectorPtr c = output-&gt;config.connector;
+	char buf[256];
+	int fd, len;
+
+	/* only eDP/DP/DSI/HDMI can support LPSP */
+	if (c-&gt;connector_type != DRM_MODE_CONNECTOR_eDP &amp;&amp;
+	    c-&gt;connector_type != DRM_MODE_CONNECTOR_DSI &amp;&amp;
+	    c-&gt;connector_type != DRM_MODE_CONNECTOR_DisplayPort &amp;&amp;
+	    c-&gt;connector_type != DRM_MODE_CONNECTOR_HDMIA &amp;&amp;
+	    c-&gt;connector_type != DRM_MODE_CONNECTOR_HDMIB)
+		return false;</pre>
    </blockquote>
    <pre>We can avoid check for Connector type as already taken care in kernel... rt?

Regards,
Animesh
</pre>
    <blockquote type="cite"
      cite="mid:20200409053951.26929-3-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+	fd = igt_debugfs_connector_dir(drm_fd, output-&gt;name, O_RDONLY);
+	igt_require(fd &gt;= 0);
+	len = igt_debugfs_simple_read(fd, "i915_lpsp_capability",
+				      buf, sizeof(buf));
+
+	if (len &lt; 0)
+		igt_assert_eq(len, -ENODEV);
+
+	close(fd);
+
+	return strstr(buf, "LPSP: capable");
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 5e438452..162d3ca3 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -53,5 +53,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void);
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
 bool igt_pm_dmc_loaded(int debugfs);
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
+bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
 
 #endif /* IGT_PM_H */
</pre>
    </blockquote>
  </body>
</html>

--------------6338008A30C45FE062CC2BAF--

--===============0098969953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0098969953==--
