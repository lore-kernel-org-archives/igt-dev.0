Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECACD1268A
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 11:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BBE10E574;
	Tue,  5 Nov 2024 11:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9QkTc57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C5710E574
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730805700; x=1762341700;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=C9rGsbsJFA3o/s8vWWs50KTFMrZT3ANKAQ2HzAvYcsg=;
 b=G9QkTc57+PbNEnzb0v/IrML+b0zIlpk+f6/nuz5qU0LaA4TCRCSqN9+U
 WnoclRAM/ADzo2P4TeNmR6bLdxbQn1vocDbYEYQ4QB1yY0+VuGiZgQHyP
 0SEX+rNbcQrY2d+rARpwJOo9hB/9/SiP9/JmglM1UDitIQXSZseB4Uoi8
 ZM13bc3KHTaThwApZgge/OFJlhBG+bCuaftD9Aqfgt6d2ys5COfM1HE66
 rhlTzLQxWNR0fRhb+uad1Zz5YwABRg7fjJPSIdhG/Bx41dYAi5+sg4o3y
 mpxE9spQz/urLj4v6z7J1TBDQMWfduxOLnJ4u3rGFB+tQKoThbfJJEcj9 w==;
X-CSE-ConnectionGUID: dDywArSvQie+jBVy6RSrVg==
X-CSE-MsgGUID: i1oQ3XPAQHO2EiGJy+1fRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34475916"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208,217";a="34475916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:21:40 -0800
X-CSE-ConnectionGUID: M+63ze41S8mS7EjSaEgQjQ==
X-CSE-MsgGUID: rrxI5l+kShmHkj76yrtP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208,217";a="84083918"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.112.13])
 ([10.245.112.13])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:21:37 -0800
Content-Type: multipart/alternative;
 boundary="------------GA40KlZzDRfLq9WZhQrOUhVd"
Message-ID: <1698e1fe-2cdf-4659-9906-31ebf18fccc0@linux.intel.com>
Date: Tue, 5 Nov 2024 12:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Define resource
 types and provisioned range structure
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
 <20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------GA40KlZzDRfLq9WZhQrOUhVd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30.10.2024 20:36, Marcin Bernatowicz wrote:
> Add shared resource enumeration, provisioned range structure definition,
> and provide a function to convert shared resource enums to their string
> representation. These types will be used in a subsequent patch to read
> VF provisioned resources from the debug filesystem.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   lib/meson.build                |  1 +
>   lib/xe/xe_sriov_provisioning.c | 33 +++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h | 45 ++++++++++++++++++++++++++++++++++
>   3 files changed, 79 insertions(+)
>   create mode 100644 lib/xe/xe_sriov_provisioning.c
>   create mode 100644 lib/xe/xe_sriov_provisioning.h
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 3d5d68b75..3d459c7a3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -117,6 +117,7 @@ lib_sources = [
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
>   	'xe/xe_sriov_debugfs.c',
> +	'xe/xe_sriov_provisioning.c',
>   	'xe/xe_util.c',
>   ]
>   
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> new file mode 100644
> index 000000000..6a9ad411a
> --- /dev/null
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include <stdlib.h>
> +
> +#include "xe/xe_sriov_provisioning.h"
> +
> +/**
> + * xe_sriov_shared_res_to_string:
> + * @key: The shared resource of type enum xe_sriov_shared_res
> + *
> + * Converts a shared resource enum to its corresponding string
> + * representation. It is useful for logging and debugging purposes.
> + *
> + * Return: A string representing the shared resource key.
> + */
> +const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
> +{
> +	switch (res) {
> +	case XE_SRIOV_SHARED_RES_CONTEXTS:
> +		return "contexts";
> +	case XE_SRIOV_SHARED_RES_DOORBELLS:
> +		return "doorbells";
> +	case XE_SRIOV_SHARED_RES_GGTT:
> +		return "ggtt";
> +	case XE_SRIOV_SHARED_RES_LMEM:
> +		return "lmem";
> +	}
> +
> +	return NULL;
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> new file mode 100644
> index 000000000..7b7b3db90
> --- /dev/null
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_SRIOV_PROVISIONING_H__
> +#define __XE_SRIOV_PROVISIONING_H__
> +
> +#include <stdint.h>
> +
> +/**
> + * enum xe_sriov_shared_res - Shared resource types
> + * @XE_SRIOV_SHARED_RES_CONTEXTS: Contexts
> + * @XE_SRIOV_SHARED_RES_DOORBELLS: Doorbells
> + * @XE_SRIOV_SHARED_RES_GGTT: GGTT (Global Graphics Translation Table)
> + * @XE_SRIOV_SHARED_RES_LMEM: Local memory
> + *
> + * This enumeration defines the types of shared resources
> + * that can be provisioned to Virtual Functions (VFs).
> + */
> +enum xe_sriov_shared_res {
> +	XE_SRIOV_SHARED_RES_CONTEXTS,
> +	XE_SRIOV_SHARED_RES_DOORBELLS,
> +	XE_SRIOV_SHARED_RES_GGTT,
> +	XE_SRIOV_SHARED_RES_LMEM,
> +};
> +
> +/**
> + * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
> + * @vf_id: The ID of the VF
> + * @start: The inclusive start of the provisioned range
> + * @end: The inclusive end of the provisioned range
> + *
> + * This structure represents a range of resources that have been provisioned
> + * for a specific VF, with both start and end values included in the range.
> + */
> +struct xe_sriov_provisioned_range {
> +	unsigned int vf_id;
> +	uint64_t start;
> +	uint64_t end;
> +};
> +

Debugfs *_provisioned attributes carry also some additional data (e.g. 
number of ctxs or ggtt size) which is not covered here.
I understand it's not used by tests now, but assume this could be 
extended if there's such demand (e.g. some test needs it), right?

> +const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
Is this really required as an interface? Is this used anywhere?
> +
> +#endif /* __XE_SRIOV_PROVISIONING_H__ */

Overall, LGTM:
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>


--------------GA40KlZzDRfLq9WZhQrOUhVd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30.10.2024 20:36, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Add shared resource enumeration, provisioned range structure definition,
and provide a function to convert shared resource enums to their string
representation. These types will be used in a subsequent patch to read
VF provisioned resources from the debug filesystem.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 lib/meson.build                |  1 +
 lib/xe/xe_sriov_provisioning.c | 33 +++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 45 ++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 lib/xe/xe_sriov_provisioning.c
 create mode 100644 lib/xe/xe_sriov_provisioning.h

diff --git a/lib/meson.build b/lib/meson.build
index 3d5d68b75..3d459c7a3 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -117,6 +117,7 @@ lib_sources = [
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_sriov_debugfs.c',
+	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
 ]
 
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
new file mode 100644
index 000000000..6a9ad411a
--- /dev/null
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include &lt;stdlib.h&gt;
+
+#include "xe/xe_sriov_provisioning.h"
+
+/**
+ * xe_sriov_shared_res_to_string:
+ * @key: The shared resource of type enum xe_sriov_shared_res
+ *
+ * Converts a shared resource enum to its corresponding string
+ * representation. It is useful for logging and debugging purposes.
+ *
+ * Return: A string representing the shared resource key.
+ */
+const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
+{
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+		return "contexts";
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		return "doorbells";
+	case XE_SRIOV_SHARED_RES_GGTT:
+		return "ggtt";
+	case XE_SRIOV_SHARED_RES_LMEM:
+		return "lmem";
+	}
+
+	return NULL;
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
new file mode 100644
index 000000000..7b7b3db90
--- /dev/null
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_SRIOV_PROVISIONING_H__
+#define __XE_SRIOV_PROVISIONING_H__
+
+#include &lt;stdint.h&gt;
+
+/**
+ * enum xe_sriov_shared_res - Shared resource types
+ * @XE_SRIOV_SHARED_RES_CONTEXTS: Contexts
+ * @XE_SRIOV_SHARED_RES_DOORBELLS: Doorbells
+ * @XE_SRIOV_SHARED_RES_GGTT: GGTT (Global Graphics Translation Table)
+ * @XE_SRIOV_SHARED_RES_LMEM: Local memory
+ *
+ * This enumeration defines the types of shared resources
+ * that can be provisioned to Virtual Functions (VFs).
+ */
+enum xe_sriov_shared_res {
+	XE_SRIOV_SHARED_RES_CONTEXTS,
+	XE_SRIOV_SHARED_RES_DOORBELLS,
+	XE_SRIOV_SHARED_RES_GGTT,
+	XE_SRIOV_SHARED_RES_LMEM,
+};
+
+/**
+ * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
+ * @vf_id: The ID of the VF
+ * @start: The inclusive start of the provisioned range
+ * @end: The inclusive end of the provisioned range
+ *
+ * This structure represents a range of resources that have been provisioned
+ * for a specific VF, with both start and end values included in the range.
+ */
+struct xe_sriov_provisioned_range {
+	unsigned int vf_id;
+	uint64_t start;
+	uint64_t end;
+};
+</pre>
    </blockquote>
    <p>Debugfs *_provisioned attributes carry also some additional data
      (e.g. number of ctxs or ggtt size) which is not covered here.<br>
      I understand it's not used by tests now, but assume this could be
      extended if there's such demand (e.g. some test needs it), right?<span
      style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
cite="mid:20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">+const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);</pre>
    </blockquote>
    Is this really required as an interface? Is this used anywhere?<br>
    <blockquote type="cite"
cite="mid:20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+#endif /* __XE_SRIOV_PROVISIONING_H__ */</pre>
    </blockquote>
    <p>Overall, LGTM:<br>
      Reviewed-by: Adam Miszczak <a class="moz-txt-link-rfc2396E"
        href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a></p>
    <p><br>
    </p>
  </body>
</html>

--------------GA40KlZzDRfLq9WZhQrOUhVd--
