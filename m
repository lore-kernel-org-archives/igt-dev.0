Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8FED3C52A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 11:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F97C10E25A;
	Wed, 10 Dec 2025 11:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doSzZvUE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6085F10E25A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765367941; x=1796903941;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GvJwGnICLvo4VyNLdxl1MqW3AJemKT9FZG5PP/EWvgQ=;
 b=doSzZvUEoiLqyeBo29JlASO90by1anPnyEO8foZVadY4ug17dITc04si
 H1QJ/csBiqxJitST8cC0VovBV/6VpAg4poVrbhL7cu+5qm1/tKnPnQ/A0
 LI0mmdV6uuu3WWiSZaGApq7ONV5a7h3U/LLl3C0oN7IyePoa9WyxGDoAF
 JiWneJWYwY14t38R0asSWm6eCxN8fl/qV61Gs0fkXU3wQZCFxp1UrYkgn
 GtDk73DKOrQ9y/Wefbu70PkkL5t9iB9bc3NKyOrwPWQW1bMduh4s5IN7d
 W7GNg4Ti7mCIStR3nzY9R2PhMPJMSurSpDBOx2FAqoZn4PLUEZh8l7V61 g==;
X-CSE-ConnectionGUID: W/APL2w5Rui08ggUwGrLtw==
X-CSE-MsgGUID: kymH6zxnRZq5mEfra26vYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78032505"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78032505"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:59:01 -0800
X-CSE-ConnectionGUID: 5TZKP43mTvmJ9wJTjS45gA==
X-CSE-MsgGUID: BWCmiPbUTvq0vl00rRNOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="195763090"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:59:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 03:59:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 03:59:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 03:59:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixTXR8T3ZdFkFQBsi0x+vJIWOp4eEx/KtxNcqRGR8FBjQWjsqxkOMyW8C3evfvynCWNJrN8RfT0nNd4yfXhQDr12CT/ATA0+IbxlPP7pMgg5H2uPNPXwoGgHoiH1ayTTUe64/dvGt9bRtl8Is2jWq9okIQ3g/Q5jSyEaSz130mzofSbOUIUxwNjQrIJBZuWPsXkwjYUWEEmpCzR2tOu45AFbRphVX6OUNxEdEwUpdHfq6hpfpCMT5FX1hb2ow1tphIKGZ8zgOTi9Lp76ctWlCkCqWjwVct5gShO5ClcNFeWGaNCrv2PPCQcS54YVE7xcZEPgQLRBCEtoHSFGSvmbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1zKu4ZVnAF5gNBIChUAVpFDiZonA8qk8cOv1rhUTus=;
 b=c7hzcRfubUThn7GAzUeUQnNm6MOHYcEaZcdTKczImlBS0SJG4X3khH/xc2DOwBywhSFx/zCjFK8B3z15qh0J8BtYAOr7KXPp+ug20vbZ3nmzKGVf6KBLlbVSGYpi92oMCg7K6XjmmhKlw/r/d82138sZQDtaMkijFZmJ3rtSw6expJHitj/o4KaNcLFimUsYxjR9QU3EmEJmFMnM2uKyWBDlDoL6F5n52Qi5s2sI2bDviLa0EMaW3mK+UbXgBEg3H47oJMy7W6Q04QfPm21GDRH2l0ZB8Te/0RTH+6fBpCfMcBjE04KBrg6d1nQ+F3yxeV9CuDHTFmcs8fBqZsl/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PPF5EA507B64.namprd11.prod.outlook.com (2603:10b6:f:fc00::f25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 11:58:57 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 11:58:57 +0000
Message-ID: <968a1d57-81b4-4481-ace4-295d966cdf3f@intel.com>
Date: Wed, 10 Dec 2025 17:28:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <sk.anirban@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20251127154807.2899369-1-karthik.poosa@intel.com>
 <20251127154807.2899369-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251127154807.2899369-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PPF5EA507B64:EE_
X-MS-Office365-Filtering-Correlation-Id: 838e5eaa-3631-4f90-12e7-08de37e37f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEFJZjVqaVJWRXFpdC93bWxyLzdjeS83MHBoMWpxNXhyZ25pejNTTllNSmw5?=
 =?utf-8?B?dGd1cVdTNUluSFBRbVpuNG9nVkx1QXc0T1kzWDJwR2JlOWNVaHFydDIrcVdi?=
 =?utf-8?B?alBIQTZDcHdSQTlUeDFlZFpSdkdML1QrN2FkY3FyVlY1MEExYzAyWmxIT1ho?=
 =?utf-8?B?OVo4QkhNRFBNVGlDZHpGaS9hcHdrSGpaVDg5ZW82RG9ZZXFrU2NCYklDREtP?=
 =?utf-8?B?T0RpM3BMcWtuZFplWWZtVTNPc1ltc2lXYmFjVFI1MEkxNk9yMGozT3pCZzJh?=
 =?utf-8?B?TFdsQ3R4R3pqZkI5cEl4YlgrNXNJL3dWOCtLR1FYTDh2YWlZV0NYVE5FWlpP?=
 =?utf-8?B?TWQ5b1hSVHp1RlNRTUxuaENsS3RCNmFkUW1ZYXFHaFV4aFJMYUZpc1FHZ1BI?=
 =?utf-8?B?ZXVnMnZnbXNGQ2Vxay9XOEltd0IyZ2Zmcjl3VXc0cjhjd0xsSmJuK3dySnda?=
 =?utf-8?B?M0JrcTFGaWpGenZMRDR6SzIyRWtVemtXWHJ5LzE5S2JNWTNpMnJrY0lOR3dD?=
 =?utf-8?B?MVNWUmduUXBaSlRVU1RvT0UvTUtJaTltcFdzL0IvU0VwSDkvSmVCSFp6Ky9E?=
 =?utf-8?B?dWlyc1BIb0pKTTg5OWlHY2IzaTI2NnRQQmJLaGlpTi9Yanpqd2lzWVJwZDVy?=
 =?utf-8?B?NVBSZEJHOGJ3SnBPQWtXSWVicEY4MHlkME1rc0Q0dGE3ZFB1MUVicFFNTFRE?=
 =?utf-8?B?anBXdEdoVkxhaW5nSGY0VTBkTk5HeVVIWTRxalJINm1KUjBmNWpwODd6emhR?=
 =?utf-8?B?b2owazlSOUc4YUQyVEEvRlNnQkhldXBoc2ErT1pRejBNK3dwd25WUWpZZEli?=
 =?utf-8?B?UTVEQnd0VG44TzF4UkM1UW9hQlpUNVhLVHJ6aTdURmZHc29YTkFUcStqMVpv?=
 =?utf-8?B?ZXJmQk16cjlkNVRyNFA2cVFqRmE3enZlYzJGZzVxMWREdmZTd2FZN1JnUzNL?=
 =?utf-8?B?NkFpTUtMczQ4M0xMMk1Sd0luV0s3TWZiVUlnUmM2TkpjelZENzVxTGlwSlFr?=
 =?utf-8?B?K2N6ZEY2MTh1R2dlYnBuYXRVa0ZCNXQ0VDZlbTBFSEc1RjdEdmdLL1JoV1lt?=
 =?utf-8?B?QmRwV2wrVVdDZU5RRmFtK1VXeGdKSks2ZktET0wyODJBVUlyOEpLYTRPc0Jy?=
 =?utf-8?B?TGlRckVTUWJqa0ZyWU1LUjdCVWpvYmxXVmhxR3RESXp3eGFNVlZzL21CODdK?=
 =?utf-8?B?UTJzZzBHM1hsMmNiTENpMU03WmZ3aGtGQXAyaVluSXdyeS9vb1V5emYxcUdE?=
 =?utf-8?B?aG5VblFRc1Bnd1JFZkZrMjBSQXNSUjRKUEV2Tmt4UDlBUDJBOGpYNTQ0SzdF?=
 =?utf-8?B?cmwrOXpnanRvK2FFYnNOMzNwUmRjbUxiZnBvQVNhY1RNVUtqS1VFMExKSkJz?=
 =?utf-8?B?ME9zWnk5ZmVjOXkreE1FdzVrTlZ2Zi9SWkZyVmFEU1JvZlBLaVN6UVU1a3FN?=
 =?utf-8?B?MWxtaXlmVkV0UjlTNlRtK3o3MDJETnhiYlJDbDRHM1hmZ29kQ1piMUZMZytT?=
 =?utf-8?B?bnVwTFFCNUZVN2VQZ2J6ZVA0Skh4TEN5SE82ZGN2QWlhYXdzd1NLZGFId3p2?=
 =?utf-8?B?MXZyY0VNdU55MWlvN3A0Q25MZDlYdTY2cmNySWgzTVdzWWc4dlFTc2Z0bWlX?=
 =?utf-8?B?TGhEUFFUYnZHa3I0TFVSeHo2Rm43TGU5TXRLNm9GMk1XdEhFRHFwWFMwbjNJ?=
 =?utf-8?B?VUVDV25lY0xIcmZvN2Nla2ZlMHVtaVFVcHVMakE5WmVzVzZEY3FZWEZYbmNm?=
 =?utf-8?B?djhBeFhRT2VrT1NBNW4yTFJ1aVdHcnlzM3BnZWJRZlJDYlBmdTM2eHV2em1S?=
 =?utf-8?B?RXkwUHU0R2pPblJ3cXJKbGxvSmU2aTRBajRlRmN5UkV0Q1Zud2JNMEowVDdF?=
 =?utf-8?B?aUpiUGpOUEZyVjNSWEJmb1EwNTdKN0g2ZmdtY2hjcUlvaTdwR3B5M1g0RlZu?=
 =?utf-8?Q?O5esD6OLZ/HAvdi6IPv5IDkdsJpllm3g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGw4UkdsRVRHNHU4RW5Qb1MvNmFsSnZhT1JXMXNjeVEvRWo2c1VxNXNoaG5o?=
 =?utf-8?B?Tms3ZDhRb0x3OUcxNEdwL1YzSkVvRFkxTW9JOVYvbERCNTNZTlVlQWlSTEo4?=
 =?utf-8?B?Ni9KSHY3M1hFV2psazFjTlM5K0g5MUNybHF5dnQ5VkJrUVZ4Ri9EbHNDeEdh?=
 =?utf-8?B?V245dURGRnJNL1prL1RtT2pYTTJkNUpkOTVRSzZMTWZRZzVNeXNKck9ncDJT?=
 =?utf-8?B?SUU3bmt5aG80UktIQjg2NW8yY2tFS2hSOVpzbWQ4WXloTVR1b0VKZFNwZ2ZW?=
 =?utf-8?B?TmFoSkxNREQvbGV5SHdWei9mTDF1YTNnWGdUT3B4MFRBVjBxMXdDMm1LUVVu?=
 =?utf-8?B?cVNmcCtMSEpobjVad3YvNk5ZeFpSR0hWQlFJVm1VKzZISGJlQXJhbVg3ZDdS?=
 =?utf-8?B?MlVvcXNPNVNWMzJzb3k3eFl1dUJmT0kxSGlIQ3JQdEJJSkhLditmL2VGR3Y1?=
 =?utf-8?B?amxkQ2Y4YkduWnhsV0dZU3p4Rk5HRGpOVllwQTh6S3Q0ZnFQTHR4VU4wUEwy?=
 =?utf-8?B?RXd0YlhNbXdCblNNaXZmWU1JaDVwdW44Q0VPa0l0MUZBVkFOU0FEbGdvTkFh?=
 =?utf-8?B?eW5waDVBKzZnZVhndFFmS3FNRDFEWS9GcjNsMzBadjJ3bkw5RStLa29KL0cr?=
 =?utf-8?B?WlA0RVg5MXppaWFqL1VvZmhJZ3Ztdkh3Q09KaUVZUWtoWSsreWF1UDRxM1hh?=
 =?utf-8?B?NXhDeUdnOXk4anhSUE5JUHVXemdHVmdlT1U0WU5iOGF2M0llQU9nUzE3dHhz?=
 =?utf-8?B?M3RPb2UrQ2xEQWZzQW9LaDJxTnZ5ZHRBS2xCNWVnYURId05sVDY2eGJLT0NI?=
 =?utf-8?B?UU9HQXJ1bk1mMzB0NGRlOVhnYVE2ZXpFRVptcXBpeE1FaXlVK3ZXbG5TOUtu?=
 =?utf-8?B?MFNrRTNIcDcrdFhlS005eUcxc1VGbWtrcTJuWkdzdjd0amg0dEd0eGw3Q293?=
 =?utf-8?B?Rjd3T0ZnVVhBdmlaZy9YTlJVSXU2bllyNklGQys4M09RaURKOUpubGsyZksv?=
 =?utf-8?B?VEcwWnFLeG9sNGFrTTdjSnNPUXpTTkVqRXRkcHhONmtXV0NkaG5GWnh0WUNJ?=
 =?utf-8?B?Z0ZXdGpiVTBiVXhZamlwSGNGZVp5a1k4ZG80cllUQy8yN3hNdW9vbXhQUUZ3?=
 =?utf-8?B?czZPNHR5ZCtURDdjcXRValVsd052b2VMbnFHSEhpc0QrV2dQYjgxRXkrdU81?=
 =?utf-8?B?TVlpUE53RHFCOXNvWlBDV2s2ZHJINU13Vk04ZzlZV0ZWMEQvbENVRHk2ZHBm?=
 =?utf-8?B?akVhSGJKZzEzbjJaOUd5THZOaU53dTNFU0pxUER6a1RJYWlrV0dpQmZpc0tQ?=
 =?utf-8?B?bFdzOW5Ba2psZnpXbEFuZlRIdGJNRmhTcjlYb3REenFzNGxlVTl5WFFjSHlQ?=
 =?utf-8?B?cldUSXBoTGszcHAxSGhNaUR4UW42c0xzeXdpbG9DMUw0K1AycEtPZlJVL0RO?=
 =?utf-8?B?Vk9XMXBHUFNtcXFNNUlEblBZOFVYd2NvSnljNEs4STVlUXBDc2xiLzRwNURI?=
 =?utf-8?B?SWxQbm9hOFlSZzdzdDFmMW5FdFNpSnErVFhUYTBRTGc0VzhyMDlGa3BEd0JE?=
 =?utf-8?B?SnBWWmgwdmFKa2ljY1c5b1o5VTFyWmxUai9FUlJMZGdMSllGbmNhWHoveFdT?=
 =?utf-8?B?K3lRNjFVMWJSanRnNDVQK3llSWR0WE1HWW1haUdpWlJ0ZGFtRFlPL296TXoy?=
 =?utf-8?B?bEN6aW9ENElXTDgrdGI3bGRvN1VMa3prNU03dVRuVEVDUnQ1bU5vWGhkNjZh?=
 =?utf-8?B?MWNpbmNKVTlVUjZQMHRqRnR6WGwxdWZlY3doUVhQOWFZdmsybGFkMGtscFhz?=
 =?utf-8?B?ZklDc0o3dk16dGdUbFcxeWM1VFRuSTlaRXU0VGJKNnBIUVh3dTlkWTNYamRS?=
 =?utf-8?B?Tm9wb2dDT2V5TGNBZTJ3dXNsNGlQNzBING5rTHlRMkN3bWluN3RTRzhRYTJv?=
 =?utf-8?B?aVRlQWdDS1pnbzYwRXJ0NnQ4RGd0M2c3NXYyN0o1QVUvUXgrVEZGL1NUbXBR?=
 =?utf-8?B?Ny9FaXNIVHFDWG1SQ0piUmErQm0zZ28xN24rQUFucjBmR2sxNE1lcExTNnhF?=
 =?utf-8?B?YVp0ZEtLWndvOW1LU1pwSXYwdWRPL2FYQmdMeEVXYlRYa1lsSU9oT1lCNTV6?=
 =?utf-8?B?Sis1ZnFpRXJNWHMwdUZUREM4ZVNHVmVwNTJQVXd0cXovSEVsd1BQNG5UY01X?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 838e5eaa-3631-4f90-12e7-08de37e37f50
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 11:58:57.0983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1urwboLebwBN2nnJVWBJyrE8R0YgJ4b+ewqqcIx80y0W2Pz5I2NuWD99eTWuVzChjcaQlmLYp+nKsgP5fpNFug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5EA507B64
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


On 27-11-2025 21:18, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from debugfs - dgfx_pcie_link_residencies
> to verify this.
>
> v2:
>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>   - Read residency counter as unsigned long long int instead of
>     unsigned long int.
>   - Print residency counter before sleep also.
>   - Don't assert if sysfs not corresponding to aspm_link_state
>     is not present. (Badal)
>   - Run workload before validation of aspm link residency. (Anshuman)
>
> v3:
>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>   - Move reading of residency to separate function. (Badal)
>
> v4:
>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>   - Resolve compilation warnings about using variable as format string
>     to sscanf.
>
> v5:
>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>     of igt_device_get_pci_usp().
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 160 ++++++++++++++++++++++++++++++++++
>   1 file changed, 160 insertions(+)
>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index 1749d6467..36c120a97
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs [] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +85,10 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   	munmap(done, 4096);
>   }
>   
> +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	unsigned long *done;
> +
> +	igt_info("Running on %s:%d\n",
> +		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
> +	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(done != MAP_FAILED);
> +	memset(done, 0, 4096);
> +
> +	igt_fork(child, 1)
> +		exec_load(fd, hwe, done);
> +
> +	*done = 1;
> +	igt_waitchildren();
> +	munmap(done, 4096);
> +}
> +
>   static void measure_power(struct igt_power *gpu, double *power)
>   {
>   	struct power_sample power_sample[2];
> @@ -370,6 +413,109 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +
> +static bool check_link_residency_entry(int fd_xe, const char* filename, uint8_t aspm_link_state)
> +{
> +	int fd_debugfs_dir = 0;
> +	int ret = 0;
> +	char *ptr = NULL;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, filename, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read pre %s.\n", filename);
> +	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", link_state_sysfs[aspm_link_state].parse_str);
> +	if (ptr != NULL) {
> +		sprintf(path, "%s%%llu", link_state_sysfs[aspm_link_state].parse_str);
> +		igt_debug("searching for-%s\n", link_state_sysfs[aspm_link_state].parse_str);
> +		sscanf(ptr + strlen(link_state_sysfs[aspm_link_state].parse_str), "%lu", &residency_pre);
> +		igt_info("Link residency before %"PRIu64"\n", residency_pre);
> +		igt_info("Waiting for link to enter idle....\n");
> +		sleep(5);
> +		ret = igt_debugfs_simple_read(fd_debugfs_dir, filename, buf, sizeof(buf));
> +		igt_assert_f(ret >= 0, "cannot read post %s.\n", filename);
> +		sscanf(ptr + strlen(link_state_sysfs[aspm_link_state].parse_str), "%lu", &residency_post);
> +	}
> +
> +	igt_info("Link residency after %"PRIu64"\n", residency_post);
> +	close(fd_debugfs_dir);
> +
> +	return (residency_post > residency_pre) ? true : false;
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +	char path[256] = {0};
> +	bool aspm_entered = 0;
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev != NULL, "Couldn't get pci device of upstream port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
> +
> +	/* Save current state of all available link sysfs entries and enable only the one needed. */
> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_info("%s not present to save\n", path);
> +			continue;
> +		}
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +
> +		if(i == aspm_link_state) {
> +			igt_debug("Enabling %s\n", link_state_sysfs[i].filename);
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +		}
> +		else {
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		}
> +		igt_assert_lt(0, ret);
> +	}
> +
> +	aspm_entered = check_link_residency_entry(fd_xe, "dgfx_pcie_link_residencies", aspm_link_state);
> +
> +	/* Restore states of L1 sysfs entries. */
> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_info("%s not present to restore\n", path);
> +			continue;
> +		}
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +	}
> +
> +	igt_restore_runtime_pm();
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +	igt_assert_f(aspm_entered , "ASPM Link idle entry failed!\n");
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +590,20 @@ igt_main
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +						      xe_engine_class_string(hwe->engine_class))
> +						do_exec(fd, hwe);
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +

LGTM,
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   	igt_fixture {
>   		close(fd);
>   	}
