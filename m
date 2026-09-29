Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70FDCA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 11:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2E610E9A1;
	Tue, 29 Sep 2026 11:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBNWq1Lb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EA810E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790682304; x=1822218304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UzP9owwdq1E57fgD9xRPhRZBJw3uJLiZbq1z6V+8jks=;
 b=ZBNWq1LbICysIY3fTcE2TOr0rQRbpEe6bSY1HjeNhmicnZY0TXb3f4Do
 5mp1w0DFlF9f95AzfOHYq2V37y9aOf1KFsdar5zR2zTjIk3l+oX3PsIIH
 EU78IHT320BTPzu7HzuD18HjSvGCREP/W4j4AtvNcQy3Nb6VtUxlG03FA
 Cm1dnifvcfR/U2FCA+1tZizMQPFCp4+TFgXapBi4WQy/AO41Y7NsQWmnn
 jggGqPxnUn6jjp6sAdsWa/8zsy6sKS+rY+PommLeLuHt8oqFp+DzlLGVG
 Ag2urU4XEKdT6KCuYNNMkgMtS/JYjMTZA8BtxzyIvk8dDxywSUOPibAvq g==;
X-CSE-ConnectionGUID: m9v+p3MRQcqph7/bmGkQHQ==
X-CSE-MsgGUID: BHMQG6lIQ1OIFbDXBoBUVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94109548"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="94109548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:45:03 -0700
X-CSE-ConnectionGUID: YWHkJSy2Q1qQAlXTXHtnbQ==
X-CSE-MsgGUID: gSId/hTFSySd3cQMvlgaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304843684"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:45:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:45:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:45:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgGYTuALDbuCBhw9J17KCl7a/R8XM5VFQyLzbs8149B2u0WEjxiIoCx+wIAwKhACa6u+zyQFPTW4Ge1mJwLAXEOa2QNXIO7Zd5A/uKIctRncKamUR3yPCXCCK6yhfZf/A+IVsV/IGcq4yafpSWehgZNKmhFTOhN+MZ9He4bzKXfrfyXXaGci04JpqYsSpDZ5WaSqd/Mo4QKpz2QV9g1ngtzbRLWyNd1HwAr64PCpzvsCDqam3WTi9mm6W1Klf6hr/yXhxLMIjtTKOcH7V1dQDWGYQUMdpH1EhpT1L54GFl3wYpKlrxwUPGPPkfPMZk8tOyIHHYVhURHREIfIGUJNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g084+gzAR5rhp+z0N4woT/pb2qLrEzDf2K8fj3wUgTM=;
 b=lC63V+tLsYdfpvnyseF/gcKdvOp7+IlFJuyDcG7aNJymFSr9pmhJkJg7vhWfrSw0QNGr+fA1h2oRDcQDsPVcCfa7Sh0aio+/bYUZpCI1SUnBDh4AsEvXfx0BgW+2SsYS9JsjerahA7F2dTLlBBxR8HNArqJdmDhiM/PuE4hRuxeQ1wsdCn0eCoz7/sKzLuUYf6CxHhAUaS59TsdB1ViKOCLXH7HMBoVs+MflAD8ZNTLIq+zWnfrxUuFR0M8YBWmyO1KZ4A5s+xfYBp2KidAhRy7fwwGpsWDhzH0Aj7NbF2sErrD/bmpUhvbz12vdhNecwC19DHN5liYcUxKsMHrknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 11:45:00 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 11:45:00 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH v3 3/4] tests/sriov_pci_config: Add optional capability checks
Date: Tue, 29 Sep 2026 13:44:34 +0200
Message-ID: <20260929114435.2961154-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
References: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008A9.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::649) To BY1PR11MB8054.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 8664f464-23cd-4605-25cf-08df1e1f17c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: e5uEC64+0WZa9JcNtiYAFdQCwUdT1KXsss/jTrArNYdMpjVBcGplrtg8PMwLmy4AmAllAdjAMxj3v4S0KJZqgRHoPLQC0gCOxeteUCTHbJ2SL821sHRiSuTJoqAcdBXgPNn2tpQs+piU4R0oWayOuZ8Z5viFAyMWn0sCqAs617HPHnjP1+FJQiwTE6GUySkPUG4L2VESvotz7Lr+Ia+SpCCQgDLWWi7drl3K9ZBOK3N2fvgS31PsYsTw9OWn5afajJ3lYfxqyEj8zn+a3xqifx3R3TyEbu/5xWVPMWAGaqwWnV75xV4Nt4x0ZRH0VftZFpjkCkbdis5ia0CpeOMDNC2A5r9gItObKRjRKrja7DPhwYMwcRpauKfEGk0ZqeRBKdJ3q3hTZZ2Qri8H9chLFZgT8rEQ6CvGB3WsmB/nmh2y5d9C4nZKfjQhmzMvYgrHZ2yTum59CFfsYxFX2V9BFAnG5r/zBHk4lIovCknObrlpmsVbtbFT2yW605bSkOpD3lmwEsrtj+Go6xN5iCLV9/rUDTLua1o8XjKwUYNJ/x4KECot9vcFYea9ajkqjcq9XXLEoVAfwcd7IrtnlSuHrgqd9wkzDnTmO2AzkfmpzrWRPuR58rqh+HWF3UcZvgLwxZffvu2c8fein0qJ91INp3Mk4ny5i1LvHVoWdMvBVfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0lnV3NMd1ZuYTYveDk3d2hVdHNWUnBxNyt5bVNHQWFYWC9Ga3diWFJRS3Yx?=
 =?utf-8?B?T01YUHVtWlN5bXlUbUJpWU5HUFVQaXVDV2ppYmVOZklBaFlwMG0vcGlSYyta?=
 =?utf-8?B?NTBZbkVaa1Y4ZkpDcEZhWVJyb3VOMENYcFd3RTBCSzZueHhFUUwzVmltZXdk?=
 =?utf-8?B?aGdsUnZ0a04wVk5GalY4SU1vREZkUWVPTktDSi92cjU2dFJoMmc0TC9OY3Jp?=
 =?utf-8?B?Z1MrazhwTVYxYVdsYktYUW9lNlI0L2pzUlJJaHFjWXF6d1R0Yk1xMS9HZ01J?=
 =?utf-8?B?ZzVkYitDQjJJYUZpL1NhR055cEorT2hXaFUrSzZ4RjcwaFhUcXBBQld3ZlF3?=
 =?utf-8?B?UnE5YTFxWktvL3I1VSsvdFN4TGZEYkxRNDNEL05nNkNUL3VHc3NRWnlqRm9J?=
 =?utf-8?B?NjdkLytOM0RlMnpjWi91ejBGVkdORzdYb3VsdVI1ekc3UVhYZC9ibnRxTFBk?=
 =?utf-8?B?empoTXFCdGl0RzNaS2FjaWo1aG45L2hpa2QxM3labzdFemZtemdRYVJxNXd6?=
 =?utf-8?B?bVlKNXBzdlpMS0tpOE50RHh1UmlqcklFL0ZtdnN2U2o1ajNjOHhhd0hvN3h5?=
 =?utf-8?B?SEJPMm56UlQ0U2ZhUktPUE5iVC9Sb0t5N05kc0ZNelFXK2p1bGIySmlRQVFy?=
 =?utf-8?B?amtOY0hodWcxTEU2YlZHOVdaY1k5YjdSaEFWSjV4Y0lKbmt0VkNmM2V0MnJL?=
 =?utf-8?B?cnJqYTlpODdFRUVGRm9XTUsrK1ZtaWNzSTgyZlZEQUhvN2ZFcmN4SERPbGFh?=
 =?utf-8?B?TUQ5UGpYaXBIRVk4Vlk5TVNBY3ZpbjFpVnBtOG01UzAyZkpDcGpYdmtueEdm?=
 =?utf-8?B?VmJSTDBtZDIyaXN0ZWNXeUV1Zkl5YVRScWFYSEYzaHNXd1h6VEhnb0VmVWtp?=
 =?utf-8?B?OHA2RW9meG9SSVRsUUFvdmd5dndCakt5QU1MbjZuaDNDOFd3VzB5bUpFcEFW?=
 =?utf-8?B?WGdydUorTVUyOVpGc3pvSDNmemlBQ2RJNkVJbE1YeGFiSUZPeTJOOHBtaXhv?=
 =?utf-8?B?ZG5jQUJGb0o4N1NDOGo4VjQzckJ1S2NMajNxSjkvUlMyTW5xU0dySWNPVkta?=
 =?utf-8?B?WjhwK3BqVlhBMGtxbUgwV2RXQWo5YWtDSW9QRTRDYWp6aUQ5YjJCdEI1VDVp?=
 =?utf-8?B?dFBaRzJxU0JLZGxpTEwzYzFOUjRhSTFXS2s5QUdxSDZzdFV3Zm5hRWR4c0Q3?=
 =?utf-8?B?dUVvQ0QvT2JHaDJ6b2MvQ3J6NWJVdXg3bHRTdXBkSDFZK3lnSXB6SWk2dXRH?=
 =?utf-8?B?aFV3aU16QjRBbXBaZUJlWldjMjV4Y2N2QVhDSjRabWVIbWxuV2s2WG5zSGtC?=
 =?utf-8?B?K2tmcVNORDZ4UmpIakc5VmdVZEFDTlNzbUJNb2grYy9lOURwZFdHMUxPek13?=
 =?utf-8?B?MjUvSEtEU2ZTdXBtM3RaTURDUVJUSlZ1MUpJY0wxRDNTNG1OUUMvZXBEV2JU?=
 =?utf-8?B?Z1I1RzhrV21jV1hWNEJxVUdVZVhWWXZweHZoeWVwRC9ZelJHSFU3VWJWUHM2?=
 =?utf-8?B?TG9RaFk4R0V1L2Qzc3lUT1I3WlJBR3BiSVFGVHlGWkJoR2wrNThWVEFKd3cv?=
 =?utf-8?B?amJnOSs1MzUvNWRJMGplcEZZNXBMNzcxQzU1S3djTmxVOFlLOUV6SGNWdDZC?=
 =?utf-8?B?ZjFUbGE5Mnl2RXg3NSsvVWJvT3JGcFdZUm1zR2ZkcXBMdmZVeDFSYlNPbS96?=
 =?utf-8?B?TzdQZmxHUklaRlJQNndsUjhYc01vVWF2MTZtM2x4L3RVbTVmWndmaDZkVlhD?=
 =?utf-8?B?azEreWlCSVpjeStvOHRHRWUrbS9GSURadmgrd2VTd09udTdXcXdGa25sZHJJ?=
 =?utf-8?B?S0dIVHljTUtHMjJpRStXQThWTkp2ZVZMSHVXeDZmTmlKME5EQU85QUx1ckY2?=
 =?utf-8?B?cFdFQm9ad3ZaaTc3Smk1OXM1RHExeU90NTBua0NSck9QZ3RyZDMvVmNCVTk4?=
 =?utf-8?B?Smh5eDJ1QU1jR3M3aVZ6ejhibFMyYVFCNjljamtZNkgrcjliZGxvdWdiR01j?=
 =?utf-8?B?NzZsNTlyM0txTmdDYS9tdVlvaUMrOUk3dStkaEw1dnpYdnBlaFlwak1pcHBm?=
 =?utf-8?B?RytaV1ltQVEvWFpXWkc1aHF3bE40ZnAyRFZhTC9yMzRBajdGUGVXS1BDdDY5?=
 =?utf-8?B?dmpMK3hnTy81SWJEWHRMRzFJR3FnT1dIVFUxN3UvN3FydVh2VnFpdE45U1oy?=
 =?utf-8?B?NlNzT1pEZWxNelRoOHdiSFgwalJQWUJZRVZBOXNHcXY4elNscDl2clhwMzRC?=
 =?utf-8?B?M0pCdGx6cVVrRzlEQ3VGdGV0Wm5aa2MzUnBwcE5FSCs3OG82bXlKczQvZ0J4?=
 =?utf-8?B?TmVjMzQ1ZmZjZGMrd3YrS0l6Rmtsbm8yQjUvb3JFREUvNERTMHhWKzdQUGVo?=
 =?utf-8?Q?sDpt6uROQk4sUHqw=3D?=
X-Exchange-RoutingPolicyChecked: whBKKuzUtbr1Dtbras6VZpJRKCA3egKPJ9lLoQCoiDTVLC2aHfTpnZ1RApjkS4Kize7Ytp5U1oQfpcTtNj2LBj7bnL2NXPJJ+qaXo3dIHfQy97BVL4L4oVJDKveno/buwhfDITtEzHCCJvGi/tAAHG6bL8GUxQpMneFU4Iacg8mlLHCR2EJ49IUCGOz3RPdFORXmulES5QvuNNXwcogPBr8Y75vTKNNXq0Xkz0kWoKAjsEeL3k8mMGjJr4exNtq/VwKDB9zpmpV/ih99rmsWvD6kMb1r255HCQ9g7ZSJNZTdPkcHjRmYmhYoXynCjCgjoQmmMNl/eGgxHjTm1eJAGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8664f464-23cd-4605-25cf-08df1e1f17c6
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:45:00.5945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OohJHurPhd2BWA0Fv8Okkk3LKMYU5WcDR//tn9obEek1JyhiGd+S69lGFjnPzLmMo75cIaZqBi9Ms51MswXiIfdofBQmX+S4dcVIzcp4xSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add subtests for the optional Power Management, Advanced Error
Reporting, and Address Translation Service capabilities.
Skip an optional-capability subtest when the capability is not exposed
by the VF.
Validate the VF ROZ fields required by the SR-IOV specification,
including Power Management Data Select/Data, AER status/mask/severity
fields, and ATS Queue Depth/STU.

v2:
- Reuse the VF configuration captured by the common fixture.
- Use PCI register definitions available from linux/pci_regs.h.
- Simplify optional-capability skips and runtime descriptions.
- Remove redundant informational messages.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/sriov_pci_config.c | 109 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
index 9a7145a5f2..a887e2ea56 100644
--- a/tests/sriov_pci_config.c
+++ b/tests/sriov_pci_config.c
@@ -43,6 +43,21 @@
  * Description: Validate that the Current De-emphasis Level field in Link
  * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
  * and later.
+ *
+ * SUBTEST: vf-power-management-capability
+ * Description: Validate that Data Select in Power Management Control and
+ * Power Management Data are ROZ and therefore read as zero when the optional
+ * Power Management capability is present.
+ *
+ * SUBTEST: vf-advanced-error-reporting
+ * Description: Validate that the specified ROZ bits in AER Uncorrectable
+ * Error Status, Mask, and Severity, and Correctable Error Status read as zero
+ * when the optional AER capability is present.
+ *
+ * SUBTEST: vf-ats-capability
+ * Description: Validate that ATS Queue Depth and the Smallest Translation Unit
+ * (STU) are ROZ and therefore read as zero when the optional ATS capability
+ * is present.
  */
 
 IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
@@ -159,6 +174,85 @@ static void check_vf_pcie_capabilities_2(const uint8_t *config)
 		     lnksta2);
 }
 
+static int get_optional_cap(const uint8_t *config, uint8_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF PCI capability list (%d)\n", cap);
+	if (!cap)
+		igt_skip("%s\n", name);
+
+	return cap;
+}
+
+static int get_optional_ext_cap(const uint8_t *config, uint16_t cap_id, const char *name)
+{
+	int cap = igt_pci_config_raw_find_ext_cap_offset(config, cap_id);
+
+	igt_assert_f(cap >= 0, "Invalid VF extended capability list (%d)\n", cap);
+	if (!cap)
+		igt_skip("%s\n", name);
+
+	return cap;
+}
+
+static void check_vf_power_management_capability(const uint8_t *config)
+{
+	int pm_cap = get_optional_cap(config, PCI_CAP_ID_PM,
+				     "Power Management capability is not present");
+	uint16_t pm_ctrl = igt_pci_config_raw_read_u16(config, pm_cap + PCI_PM_CTRL);
+	uint8_t pm_data = config[pm_cap + PCI_PM_DATA_REGISTER];
+
+	igt_assert_f(!(pm_ctrl & PCI_PM_CTRL_DATA_SEL_MASK),
+		     "Power Management Control: Data Select must be zero (0x%04x)\n", pm_ctrl);
+	igt_assert_f(!pm_data, "Power Management Data: expected 0x00, got 0x%02x\n", pm_data);
+}
+
+static void check_vf_advanced_error_reporting(const uint8_t *config)
+{
+	const uint32_t uncor_roz = PCI_ERR_UNC_DLP | PCI_ERR_UNC_SURPDN |
+				   PCI_ERR_UNC_FCP | PCI_ERR_UNC_RX_OVER |
+				   PCI_ERR_UNC_MALF_TLP | PCI_ERR_UNC_ECRC;
+	const uint32_t cor_roz = PCI_ERR_COR_RCVR | PCI_ERR_COR_BAD_TLP |
+					 PCI_ERR_COR_REP_ROLL | PCI_ERR_COR_REP_TIMER;
+	int aer_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ERR,
+					   "Advanced Error Reporting capability is not present");
+	uint32_t uncor_status = igt_pci_config_raw_read_u32(config,
+							     aer_cap + PCI_ERR_UNCOR_STATUS);
+	uint32_t uncor_mask = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_UNCOR_MASK);
+	uint32_t uncor_severity = igt_pci_config_raw_read_u32(config,
+							       aer_cap + PCI_ERR_UNCOR_SEVER);
+	uint32_t cor_status = igt_pci_config_raw_read_u32(config,
+							   aer_cap + PCI_ERR_COR_STATUS);
+
+	igt_assert_f(!(uncor_status & uncor_roz),
+		     "AER Uncorrectable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     uncor_status);
+	igt_assert_f(!(uncor_mask & uncor_roz),
+		     "AER Uncorrectable Error Mask: VF ROZ bits are set (0x%08x)\n",
+		     uncor_mask);
+	igt_assert_f(!(uncor_severity & uncor_roz),
+		     "AER Uncorrectable Error Severity: VF ROZ bits are set (0x%08x)\n",
+		     uncor_severity);
+	igt_assert_f(!(cor_status & cor_roz),
+		     "AER Correctable Error Status: VF ROZ bits are set (0x%08x)\n",
+		     cor_status);
+}
+
+static void check_vf_ats_capability(const uint8_t *config)
+{
+	int ats_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ATS,
+					   "ATS capability is not present");
+	uint16_t ats_capability = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CAP);
+	uint16_t ats_control = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CTRL);
+
+	igt_assert_f(!PCI_ATS_CAP_QDEP(ats_capability),
+		     "ATS Capability: Queue Depth must be zero (0x%04x)\n", ats_capability);
+	igt_assert_f(!PCI_ATS_CTRL_STU(ats_control),
+		     "ATS Control: STU must be zero (0x%04x)\n", ats_control);
+}
+
 int igt_main()
 {
 	uint8_t vf_config[PCI_CFG_SPACE_EXP_SIZE];
@@ -199,6 +293,21 @@ int igt_main()
 		check_vf_pcie_capabilities_2(vf_config);
 	}
 
+	igt_describe("Validate the optional VF Power Management capability");
+	igt_subtest("vf-power-management-capability") {
+		check_vf_power_management_capability(vf_config);
+	}
+
+	igt_describe("Validate the optional VF AER capability");
+	igt_subtest("vf-advanced-error-reporting") {
+		check_vf_advanced_error_reporting(vf_config);
+	}
+
+	igt_describe("Validate the optional VF ATS capability");
+	igt_subtest("vf-ats-capability") {
+		check_vf_ats_capability(vf_config);
+	}
+
 	igt_fixture() {
 		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
 		igt_sriov_disable_vfs(pf_fd);
-- 
2.34.1

