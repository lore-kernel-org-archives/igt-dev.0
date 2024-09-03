Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ECBCD3430
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 13:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA0310E5A8;
	Tue,  3 Sep 2024 13:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dN4k9ZPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FED10E5A8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725369903; x=1756905903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jsdsxV5bgCwBZ5G3yQd+OsnbX6IXfrLQZ/KGW6ZgYVA=;
 b=dN4k9ZPJqH7AtxwvYctYPzvihB8BJby68hBKOtGLzTkpATWRwFz3/Wr6
 6Wu1wpI6QaJmNEfKvx5Ur/kVyOoBJ6aU/rL+LR2CBt7Nvxi+E9Ja/16C+
 UVFs3Fm9c8hJnT625k4kKk/QbmM/sTxihOEvTkns46l7mKCMDk54AX+3Y
 /MwQgQ/gzVIUAftQ732HIVeWvlz/xBn9JO8+v7R4Ing1WKF3hWmtHiDvf
 MmJb6TPiBnN8P2RSCIYWgxcB+wnft3YojJx3qOhlIG9rjBp2yVOf9qBfY
 meUKn3tfrE+ste6H43/qBwdB2+z7kaIhQ2PGr/jACFmBsUJsn4i2yxrjC w==;
X-CSE-ConnectionGUID: Uc6eiYHAQsa4KY2qrPtRrA==
X-CSE-MsgGUID: ZrBlVOKyRU+NL4yFzrpMdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23842605"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23842605"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:25:00 -0700
X-CSE-ConnectionGUID: aw+SZSVCQU6RuUsiaMNuLQ==
X-CSE-MsgGUID: OW19k0i3RbWKuDdTJafFeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="69540749"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:24:56 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t v2 3/4] xe/oa: Update scripts to support BMG
Date: Tue,  3 Sep 2024 06:24:35 -0700
Message-ID: <20240903132436.8337-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903132436.8337-1-jose.souza@intel.com>
References: <20240903132436.8337-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/meson.build                           | 1 +
 lib/xe/oa-configs/guids.xml               | 9 +++++++++
 lib/xe/oa-configs/mdapi-xml-convert.py    | 1 +
 lib/xe/oa-configs/oa-metricset-codegen.py | 2 +-
 lib/xe/oa-configs/oa_guid_registry.py     | 1 +
 lib/xe/oa-configs/update-guids.py         | 1 +
 6 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index 4af2bc7432..1c83bc5c30 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -417,6 +417,7 @@ xe_oa_hardware = [
   'pvc',
   'mtlgt2', 'mtlgt3',
   'lnl',
+  'bmg',
 ]
 
 xe_xml_files = []
diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index 27330edd3d..dd912d00f1 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2760,4 +2760,13 @@
     <guid config_hash="d635631df97322be3d97b9c4e38152e9" mdapi_config_hash="68c19075e48e5128b456a91cd7b95286" id="914ad901-832a-4ccd-a21e-ddc7690ed213" chipset="lnl" name="MetricSet2" />
     <guid config_hash="d63d186f5b83e91f8c0680847bbf4b24" mdapi_config_hash="d31ec4eaa11c8be0d8d72ecece53434f" id="3b3c9f55-e34b-423d-8c05-7b1af03b6685" chipset="lnl" name="MetricSet3" />
     <guid config_hash="76b7587d047c30ecde26e3f6253b4165" mdapi_config_hash="e39d956ed7b8d0cbe7d354cff234af7d" id="e6f21065-a6f5-4ea4-a545-80d6aebaab56" chipset="lnl" name="MetricSet4" />
+    <guid config_hash="cb471dd20a7c853d00899dc7ef33aa0e" mdapi_config_hash="4583b70c638040debcfa88563635b0f5" id="f05e23fc-913d-4ab9-ba9a-43beb059a18c" chipset="bmg" name="RenderBasic" />
+    <guid config_hash="230eab6aa4f36b6de10357fe5f951d46" mdapi_config_hash="8eb3576953c1d98c1637128b495f8fa0" id="c7383a12-5c52-47a8-8e42-11b24d64d1f8" chipset="bmg" name="ComputeBasic" />
+    <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="a80e9da5-d2c9-4c20-9f7c-c0adf74bbe89" chipset="bmg" name="DepthProfile" />
+    <guid config_hash="55ecb5067bca7d99769a30a14eaceba5" mdapi_config_hash="e444af605670c2230a5796b4ad65b2c0" id="d8bb1c75-31d8-41a1-99db-99d98be17e78" chipset="bmg" name="DeviceCacheProfile" />
+    <guid config_hash="3dfc710d13968f4398a46cdc3b6549db" mdapi_config_hash="b2c033ea452ef7f46322932fe5e0cfe6" id="d2e403f3-4c94-4b1b-bc09-f472a43251a4" chipset="bmg" name="MemoryProfile" />
+    <guid config_hash="5d38d137356ca80dca2ea337449675be" mdapi_config_hash="07f0aa1a93f77bc7b6771ba2b68c8325" id="dad0d2c6-1290-4d50-a6aa-8b8104204232" chipset="bmg" name="RenderPipeProfile" />
+    <guid config_hash="72e3ab9e7d727f97c5ea29bef23be40e" mdapi_config_hash="e6b78fe68f406ee2a0cc25293c60bc62" id="da09a8a6-802c-48bc-8f3a-35834c9b8ba2" chipset="bmg" name="RTProfile" />
+    <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="dfe5251f-af3e-434c-b627-38490f2213da" chipset="bmg" name="VectorEngineProfile" />
+    <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="d008dcae-2a82-4929-a94d-2ba1e9c569d6" chipset="bmg" name="VectorEngineStalls" />
 </guids>
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index 602a3965af..df6ab3f9cb 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -207,6 +207,7 @@ chipsets = {
     'ACM': xehpsdv_chipset_oa_formats,
     'MTL': mtl_chipset_oa_formats,
     'LNL': xe2_chipset_oa_formats,
+    'BMG': xe2_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index 5fa12f9caf..8816c0893f 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -138,7 +138,7 @@ def generate_metric_sets(args, gen):
                     metric_set->c_offset = metric_set->b_offset + 8;
                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
                 """))
-        elif gen.chipset == "lnl":
+        elif gen.chipset == "lnl" or gen.chipset == "bmg":
             c(textwrap.dedent("""\
                 metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
 
diff --git a/lib/xe/oa-configs/oa_guid_registry.py b/lib/xe/oa-configs/oa_guid_registry.py
index 969d40e568..4b07faf59c 100644
--- a/lib/xe/oa-configs/oa_guid_registry.py
+++ b/lib/xe/oa-configs/oa_guid_registry.py
@@ -102,6 +102,7 @@ class Registry:
                            'PVC',
                            'MTL',
                            'LNL',
+                           'BMG',
                           )
         if name in known_chipsets:
             return name
diff --git a/lib/xe/oa-configs/update-guids.py b/lib/xe/oa-configs/update-guids.py
index 18f3458e84..5a099a1587 100755
--- a/lib/xe/oa-configs/update-guids.py
+++ b/lib/xe/oa-configs/update-guids.py
@@ -166,6 +166,7 @@ chipsets = [ 'hsw',
              'acmgt1', 'acmgt2', 'acmgt3',
              'mtlgt2', 'mtlgt3',
              'lnl',
+             'bmg',
 ]
 
 for chipset in chipsets:
-- 
2.46.0

