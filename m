Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E886606A334
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDM6HEKD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B25B10EC1E;
	Tue, 20 Oct 2026 14:47:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498C510F0A5
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792507617; x=1824043617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M1PW4DdrCyvlT059Lo/ry/JwwpmFn302kvK95CviEgA=;
 b=lDM6HEKDGXA48ucpG+PZKQGRG45raqi/Cxqgl6CHtxI7A6uF2LpV/hHt
 ZR4EOJdZkP7zT+G4g9X64hOqky9zILvCMbxEBg0ZN/rD1HLulWKVrco3X
 0pYhfI6kCkO8hn3ey/BMXIgevhKxNa9QVZYBLH8fNLC6xQqYEiTz/XQ10
 uVfwMmMHY/OEorq1FS0FHOYf/ymbAsMKsfMG5YI1rx2tN76i2U5voDcCp
 /Bhp5JfOjLQEHn2HkyJeFXASUkoLJZkaO/R8uKX9Yvj7vGz/GO/Aq88Z1
 26aMHw8UfmMaj43PPLcwBTDtP8CI3VhRYR5T8VcF6/5ywpVeODV3XPte9 Q==;
X-CSE-ConnectionGUID: V/FW4bdgSPGFKTKMxqkJeQ==
X-CSE-MsgGUID: IXG0+T3ORy64cMOD95/mxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1096125"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1096125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:46:56 -0700
X-CSE-ConnectionGUID: GArCRMI9SJyp92EYfqfptw==
X-CSE-MsgGUID: vY+7DyA/SWyfMZHL623EeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3156908"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:46:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 07:46:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 07:46:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 07:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpoWGeFyZdlMdPDPBlaJWryCw/6Cch+hqaxebD5fGrmcKDYOEIEela4/AlwXi+JBpI3qNZ8OsCkbZw64ecS53nY+itnApZ1wtG8eofBN99mwPG40lym/qIVn7ggDHgR4fLhEMy2LHYPATHDlRWO3PbzAM7uFc2yS04ZwW3lOIHmMPsi6fctMAoOO/pP4+oqByScAkWK6Ww2cnf3jJDJItCy8FjLQNy6J5Htd/c8kUACux/tuXVMaiFSQ3A2byjs4rSXJ8cJ01N0YgOrRS995Dg4df1Mpav0JjyvJRDzkavmmPhw4LjUp1vVuUdsOi5rkJ0GfgCkFmVYN6CpulrpJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvMi/dMprzHEGQkPHAjudNYo3DzsqIV9+jAlTHDXZY8=;
 b=FO0ppUChjk6OntTbabh1Bfa5nlka4HI+x+gh66WVQyDcdtx5b+BljdybkTM+0FtTMxmhDTTHPhDDjqZoEJBlswJWyh0cu4D1xE1z0JpCJKD7k/JM/9a7JzAMuNC1uW5e7I0OURyh81bcSPPY0t96K4qGJFFkR76QJmJvWD/XYeaMiqAZsXYhLBOHR586W+PEJNwNXg7vL/nHQ+FpoZRS0uMDswdHn4eBkLMC518P7L60yx0w03fNXXgtTjA/V9sG8epAc53is4+MGDvQ0xBnsyJUtkjKm+b2LTUW/A/KpyEEMo65t75zXQ7a1K2V4759PFUGZy44J1ab2DvlD9C+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 14:46:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0522.016; Tue, 20 Oct 2026
 14:46:52 +0000
Date: Tue, 20 Oct 2026 07:46:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/xe_oa: OAM has broken stream on Xe3+
Message-ID: <atd+2YAZ1sGpakXe@soc-5CG1426VCC.clients.intel.com>
References: <20261019051200.1071936-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261019051200.1071936-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0a8eb0-1b42-4634-5957-08df2eb8fa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: flyfGmonI0B0P9UPL5kkiPkAzFR3ViGoo80j1O5iT9ZM+O73MDsTpnf0Ep9DqaFSUvNK7BNtj/mvMdsPtFyrTqCNd12Iqi6sjAN+qVt151azhSceCzA+/o/sYDnHJQMpF2wa4DMnGQcOYVoSPzvyEyqB0c462BHOJ33xGUlRyY0fJUrQhWrj98Irlf95vCKv52GRnTa1BtG0pEu03onP1n4B0Uubc2lDxtmoxbx9W6fhpt7CypzolcKJFVubj3GSTnYm9fCHYLnpPcbwaUoUMPCpv8OtTtZTpLF+Frw3NCCWnmRB3mgQFmqCgZo57WmjJ1RK/13KTYvQRvYAIEEMJzA3VyI6ky/jhl4YZ00uV5n0C93cdldTUbQFdP/OW0EJDX7BoQA/iiVurMUStqpuyZke66mPdi/8WU/CSFbWjRibuXxlccpSNDTwyRmL+Bqz/WqblR/a8dg+3iq6dfP3TkZ/uSVa6Zea/qJe56+JzV7fG+4r4tdEtMat2ovokZzJv+jm1uu0skHiFvEiHc+PPhK8/H5EKLZ7GnO8ZK8KIy47Bva5GzgUHhDwkGtQm4E8o4I+mF1yyQc6PCCAvp63LpSZjKFUf9k/bP9CIodywVPzAmhVKMIty68npFW3mZ6cgXjPin88LTjU/RexqivYepGLlGGWvyIuygxoWcE3HKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eERLMUpJcVpOK01NcTVadHozSkw1K1k0b3BvNTRkY25iSlp6elAxYmRmejBm?=
 =?utf-8?B?enU1K0pJajQvTXJ1c3g3TDNMMDRMWkRkbDhPdkFxWDlZaFZpVk9OVnd4bGhl?=
 =?utf-8?B?THFRcHVZV2xmd3ZyUkVaZFNjMk9UZ3lCWk5RWmU4emdsZUdSSzh2amRDN0ta?=
 =?utf-8?B?N0F2aXErV1l5dUFGVHFtTno4N1loY3lZSzFsV1Q2TlVCVzQ0YWNuUGtjNFNH?=
 =?utf-8?B?eWhLamVxMWVZaWFWb3dKZ0FyRWIvN1hRVTZxbmxtaHFMdjllSmlxWGprK0tx?=
 =?utf-8?B?dk5yN3RNWFRuVEc4ckdUclpuTmQ3cE1MT1dpYWs5SGNLVitDRDFrWXZndmUw?=
 =?utf-8?B?ZzJrcGdyTEN6ZEpPZi9CWFVYTVJ3UGR4b1NXZEl4a0NLNzJUeSt6UkxoZy9C?=
 =?utf-8?B?ZmwyaVZEM0RtL09Db1d1bnJKdVhQVFhId01ESFJqQm1GNmVHUmRtVnV5UkJu?=
 =?utf-8?B?b2hoaGtrMmM5ZitaWnR2NEd5VEQvM2VaSXFyYW1LYnJpb1RNR2xmck1SMmNo?=
 =?utf-8?B?Tmh3YU1XeWFESUtVa1VtVC9CbTU1c2E3WlUyOVNkNWpUOFFZVWxtSTQ5LzBC?=
 =?utf-8?B?bVBtTTZDWXZJTXlNaDAyTG1uSHhwMkpIaFZkeTRzL3VKL0ppaGZwT2pENjBS?=
 =?utf-8?B?T1JVL1pJamltaHNCb00yN0NjZGpQdmd2VEt5TGtjMG1TZTM4ZjdUWmhOMlpO?=
 =?utf-8?B?YlZVa2pMYnE4ZU9GSWVVMEtVYjJFc0prb2NyenBEOGZHVnRQWUUrL0ZKS29D?=
 =?utf-8?B?SWdVbGZZK1FJQjV6cEdabW0rQ1VFMkpMT1RwbUlNdytTVHFXY0crOThrd0Jq?=
 =?utf-8?B?Qzdnc1N2MmNwWVlOWUpnTUFQeTBzRWYzTEZYZGIwNDhHcG9USG5FTU56MGVI?=
 =?utf-8?B?cG9CeTBzMjhJZ0RtTVZCTWh5NlZTYnVtWmU5QlBEcmpWaVk4YjViUkZzUm10?=
 =?utf-8?B?Tmd0bUhWbDVPWEZNMmpuR3lncWhpMURWTytZZ2l6NDhjWE5PRFp1QTdrRVlo?=
 =?utf-8?B?NnFGek9URURGTFBGZzRDYmNyaXMrd09HYlREVHlRWEZOa29MektUS0RpVUNh?=
 =?utf-8?B?cXBleGFjaVFUMjVGL0NEdE5sZ3ZmOTRmRzZnaVdxT3lWWEIwYmZ4VTQ0ejdN?=
 =?utf-8?B?cFdwRU1aRUcrNEcrNWdDUTVOZXFMRGx1MlBUSEpYcFVKOWhZVHh5Q0FtbmNO?=
 =?utf-8?B?RkJDYUlKK0c3NnBDamhSRVMrK2VaQ2RYenZFRGFzOWFERmFjQzhrUXE3SVJ6?=
 =?utf-8?B?SElsNmVtckVYUWdLZVBEK1lBdDliektlNCtjeEl1VU0zRWhCQTZkeTZQVlFL?=
 =?utf-8?B?cWdUcmd4VXdBRjhJelRBTUJWakErTkg1NVFBc1lIQTFyTGpXUFFTU3UxWWVC?=
 =?utf-8?B?eTh0dVhWYThwc3RNbWdWR3l1SFFROWUxdS9xa2swN1o1MmZ2TVVLN0ZCdDR0?=
 =?utf-8?B?NkJVMm9iQWFmUENEaWZrdEN3dWlVVkZqVnlOWkhSTTlMenNCY0VkUk1QcnNv?=
 =?utf-8?B?cTlCa3VEVDk5MHNOSldyQnNLWFRhYytwV1JJN3JkcUZLVnFVSDdtNGY1QjR0?=
 =?utf-8?B?cW9lM3l3TXp5U01lSHdPNlBpUmVXOHhwQThVK0dieEVjalZXN251V05nYll4?=
 =?utf-8?B?WEZyak1JSXhaU2dZYkJkanBPKzRpVFVwNmNSeFlaVW5tcW8raVZlSU5rb0VZ?=
 =?utf-8?B?cVYwWVRhK1BsTzB1SVVJR05lbVBtQXBUd3NFa2JhMUlwT0NRSGtUWWZtS3Mv?=
 =?utf-8?B?dFVxMFBoUnJ0NHp3QXYzb2V4L0o1eGlOOW9IMnJKbkFxRXhvN3l0YndkNU5h?=
 =?utf-8?B?Q01zc1F5Y0Q1Qmd0dWcxSW1TU296cGM3U3hGa3d6WWFPV3ExNEpKaEJ0c0dj?=
 =?utf-8?B?ZW1ISXpReTRBWkdwRWR6aDIxM3ZKQ2kvdE43K001WnhWelJhaWZUeXlzQ05M?=
 =?utf-8?B?QmpLVlE0UlZEMmY1bVpKSFByck9zdEtsR0xsTEM4ay95VGRkZWFCbUNXdFJ5?=
 =?utf-8?B?aDNDR3lwcGZTYS9KWkJRd0hRMTBVeU96SWx1dUtnd2g5THU3VjVnclR3enBV?=
 =?utf-8?B?emFPdzdZNUQ2NnhUMC8zZEJWT0dBV2YvTFByUWRhc1RxL0dSdmZiVm1xYjE4?=
 =?utf-8?B?VVcyTFJ3STJvZE9TMUZhUGhKQ01oOVhPakJySU5rSWZJZlBHbTV6T3JyMlU5?=
 =?utf-8?B?TTZZbXVyYm9PeFh5eWZIZ2NQTHNaVWhQOC9QeVRLeUVRVUlqc2ZhSThqNXls?=
 =?utf-8?B?cU9OWS9ZMEdTN28vUisrSEF1b0s2cmVuOEQ5S0lZdVBzTjNkNWg2VDdBRjQ0?=
 =?utf-8?B?clJvVVEwZjNvckpBVllac3NPSG1Ud0ttU1NQUDhYbGhTUTBlL0swUXZockMr?=
 =?utf-8?Q?YU1Mv5w1TumobqrQ=3D?=
X-Exchange-RoutingPolicyChecked: 2jxc9yNBJsOq8WLvJfKLDzx3Qrr+TiNtxv3F0X0RB++5l8uGpW451/33eCGT50NcXFlqCZBO5aFWh2hU5r03LW0lIlvBuOH/h2iiMOtTkyRmb+BJZnlhak12T/UjctY350sXpLhItXrknKjR03nbc+ZfVEqDATrWoRyIvjHhi1wwJNbDhASKG2vdbmDafNeqlH9aPr/LXzCJFLhi3pEFVlgcPWlbCWhBc/1o5waaRYKUFT5yxkYzbpvzQ5Og1S2IsOWns5gvUQjkl4OTJDQ30k3MSLmt5CLXfuaxMO+LO86IEjzDyU4jQnqg/G55ZIaVlA1DxYCzcg0D745bJUe8bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0a8eb0-1b42-4634-5957-08df2eb8fa00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 14:46:51.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tNyyp+X0+70cVEqFxrjLuCBhFf6jbId9/TRrh8iL5k8NnSwN0qnpH+BWzouDPN8+d2GzaviQLKWEDdBdZ2yrPoGwZpDV0a3nWWMU8/B5z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 10:42:00AM +0530, Shekhar Chauhan wrote:
>Extend tail-address-wrap to all OA units and force the 192B format on
>Xe3+ OAM to properly test it since other formats on OAM don't use 192B
>on Xe3+ platforms.
>
>v2: Run tail-address-wrap only on OA units that support it via
>__for_each_oa_unit_with_tail_address_wrap() and update the format
>comment. (Umesh)
>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 38 ++++++++++++++++++++++++++++++++++++--
> 1 file changed, 36 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 9ebb18690..b9f62c115 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4516,6 +4516,35 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
> 	try_invalid_access(vaddr);
> }
>
>+static bool oam_has_tail_address_wrap(const struct drm_xe_oa_unit *oau)
>+{
>+	const struct drm_xe_gt *gt;
>+
>+	if ((oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM &&
>+	     oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM_SAG) ||
>+	    !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
>+		return false;
>+
>+	gt = drm_xe_get_gt(xe_device_get(drm_fd), oau->gt_id);
>+
>+	return gt && gt->ip_ver_major >= 30;
>+}
>+
>+static bool oau_has_tail_address_wrap(const struct drm_xe_oa_unit *oau)
>+{
>+	return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG ||
>+	       oam_has_tail_address_wrap(oau);
>+}
>+
>+static int tail_address_wrap_format(const struct drm_xe_oa_unit *oau)
>+{
>+	/* Pick a non-power-of-2 OAM format to verify tail address wrap */
>+	if (oam_has_tail_address_wrap(oau))
>+		return XE_OAM_FORMAT_MPEC8u64_B8_C8;
>+
>+	return oa_unit_metric_set(oau)->perf_oa_format;
>+}
>+
> /**
>  * SUBTEST: tail-address-wrap
>  * Description: Test tail address wrap on odd format sizes. Ensure that the
>@@ -4530,7 +4559,7 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
> 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	u64 exponent = max_oa_exponent_for_period_lte(20000);
> 	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
>-	u64 fmt = test_set->perf_oa_format;
>+	u64 fmt = tail_address_wrap_format(oau);
> 	u64 properties[] = {
> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -4879,6 +4908,11 @@ exit:
> 	for_each_oa_unit(oau) \
> 		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
>
>+#define __for_each_oa_unit_with_tail_address_wrap(oau, str) \
>+	for_each_oa_unit(oau) \
>+		for_if(oau_has_tail_address_wrap(oau)) \
>+			igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
>+
> static int opt_handler(int opt, int opt_index, void *data)
> {
> 	uint32_t tmp;
>@@ -5146,7 +5180,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
> 		long k = random() % num_buf_sizes;
>
> 		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>-		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
>+		__for_each_oa_unit_with_tail_address_wrap(oau, buf_sizes[k].name)
> 			test_tail_address_wrap(oau, buf_sizes[k].size);
> 	}
>
>-- 
>2.53.0
>
