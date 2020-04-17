Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D984C6EC1B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 14:09:06 +0000 (UTC)
References: <20200409053951.26929-3-anshuman.gupta@intel.com>
 <20200415124859.2144-1-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <7f45dbbe-a9ac-3728-4b5b-a8a80be01c29@intel.com>
Date: Fri, 17 Apr 2020 19:38:58 +0530
MIME-Version: 1.0
In-Reply-To: <20200415124859.2144-1-anshuman.gupta@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1870446907=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1870446907==
Content-Type: multipart/alternative;
 boundary="------------1F6CD200559A1E35C97DC9FE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1F6CD200559A1E35C97DC9FE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 15-04-2020 18:18, Anshuman Gupta wrote:
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
> v5:
> - return lpsp capability false if i915_lpsp_capability debugfs is not
>    present. [Animesh]
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

looks good to me.
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>   lib/igt_pm.c | 29 +++++++++++++++++++++++++++++
>   lib/igt_pm.h |  1 +
>   2 files changed, 30 insertions(+)
>
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 9d441e1b..b409ec46 100644
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
> @@ -827,3 +828,31 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
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
> +	char buf[256];
> +	int fd, len;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_require(fd >= 0);
> +	len = igt_debugfs_simple_read(fd, "i915_lpsp_capability",
> +				      buf, sizeof(buf));
> +
> +	/* if i915_lpsp_capability not present return the capability as false */
> +	if (len < 0)
> +		return false;
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

--------------1F6CD200559A1E35C97DC9FE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-04-2020 18:18, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200415124859.2144-1-anshuman.gupta@intel.com">
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
v5:
- return lpsp capability false if i915_lpsp_capability debugfs is not
  present. [Animesh]

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a></pre>
    </blockquote>
    <pre>looks good to me.
Reviewed-by: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200415124859.2144-1-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 lib/igt_pm.c | 29 +++++++++++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 9d441e1b..b409ec46 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -37,6 +37,7 @@
 #include &lt;dirent.h&gt;
 
 #include "drmtest.h"
+#include "igt_kms.h"
 #include "igt_pm.h"
 #include "igt_aux.h"
 #include "igt_sysfs.h"
@@ -827,3 +828,31 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 
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
+	char buf[256];
+	int fd, len;
+
+	fd = igt_debugfs_connector_dir(drm_fd, output-&gt;name, O_RDONLY);
+	igt_require(fd &gt;= 0);
+	len = igt_debugfs_simple_read(fd, "i915_lpsp_capability",
+				      buf, sizeof(buf));
+
+	/* if i915_lpsp_capability not present return the capability as false */
+	if (len &lt; 0)
+		return false;
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

--------------1F6CD200559A1E35C97DC9FE--

--===============1870446907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1870446907==--
