Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E20606A32E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B0Ztv3lP;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XTI1V05G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1855A10F0D3;
	Tue, 24 Nov 2026 21:41:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00AC10E74A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556164; x=1827092164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yEV5xZar2cyd6xtneIOYE3ycaOSAyE1cL28XAOafWMs=;
 b=B0Ztv3lPomFVSDTQXPcY+rNsn3f+kg7ELTmvAeF/cfsf9n6eck9itfq+
 PbBiT8Ng0iYwycnPI79i/l2EZvqS3S1N9ZbXJ7e9vJDDDuGetxjYv7gBt
 kXjP6PJ/96b8wPMQCpBMMP7ucCxRkdROE2b0ZscDl9mdZGp+PPded/tzc
 H6DX83AlrWdGeiIrBJjEPMag/fEb2j0TexWXYhztWOvCrWYpiN27+OOhP
 Qeh+PosIwOU4DvhqzS/ATRY1Lo0NX8GCSv8IpwvIir9S+olXRRbSm8KWM
 E9n3rbKPM5n8E9PPedEXZesOLI7gKuXmtRVF+eU0C2VKEZtSB+3+XNv7g A==;
X-CSE-ConnectionGUID: orCgwPndTxSj6riYArqmYg==
X-CSE-MsgGUID: 51qmdDRBQZKJYjGpQ0x+Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4336664"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4336664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:04 -0800
X-CSE-ConnectionGUID: 0zgw5cVWTUiwHIH7NLSoPA==
X-CSE-MsgGUID: Dr1iX7sBSvKWG5+kgdj9Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12011124"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:36:02 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouDgb+oC/H//CRyAcq7eNxVeXrplHU1/KLIrP99+y+I9GOG/PQ7/X76K5cuJ5MxBVAI/YfGrSNHV7+kuLpXkIPk66wHqhrODHF93bFPCL3CMv9G1InH481y0jSFenL4KepoUNlJDMXis+OCcF0GVLmGPxzpdLShRH+1jkYdBa4XXGv/jdY/ocHKkD3BhVsQNKRaTU9RJBP0TPZ8P38NFSxopRBixoNnGhu19iYlwrRofc5roY1fO+qjTiZsYkwmn2h7kq9lxGtDDik1ffQ9qjNpLaUsfTN5e+OJ9QY/krERyJnKl2u2O57ht917GFMQRID8TsbHeeIKCUMHDKiG59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DZJ6BKT4laapYm3o7vlFDsaPXdEyR/elUuRavA3OwQ=;
 b=ktIMFLX092XCSZk+tyFGWtFgBPUMmEr/Xhks0qLFE77GJC/7FXVyt4rV+Hx9jsg7XE4BXJKSnW6hcL2MQUUo107arr85PyYlowhnA/pf97ELg4UhLERkI+NhsuM8UX89q7l5mr8X8mztT6bY4rDKSh+9GFZxzk0Nzdwt/LuJJklZUSVWdokMz+5ymR75fBBF9zX6IHHNFwhiaPe0J00X3Byo+5LD4AAsprMBT2Hz78UIz/Fc/7P8H7ak3ROfHfymQbiKmZOsVRzeXxq1nFBOMsbsp4I99DIa0xo9YlF06akiQiR5UCToObGkuyvZMxHxO3u5x94lBMMmKCEpCU1muA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DZJ6BKT4laapYm3o7vlFDsaPXdEyR/elUuRavA3OwQ=;
 b=XTI1V05Gq8RRcG0+w8/idSNnL09aJpTee1GgJSCeR2NRlGEjpsWvFotnqRHtDf4oasi0SnNbhXhc2h5pj82XqG1GwdRkx1zWGyAzpIOahXU2nXEqXpr3+MJIZUXkh9fviPSbwz/3c8o0pUW6nSBrE51bj8V9p+Edf+A7ye4TaYE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:57 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 8/9] tools/drm_ras: Show retired pages
Date: Tue, 24 Nov 2026 16:35:39 -0500
Message-ID: <20261124213532.3674338-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: b0439c08-b33e-47bb-3d1e-08df4a72ec53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: flY0bigxYdD9HptN2tY2HMAGYfK7LMmMqF9UqahjH/spy2nE9PVpsCQ+7AYJagom+xHl0znvSmLvghlrYCipt4DsdZO0lCO5fm9/MoyYTiiC/+2T7aGj+fPzz+4zBKFu5qKoGAfzAG0Kg6svyGiIdp49JdVv/R9vlfXGadVaV7HcFgYGO7O0sY0I9teqmXh28b0uOLEkiWQVkhfHEtuXfzvgBPDT77LFsWLrslJGL6wszpHpO6Ez5RVVmZVvALbBCltI4Eno0eK3Gh4CMssNKqAHvHhl9imhWDQoD5wAzf/6+GgquhIpBDZ14uStvTHNi0ArtQDYkWQYVPpJBNWGXRqbz/Gv6zRb+36mk7hTa9NUouKNB3evXn5C1m0cQRmEHMwIGzPbxrjK/NIgGC6IBHF6y2/nMOLSC/vBMc90JTa3qSZbDpKQ7CnZXncp5nI/tGZhDgoEu4WdnGuUOXN3KOGnkbo+LJarlt2mSgq8hkKfBm/pfAp6slOagwFQWoADZpVSkgSBOteQ2JdvxZJvYh6IO/eF//1Uq1vlJsmELnSvkBVy1hNb2ET+EAsABnmnuPY2XrKtR3kzCw1pLwg4ZdE9ouqC3qdAcihqOb8aDt0wXdR9HtOxZW0i5P27acHQxu+2JuUSehzFEjFrOLsDR9pa2+FAz1DS1/StfTmY0gI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sRC6BFUFLBpr0/kJbqtgT5Uj7loY6FA+4v/TW2JNK/uhfN5ihczf1D6VNWw3?=
 =?us-ascii?Q?Hs8skpAePGKp0Rwkq5msTQdUTRZ39hNdSODdZCwjSvkmxTIZ7TZ6bbAzmaaI?=
 =?us-ascii?Q?+Vk4uKjVbin9Zb1x25UAaV5kv52NhzcUimmiOODXyjUruAo1OuBwz9eotTQ9?=
 =?us-ascii?Q?M9hJADTd+YlVWa2+eaSPjEgK48PmDg4NfdAWhbxKoue27Xbt+xn6B7UVGaxv?=
 =?us-ascii?Q?/71vcuKJ+tEqVCYGz5j0/f5sgm2wontGeuaUUQ3LZrjKacEtmTAJPQXvL2kW?=
 =?us-ascii?Q?NrqWr2+xmYlaBCp36gpAApmCEDrufM5MCh2ndj+NztKU6IjS6m0YYHLuGUm5?=
 =?us-ascii?Q?QmO1qRsfiG7+Keu6PSaoCIgmFFQl/iNjSTmIDJNzY2UpiMrYfx/rHbKu0ajJ?=
 =?us-ascii?Q?5/UKUBFf6fBbtUKEEcRWRtBSi0ONSa/3fCSig7JCAfPfoN/iXD/VSnh8qoyX?=
 =?us-ascii?Q?vSdStXHy1maXPzA4cGYuPCWGRBGm1hLdC5F7+OAQzj2oBK16jLgGQHwIVCOV?=
 =?us-ascii?Q?BhOhUZidG4K9ZMyUN511x8W/5eMuYFJjnz3c5De+a/ks46G/pBEtJazdDW3d?=
 =?us-ascii?Q?IOLLSB9OOuXlve6nLPS8HSVN4R8Mr5ua2YxGlAnlss2Q1jJ2SusKhXUFCnLF?=
 =?us-ascii?Q?kODW5SSK82uAwtHwyfiWFgbyaLFh3ZrrGpmHVxi2ifdwbicvYU33YnQG7oVL?=
 =?us-ascii?Q?qJgadwrertrTJeQ7Az81+L85bqCW9lQeuq/l3U/3pSvn3jCkqY7qRodHogZX?=
 =?us-ascii?Q?fQ99I0ug0kp+YwVnJQxD0zmGWw/EfeVGys26zLPckyG/4AlqzqFBSto5lerO?=
 =?us-ascii?Q?HZ6ciDnz7b6YH9+GjJLbEJCS7G9/6IAieCMJYAGyTlTf2V7mydq1j6NRsQZm?=
 =?us-ascii?Q?JmImm0V1bdG8nC1Bhs9kbLSFbEGXot/+mwYAqrEczJGjL56TZTd/ypcm+kCB?=
 =?us-ascii?Q?rotIzz0p1fzbF1ZcLou/DaK/2cbm3r7vRxujlf2w1UvINbgn5tiE9p6mzXYT?=
 =?us-ascii?Q?U7Uwkn3MgEYASWvGqwe3IydvzVdiy1XRh6uJ9hZ3NigcxYnlc4H2M4Lv153t?=
 =?us-ascii?Q?AfqN2UoxeaQbOBz5WDz/TMysklLrYGQfVKc41YR0gvp5JKdKZYmCN1s2z58L?=
 =?us-ascii?Q?vc+axtG1JbqHdM5f/ms08kfy7vGM9n7QRj9jrLE7cw0OMuiPTyOAGKSR6fG0?=
 =?us-ascii?Q?TiK1tyEuMGsIII5sU7M+hHEajswQSSAl0bFyl/7s8r+IRxqKmAAgGT4IedSZ?=
 =?us-ascii?Q?7HFE1ET17O9AykEDMZrLspHupskMHVZtNZspAONWBpnZVzqv8Q2nkSR7gTtM?=
 =?us-ascii?Q?ohfTJGwIz96umpKZofBQDuJ/e52/MhwYthyVBS8aMQYUFknY+N2tl/UKZt/b?=
 =?us-ascii?Q?dpYwTokVXOOi5BBWtAdIZv1OUM/eOCHtto63lQhMi/5deWrlmvErYxQKdJiM?=
 =?us-ascii?Q?vbw5v3/FoCMvN9TfFvD6rT+VVimOnP+74gKyXnqUUrtsnbjedsnILSHVI/tE?=
 =?us-ascii?Q?FKRSF72gXqNXvkpT82JEjzZVOPq307u1CnMtDbfvb3KZY25ExNmxDKvZjy/B?=
 =?us-ascii?Q?G3OFOFU7pI+4xASo7xYBIpzhJiRYg9nLt4OFZUnkqTIRJh6WGdvwe5cibkVm?=
 =?us-ascii?Q?nCWhK1i5cVddwOBPC0QKQiy5RoX/YXBF8S6Yc7Gu/EkSBfrh7PFelFz6DqjY?=
 =?us-ascii?Q?1ALmACCG8McSkq2avqhM6ECt5XnPUGUfVKxuvpnc1fXPT4gRUWlNFBZ8Z30p?=
 =?us-ascii?Q?GDSKL5qX/A=3D=3D?=
X-Exchange-RoutingPolicyChecked: RMi5T/qrsCt88Rz91RbPRq1QBCibD3YgKSmx0qHk5EScrfNJznMGqbc4eGQ4BW3ZT89N2VrCf3nv3xX+0+j4mRS2NVNRdoV2MLCE4C6oHRp+IGokb+NNaYqKFjQteWickHmSHPCCb8aEIByi6YH/XB+kuD3Q+gmMLJy3UV6v2CxcOpkWL1cybTBmXLAcp7yjDtTuMeMqWsMNm07j2EFhx5JFTcSdUQHFUXGFwiXEje7/KHdQd8mulPP8U/b26Nqy9HvLM5zvppSDapLeLQCtdBJCNnOxRZAtRuUvoSIsQy9MSbFMbuEEwLbSja2vEhOJVHTnz9xiGijdCuXDK6pd1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0439c08-b33e-47bb-3d1e-08df4a72ec53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:56.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqqO47+kgyZxU5sEoZM3js02y4lSnZSHYK/oZVZK28Fyy5yI0rDpQKX+n7eyeQVtuPp49uHyW83FZemmQZulPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For retired-pages nodes, show the maximum number of pages that can be
retired and one line per retired page with its address, size and
status:

  # drm_ras -n 2
  max-pages: 64
  0x00000002fb5bb000	0x1000	retired

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
index bfbd7853a..b77726b4c 100644
--- a/tools/drm_ras.c
+++ b/tools/drm_ras.c
@@ -16,6 +16,13 @@
 static const char * const node_types[] = {
 	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
 	[DRM_RAS_NODE_TYPE_TELEMETRY] = "telemetry",
+	[DRM_RAS_NODE_TYPE_RETIRED_PAGES] = "retired-pages",
+};
+
+static const char * const page_status[] = {
+	[DRM_RAS_RETIRED_PAGE_STATUS_RETIRED] = "retired",
+	[DRM_RAS_RETIRED_PAGE_STATUS_PENDING] = "pending",
+	[DRM_RAS_RETIRED_PAGE_STATUS_FAILED] = "failed",
 };
 
 #define name_of(names, i) \
@@ -40,6 +47,26 @@ static void print_error_counter(const struct igt_drm_ras_error_counter *counter,
 	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
 }
 
+static void print_retired_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	printf("0x%016" PRIx64 "\t0x%" PRIx64 "\t%s\n", page->address, page->size,
+	       name_of(page_status, page->status));
+}
+
+static int show_retired_pages(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	uint64_t max_pages;
+	int ret;
+
+	ret = igt_drm_ras_nl_get_retired_pages_info(ctx, id, &max_pages);
+	if (!ret)
+		printf("max-pages: %" PRIu64 "\n", max_pages);
+	else if (ret != -EOPNOTSUPP)
+		return ret;
+
+	return igt_drm_ras_nl_list_retired_pages(ctx, id, print_retired_page, NULL);
+}
+
 struct telemetry_fields {
 	struct igt_drm_ras_telemetry_field *field;
 	int count;
@@ -139,6 +166,8 @@ static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
 		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
 	case DRM_RAS_NODE_TYPE_TELEMETRY:
 		return show_telemetry(ctx, id);
+	case DRM_RAS_NODE_TYPE_RETIRED_PAGES:
+		return show_retired_pages(ctx, id);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -148,8 +177,8 @@ static void usage(const char *name)
 {
 	printf("Usage: %s [-n <node-id> [-s <field>=<value>]]\n"
 	       "List the DRM RAS nodes, or show the content of one node.\n"
-	       "  -n, --node <node-id>         show the error counters or telemetry fields\n"
-	       "                               of a node\n"
+	       "  -n, --node <node-id>         show the error counters, telemetry fields or\n"
+	       "                               retired pages of a node\n"
 	       "  -s, --set <field>=<value>    write a telemetry field of the node\n"
 	       "  -h, --help                   show this help\n", name);
 }
-- 
2.56.0

