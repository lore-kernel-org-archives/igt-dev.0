Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7DAC25B7C
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B422D10E309;
	Fri, 24 May 2024 03:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMPQ9Kk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFF410E059
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520489; x=1748056489;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rK9fRYdqWhAldYvRB7PY/4wYNsBYbVb82RRMdluFEbk=;
 b=HMPQ9Kk+wLExpJAMHgQK99SidaXrGtC5htdFLaT5cAczvXlaXlFu6PGL
 A99LXT1Lrq8FYFJXqNrzL8Av0P5Ev6m+UWDqhugIh5sgHs4i4GbyyiCzf
 /z3QJjMyG1LmOeGgZ0EUJx4OHBMATAxZyqDMfPuCi95xLVtwejIOw1SMA
 YftqUTipaw5j59CioG3xl+Eyj8NE9I81Zzu3EqHCeLRBTNBGNngcZ990M
 SaEfRgE5j0lB+dn5ITupnOZ7Sqn3GSDey9Dx5j8/kCPzr+JV5IMz6ltES
 9i3GxjWdk4iH2UZuIgSMc/ViNRvUGcpbzZ51ZefeUpfcS31uez9jHfX1v Q==;
X-CSE-ConnectionGUID: 6/Zki3xPTlaYaMh7JhFRrw==
X-CSE-MsgGUID: RPYANBrbQaGuAhnJPA9SzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384623"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384623"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
X-CSE-ConnectionGUID: HKvXqfgcR+yXwpdoqI5AFw==
X-CSE-MsgGUID: 1duK3qpjRHK73ALg/4923Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413513"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/23] lib/xe/oa: Add LNL metric guids
Date: Thu, 23 May 2024 20:14:18 -0700
Message-ID: <20240524031439.106332-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
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

$ update-guids.py --guids=guids.xml MetricsXML_P31.xml > guids.xml2

And copying the new guids to guids.xml (as per the README).

Note: as mentioned in update-guids.py and README.md, in order to generate
config_hash in guids.xml, mdapi-convert-xml.py must first be run (as
outline in the next commit) and then update-guids.py command above should
be repeated.

Note: LNL media guids had issues after running mdapi-convert-xml.py so have
not been added, revisit this.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/guids.xml           | 14 ++++++++++++++
 lib/xe/oa-configs/oa_guid_registry.py | 16 +++++++++++++++-
 lib/xe/oa-configs/update-guids.py     |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index 510450f87a..27330edd3d 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2746,4 +2746,18 @@
     <guid config_hash="482cebdeeb78bb56e67b42d24644c8db" mdapi_config_hash="11e33e01a371bf15e59b9786f4fe1050" id="4d9b2817-19b9-4461-a54b-dc9fdb7d69cb" chipset="mtlgt3" name="MediaSet1" />
     <guid config_hash="5bfab887a79b99cf34a606dcca5f4f8a" mdapi_config_hash="1c238e39e5c73eefd870cef2fb7a18af" id="651a6694-0ac1-4bd5-a4a1-94bcf479d4f4" chipset="mtlgt3" name="MediaSet2" />
     <guid config_hash="44bcb438bea8b46b57779739bebfbd69" mdapi_config_hash="fbbd97d1f3b60c17eae57bbd3c42e7fe" id="bac01106-5869-489c-a306-67303a434173" chipset="mtlgt3" name="TestOam" />
+    <guid config_hash="208c3c79f1b4db2f86277292566d3f10" mdapi_config_hash="1fbaf5ad061ccf96ff7d4e108cbcf3ae" id="12f20772-0044-44ff-bcc0-d2bc252d140e" chipset="lnl" name="RenderBasic" />
+    <guid config_hash="b781b616d31187e7f4982f3a238b0ecd" mdapi_config_hash="35c121ef361006ca639d1e3377b5c6d7" id="72539be3-67d9-4101-b067-766b7811d2bb" chipset="lnl" name="ComputeBasic" />
+    <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="cae0b2ca-c52a-4111-b8bf-5af070677d57" chipset="lnl" name="DepthProfile" />
+    <guid config_hash="55ecb5067bca7d99769a30a14eaceba5" mdapi_config_hash="e444af605670c2230a5796b4ad65b2c0" id="70cc56cf-3a37-4f6c-8911-4455fe441b2a" chipset="lnl" name="DeviceCacheProfile" />
+    <guid config_hash="e4a38cb223b20b9c28c5941b2f4979cb" mdapi_config_hash="952b726980ff7e836089c7651070f44f" id="01ffd51d-a6d6-4ff4-93d0-619f04c3a547" chipset="lnl" name="MemoryProfile" />
+    <guid config_hash="5d38d137356ca80dca2ea337449675be" mdapi_config_hash="07f0aa1a93f77bc7b6771ba2b68c8325" id="6791470f-f1e6-4f77-9013-bcb0c4be6f57" chipset="lnl" name="RenderPipeProfile" />
+    <guid config_hash="72e3ab9e7d727f97c5ea29bef23be40e" mdapi_config_hash="e6b78fe68f406ee2a0cc25293c60bc62" id="d66ce633-4ae5-4de2-8678-9705adfd45bc" chipset="lnl" name="RTProfile" />
+    <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="e7338926-568c-4424-bc44-f90318a6b472" chipset="lnl" name="VectorEngineProfile" />
+    <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="4ccd6535-fb9a-440f-b0f5-882879dc4cb0" chipset="lnl" name="VectorEngineStalls" />
+    <guid config_hash="9df6fd1c4fd100b5e50cd97e16bd1cb8" mdapi_config_hash="47c19557fd9591c3fc3955e46db4565c" id="24c33f2c-f8d9-40d9-b2db-64e863b4d625" chipset="lnl" name="TestOa" />
+    <guid config_hash="9bfa717fd19e8d5b99062ca0101113dd" mdapi_config_hash="f390ce860d404c3f22f9d1a3159ec58e" id="0af24f48-05bc-467b-b561-33dec252e651" chipset="lnl" name="MetricSet1" />
+    <guid config_hash="d635631df97322be3d97b9c4e38152e9" mdapi_config_hash="68c19075e48e5128b456a91cd7b95286" id="914ad901-832a-4ccd-a21e-ddc7690ed213" chipset="lnl" name="MetricSet2" />
+    <guid config_hash="d63d186f5b83e91f8c0680847bbf4b24" mdapi_config_hash="d31ec4eaa11c8be0d8d72ecece53434f" id="3b3c9f55-e34b-423d-8c05-7b1af03b6685" chipset="lnl" name="MetricSet3" />
+    <guid config_hash="76b7587d047c30ecde26e3f6253b4165" mdapi_config_hash="e39d956ed7b8d0cbe7d354cff234af7d" id="e6f21065-a6f5-4ea4-a545-80d6aebaab56" chipset="lnl" name="MetricSet4" />
 </guids>
diff --git a/lib/xe/oa-configs/oa_guid_registry.py b/lib/xe/oa-configs/oa_guid_registry.py
index ab14b398f3..bc265cc689 100644
--- a/lib/xe/oa-configs/oa_guid_registry.py
+++ b/lib/xe/oa-configs/oa_guid_registry.py
@@ -100,10 +100,24 @@ class Registry:
                            'DG1',
                            'ACM',
                            'PVC',
-                           'MTL', )
+                           'MTL',
+                           'LNL',
+                          )
         if name in known_chipsets:
             return name
 
+        internal_chipsets = {
+            'P22': 'ATS',
+            'P24': 'DG2',
+            'P25': 'PVC',
+            'P26': 'ADL',
+            'P27': 'MTL',
+            'P31': 'LNL',
+        }
+
+        if name in internal_chipsets:
+            return internal_chipsets[name]
+
         # Unknown HW
         assert 0
 
diff --git a/lib/xe/oa-configs/update-guids.py b/lib/xe/oa-configs/update-guids.py
index 0c7d129404..18f3458e84 100755
--- a/lib/xe/oa-configs/update-guids.py
+++ b/lib/xe/oa-configs/update-guids.py
@@ -165,6 +165,7 @@ chipsets = [ 'hsw',
              'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl',
              'acmgt1', 'acmgt2', 'acmgt3',
              'mtlgt2', 'mtlgt3',
+             'lnl',
 ]
 
 for chipset in chipsets:
-- 
2.41.0

