Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B43C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C90010E366;
	Fri,  3 Jul 2026 14:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1Go/kNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C8810F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088949; x=1814624949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5JENJEkVZID5XI8ZaZuFX0Y4NYlAkAMauVXxP1xrAcA=;
 b=f1Go/kNVIZ3cYXv0iZ7Utc/UeZmdZR7F/4WgGE/RmbaU8bTUeV7o3MTH
 L3bvaufU9hu64gszHZDgsA0EPyhPPM4N/N3mmCQWcNntWSsyrBDfS22/W
 bdZFLzVaUwcF9DO2N+cUsyxXDLsptTHXCQGVyN3uGzi5hBCd2wSyVHket
 moOSNAuP9NqAxv033fpOpEb4l06ZbNloUzlPZjvBqPA+5cFsz+aYg8ZhP
 BdIgmiMS9ed6DQ2JXUpTwtvsOJSmMdSkKCO5UV8Ir8PncM8Q5bba1HiDW
 PaXLVMYkgWXiK9/I4KiiELH8HDr+huvaV9NviVJ5OhCg3TmsEdnRXNvqd A==;
X-CSE-ConnectionGUID: usz7elMlSMeCxS3AXxOFyA==
X-CSE-MsgGUID: cL+dutlXSrK5gqZwb7szNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="109389122"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="109389122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:09 -0700
X-CSE-ConnectionGUID: cMLQDZEzR3WDasbwnDOVGw==
X-CSE-MsgGUID: 5G1qMEWVT86PdonBdgz5Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="283209531"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs8o57V4OMwmsxelYUoFSqEhTcgwOtciQFn1iUM4nK1SJHXB8fPtH/kRL6CpC2s0BMD0d5QBh2PgBdqh8Tolz4+qtQtioiMbBHgJTzwt5+uyAh1uIk8Qj1+Tm2AEaKjhQvXncCHlaJiBG+9fuYqJuoEnUHgY0BN8jSlEXZdKfH/FwMkLSRKXkPOhY1i92ytiS+gzu5ya10BMLlzFRn9/CqzXVcREUMy7qLUkvcKNN4P3fQfiLbV4D0jzUUqNrwe4Y2r34E4VD5n5ozt8PFIpOLBK60Dwp11GMfnkci9XqNe1vHZbDweaHjH7qT0+KPik8nEQ8ouJ1Zuk9WeMk0oR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRjlknyIhI5RRzqzy/qt4bse/tuMedZFw9lCxnrKpMo=;
 b=a3i9Sj/Yed717M48fo64/+cxdDjw+PZ6N6EWRskUNzpAynmAfTXG+3kGzT6LS0PHz6KZXXfaY4kd+SyM3K/kaHinhETHVVEkHYrzl5ntqnt4MBF6f5dywJwtiyMcRyCOOQqSvllvNDGchQlaqlXsDI31YBN3kpdwmzqhHDbG3CmtxqfgoMOOU4XqfkNBQKXvhxC3ybSWFif2tqptOvnONJezBsvg9wLIV+wYVQOsL8mRHfzvLHVR0KFWynilrpfkkdxO0FGF9yc4OGXDd/nEuXf4apJZYs8dN0dRiqGxNlRhNLGZwYwwH1FT63oM0wvbe3E/LGx/rAkN67kc9+FdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:06 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:05 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 14/31] tools/intel_stepping: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:48 +0200
Message-ID: <177eb7b1b1bac7df3d653a207beb326023cb32ba.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 72aa118f-327f-4f91-ee17-08ded90f6f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: V052t0x7XGXiLyrE8vAEszkT8gMdJYnF6ZF/Fa7IPysWNO1GTNRCNEt9C0wH/FmqxTpPQR52Cyc4QGfpROu0gvtupOLUIea+N39tyPsxw9m9abJ87BRbCbr/ikBdH40ogQZLwHQQzsOSJsoPjBM6RR0ne6NtF0P+M2TzhWKqSA0Mfu12l9RO5zDomIX6R1qy5n/cPCh7eRuBvgbX9Dy4Ut3amfXfDJnfklzoIKkfn9aubSzL1QbStVJ/ITZs6MEXzgUb7b51+05etEUCpnj30Vp9Pu1C+ZmN6dw6kpvv1zvqkdSpSbDDl6IPk5s4pMP3Lmtb2u+QL8/XgzQeTW7fZ/wDLSUWjdxSN+zH3hV6NK94AlYPfXqv+5dO1F33MLuV8MIVxiXV3WfuwlQPGdsOHiyKd6B/6xnUZy1LA5t0M4uwSwlMQ+MIhMz3Agy9SZLh+vVJvrQT51hEph6X9ZjxmmhdxGM9Iem+tys00sLLB8rxxiohlZaxcCU/3xbB3wy0HJlqFH5Pxf/1vmuctxt30I62kLRZ2eCm4Uo3CcLzkpVYGWHDhMfG+jerKXCvYybK74QE8xEtUxF7TMy0x6zbtOrFI7QdQgjOVz2yDVUMZNrmlq2ktW60fdtMq2limCAtfA5PoqfTpK83qDhh0dVdpLb6z62q2iD3sxf0KnJBLLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?roei0wIcEeRJdsywGd3usDlglRhcGcRB0gHykKSVHa78c1FSrS24Tr30LiWK?=
 =?us-ascii?Q?+oDyzDxte3ZLuP8as0dRUUg33f8DGnkSOvRNg0cFoVYPSaZ53lEpaomkdqYE?=
 =?us-ascii?Q?lbiIRwcesqvGSfDOazDWsqlJ/AEEUgX72MwITEOoNAzAdryW8AtzZbSEUpLi?=
 =?us-ascii?Q?X+EWbuRGwJLrdEG1WBRpOR3VFJ46wh+vvsqPc1dC5yusOl0c1s636yOEoKDa?=
 =?us-ascii?Q?FqneNLA8+1rrbMRWwS8Nj0ZqCYKmEGl52vtMl6cv3V57w3edh0B7+nd3sYRJ?=
 =?us-ascii?Q?rpJ5pjRRSvQrDu5zNYw03LZdGhVruSD/hkFZD0CbjsWUw5ZtdzVGJ+am/QX5?=
 =?us-ascii?Q?J+no8n+Agy+kHYuK8zG0AmN20s9C4/bDkvHXvjddDnvmAyCEplK/EdCdPdH+?=
 =?us-ascii?Q?NEdk4hbdF5Y/RIRrGukUoovZnupzNpMFU1m4Md4kLKj2dH8+wM2BR2VmT1BY?=
 =?us-ascii?Q?i/7SlybaY4PP48jSFfVNg2rW6svc4k64KSYRDB2bfIYbQWhkiNCyhJBhqf5w?=
 =?us-ascii?Q?Fae6yEm42TusPgQ9ZOM0o/kKu69KlaqX5ue7rL0nYH73UZn08tP058pgkVoh?=
 =?us-ascii?Q?lL8jY7QdT5rlOmmCEiRo8ExFQ5x0uYt2ZebELJ4R1sOQYxv1HL/+6yedJJmD?=
 =?us-ascii?Q?b4ws0GydKzjwDyjMLX4O7eH0jOHjucFm6oRsE+a1Qcx3qJnn4TSrHWmfoiWL?=
 =?us-ascii?Q?IyI2oT1R2CjPN81vR4xeUyl/pad6k6BXS4XbIaxLYM+JpbtmHyvgaKEa5VVm?=
 =?us-ascii?Q?RVtBa9VjxuasRn+LhDBJ/U+QFmA3YoMrksfiGvBIoNxi9n5iwLLWviLmFJNs?=
 =?us-ascii?Q?5TVMcOQZOsdpnd81G+njPIXXoOJzyfV/FEEcYUSoHfme5MgHl3KuO+cnhGCv?=
 =?us-ascii?Q?hSmkvw8L5fuAGJ4buRNooeq4I/NOh1L2qKHELE+TijXznV1lPZMJPTouIFlD?=
 =?us-ascii?Q?B8KZ/gGmO/KsNjYUPCakrO812lh3//V+mz6hVmPUSclUHTVpBXoKn09yRHSn?=
 =?us-ascii?Q?WRYg5cS4amzIHVMMcGDRxCKL7P5LtDGCEhDJy809JUdjufVSia/psMG4z8LD?=
 =?us-ascii?Q?9DIhntZ2aKfBoeuOMsHSQu57ZCeh03zzi15cKPyfGWrESk2WnPqRt1aBWo93?=
 =?us-ascii?Q?Nibd3HMtqM7JRc0Txnjwkh8Nii8nSQFMxAJBW9xfOJNr+X/6rAlBJUoxf/hg?=
 =?us-ascii?Q?hKQq54UdaxzW07ufxHNB0sYNTNcMzwhJsWHg5e6uQrSsbZ3HkZ1dE3/xCnlK?=
 =?us-ascii?Q?1W51DQxo2RA4Fvh160/qFJ8tjLbQiqkVmu8oDlQRXQMiCMPIThEeBPLjEOwQ?=
 =?us-ascii?Q?N0HRYJytNygXnJ0OySg5ZrAFWPxYJAe9wL6jM7kTRx+fyUDPUj1E7oB7xr3g?=
 =?us-ascii?Q?jX9l3Px+96XIXAKze+kyr79Aoyd33avCPaXg1IXaqtsllp+xNxkJJAcwOyNm?=
 =?us-ascii?Q?K6/mEFkNJCUaHBVBAKQcs2gNHtrZAFY+s/PVEIuYLqOCwVRqJ3B3kIzUlml7?=
 =?us-ascii?Q?k5ay8khLOrCOON2foOrPFI30uL7qxGhc5JdqfvX3nkk2Lcowhp0R0bLKPyxA?=
 =?us-ascii?Q?AVibHHdp6puSTWc8umnniIk/2cPrOs8QjkWIsqhmKI7aXcgWjFJ/Pcw7pdWo?=
 =?us-ascii?Q?B1wT7CdSJEh8JFMlbGCP6RYOu913App5qFLSCtbLmJOKKdYReZoBdmtlofDG?=
 =?us-ascii?Q?CTduMAFuGV051yfAQDXuQx+L/k07iWWpNPD9cXXSh8CkGuTwCY5FJjTvHRAQ?=
 =?us-ascii?Q?12r7N2TROkV8fsD6iNziuAvlU4CIdog=3D?=
X-Exchange-RoutingPolicyChecked: qizgbzK08izFn/363H9rlN8rzJQqUknvJuLhAGzSSyVToMrjLhNXx+V+d7zKVSi1Abt+XQOXsbmFNy5ctMP0pwer83T0N1tKW8aGLtLGL5iHZ7NdWtLgE807wX2/ZbZw9IiPZg5DiTl1pKt5x7uYEhlYp3cWjhenTf8kxePbeDGTKsIVabBYXd11J1Ee+EFXcZ2GY9YGik46djwShabvvtWVrvo9sj6t5vhaZB4rcgfF+v6eoEli5fqlaP5tU3rkyIrSj3sDW2L8lKehj6TARjfjd4+0GzRmN0y3HIMEfqKvOc3MeWML5lorn7MPt5UyNBnV7Ds6OMsexHPN8zmpNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aa118f-327f-4f91-ee17-08ded90f6f76
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:05.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUDQ5xfKAD7gSWmRIe0AUESvM958EzPH8HysTIjkqZB3pdAg87/BTsLPQ2U+DbPuZ/JfFYvgPd4JxMOiRqoUch/+hFj+yErAKPS/Qhe1Q7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
X-OriginatorOrg: intel.com
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

intel_stepping only needs the chipset tables and the small tool stub
support used by those helpers, not the full libigt.so stack.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub and
libpciaccess.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 01400f53e..8eb346321 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -36,7 +36,6 @@ tools_progs = [
 	'intel_pm_rpm',
 	'intel_reg_checker',
 	'intel_residency',
-	'intel_stepping',
 	'intel_tiling_detect',
 	'intel_vbt_decode',
 	'intel_watermark',
@@ -70,6 +69,12 @@ executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_stepping', 'intel_stepping.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
+	                    pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

