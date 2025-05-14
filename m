Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480F6C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22A410E02F;
	Wed, 14 May 2025 22:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Grk+sorl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39C210E02F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747262116; x=1778798116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x7ftgvC487lUepCg8Po2N1Obp4SQCMbJPv1rjj7XqCA=;
 b=Grk+sorlbPxQ0oWquleywDS8mVIE1WAUMEkL3IYwLq/bAdRdPR9V4BBV
 U7ArB4GnCMCQ/plCtYGQQF6R6s6b5R+exiM3+royvQVBJP/0Gx1Q8a1vm
 jAcf1+FrZkCdzZdYICD5mb4StcnoZOyE06FC5D9HPY0/vg7uhJ1CZioV8
 nKRzb1B1k/ha4F4/JtXr9iKZXx1NYF0I8+h6X5BstnHEFPWLSN02AVtdO
 wvAUbBFBWVWPhPkgi5mequ1345W4dwZlNDZNFDygpeIXbEOdIz4TtoYZd
 DKx+yKWUILhzMmaQ1E1QyrBFUVPogSmFU+1ihwdz20Tr9tpJBd9PtviDK w==;
X-CSE-ConnectionGUID: ZqvP53waRISzrk+q8O13iQ==
X-CSE-MsgGUID: B1oCMdQUShC79bE+MFhKVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49165470"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49165470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:35:16 -0700
X-CSE-ConnectionGUID: B+ah2WQlTKasuIpDWPYIRw==
X-CSE-MsgGUID: ofJKoLwnTh6q0WChxLFCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169114556"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:35:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:35:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:35:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iipHMljlTW37yaADKQJP14CIXPio//grfPtdQUjw3jcWOZsBjaaaVZY0PrfpVG4lcyLEmLXckWGjNswqqixsSEdZhx+DKNFZRB2V4sEPopjRTzk12qIZ6gekV9UqozJ8wrhsNJPcRa4bGZ96zkG1jfE9tcxgd5cY0UAO/E5Y9qyWP2mpGLn7dOuoQwtWabeFZXfvnQgpr22aeMH6nHWx2zLfaDtO6ssUfNwBTZn8abTgoEX3bvnfVbmCZ3birp5Ww/3Oia/hcVd51BLXC0lVJGM871sf9tu4C/ruuAiUu7FZu2ftCDxF48pvklvxWdr/dyfTm+SK/n+DeEt2oLjAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YE6XXpX4BrsrpgUOPV/10wqTDKwwac4M+FkupIs1Qs=;
 b=Ns3h6Yt63VfPAhXLle328Z2cRpMiXIgbYx20G8EN/LgTYj6fbDfFPTjRB7gu/kiDxITr47IbXRQbjTE4g15KQ3ZypdmLO9OVWobSr0Op9LiooVnvxXEfi0+koLx7w/kMnNtvyB/+e36PNgPFt42/L2q3mbZJMyrfPP7WmflJhNG9lNFN0cyDKSKt3Ab1+GGr/A/vtwntjSBgbakNVE/3BHXSQpgn8i888OHSdzZXb3ejFx29zIXBaRBzxm18Y5/JGfPJ54nsBIogvWehw57rB8GagCPgdR6VvQ2Xc+uNzjJZann2kRr74lY3zDWF5QueJQWV2BgJSuDQ+v0kV/+Cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 22:35:12 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:35:12 +0000
Date: Wed, 14 May 2025 15:35:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 1/5] tests/intel/xe_pmu: Add a helper function
 to check and end cork
Message-ID: <aCUanYhFXDMhaQzo@unerlige-desk.amr.corp.intel.com>
References: <20250512070551.774270-1-riana.tauro@intel.com>
 <20250512070551.774270-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250512070551.774270-2-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::32) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|IA4PR11MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: bc460f77-5ad7-4a41-0a7d-08dd933796cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R28xYWcxQjFUa0hkSksyUHZCbjVwYkJ0Kzd4ckEyajNyY0xRbWFPbmg1eXFw?=
 =?utf-8?B?VzhwYUdMaWpNaGZMZE90ZHhoM1UvdldZMjI2U1o1ak1wUVFmVXduWkE2TDJC?=
 =?utf-8?B?RWU0ak1XU1pjRXNmK09YRXBGM0R6OXUrSUIrM0Zwd3lzaFpITnE0TCsxb3Yx?=
 =?utf-8?B?bzhWRnV6aklXY3dQYUk0VEk2Q2hnZzlMc1RlOXlSOGdsQkZ1MU80c0d5cG9w?=
 =?utf-8?B?Y2JreldmcnhBOU15dkg5SjU4RUY3cHczcEVhelRua0JjOUxPZk5NbjdEdVNs?=
 =?utf-8?B?cGh2V2JuRFh0dFEwTUZ3NVRJUVhoMzJtOVA3dXRuRU1yTFljeWR3SkZybmwx?=
 =?utf-8?B?aTNJaE9Ub0FDQmV4YWx5SWIvaThTNWd3K2UvYkNXdHZHSnFxdkNTMXdIL0hm?=
 =?utf-8?B?UW5TTUlqcDRzNWJudGhTOGl3Vng3blVzNXIzWGdPNHZsdFRkck1uL1ZINWth?=
 =?utf-8?B?RVBmQVNycmY4R1ZwS21LazNWTHBLQXJnWHl3V0hOTFgxVnJHYSsrbDNMeGFy?=
 =?utf-8?B?Rml1LzJlQnlXMVdpdGJ0N2FhdTdqRlQ4M1dmU3BQTWExRVlUcDI4QjM1UC82?=
 =?utf-8?B?MzRQMWlKQVBXei9NYzNFTjBvTVNIc2t1clBVL1A3NEdMclFKbXlxbmkwcWtk?=
 =?utf-8?B?Vy9PaWxRWFc0cWxmaXFnTTJ6R1hWSG95dmtPanVKeHpJU01MQm8wYkh2dnMx?=
 =?utf-8?B?Rld1WkZpd3lkZmt2azk4TmNBNVlLL1ptcjhKZ3JPbHdrcDRRdW1Tdkovejh5?=
 =?utf-8?B?RmgvOXppU3JYMUZyNVNmV29nOEkyVExIcysrNll0eWtCaGI3Qi9xcjFHdHF4?=
 =?utf-8?B?UmM1eitseC9GNTJFYXF4M2U5ZVkzZXlkY09CU3VzeTN1Um1Gc1BteDJNNFBM?=
 =?utf-8?B?aU92SVpYdWxpcXlGU01BeHd4Wmc1MmV3aGdxR3cwNnhwSVhRcXpQcXVRcis4?=
 =?utf-8?B?b2llQXRjWUlJUVl1bXNMbmswRDRSV3Q2d2wrYzBSaTl6M3VOVERxMG1hNVpu?=
 =?utf-8?B?MHoxZnVNWStWaTY3ZVNCVVUvSndhVW9TL1FmWkNsL3dqd1pwbTZSZTNVS0Fp?=
 =?utf-8?B?U2RpcXRaa1RRSWhhejBsSEJrcEkzdGtNdWJNTFJPRlBCSXA3TzhkNnI5K1VH?=
 =?utf-8?B?S2cxK3BMNTZKY0FJajFvdnk0ZWVXYjh3N29hUFdzeTJ3allWTU5WaTdQTm9U?=
 =?utf-8?B?VE95TGxLa1NjUlJzNng5MStiU29Ha3JOekdEaGRHNEVnQmlFWWNQdWtnUHU2?=
 =?utf-8?B?dWRPOUdoN3hqaGtveE8zOFFGZjdtRTRIU0p4emdmYWV5ekdmdk9tLzI2TVlM?=
 =?utf-8?B?QVg1TzZXUmYvYUdrSWNsaVp2RmZUeW0zS2FDRFZVNEZoeHRHTkNxTm9Qb282?=
 =?utf-8?B?bDduTWNVeFI2Snc3U0JmZUo4a0hvaWRtZVdxb215S2VoTjVhWVZtTEtOcng0?=
 =?utf-8?B?ZWhsNElDQ2IrY01hYnNpaUcvOFkxcmhyZytDRHpvem0zR1o4dHRvSnFoUEhn?=
 =?utf-8?B?aEJUR3pab3FNYTlBZ3BRdUpEYWVncVY4MXVGQ0Y3UVZFdHQ0TnhTMHpvM1Za?=
 =?utf-8?B?NVBIVlNFS1kzeEgvdUxsSDJQelUvdFN2aklJTzA2dVpKQWdCUGlGWENLL2Na?=
 =?utf-8?B?YnpXazhzRGpxNCthVXdRTzk3ck9tTS9lbXhiQ0lhODIwYmwzck9HemV5bmRY?=
 =?utf-8?B?UThTTVo3eEJqUU1qd2N3akNRQjZZUzN1bjM5MytzMlI1ZThRRTBlOXJnanJW?=
 =?utf-8?B?cnI5YUVaZTBlN0dUdUMzNnNRNVlXZmRTUmZvS1pkOWlWelMyUDZWVXFyR2tE?=
 =?utf-8?B?djFqV0lLU2VCcC90VlZ0ZU96N090NmxGbzBoRENZcFYxQzJZYU9lenlmekw4?=
 =?utf-8?B?d2pOSnV6MTBEbUpoczdRYk11T0ZKNE1HZDIvWXEyeSs2c3JGNTVRcjVuT0cr?=
 =?utf-8?Q?aBgW/J7mN60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXFac3dHODQwWVYxVTdkWjI5d04zcERNMmlPcU9DM0pPaDJ3UmNBQTA2R09K?=
 =?utf-8?B?WStFRU9EaGF2RzNydDVkUGw0VVN2eDJYN09zREc2NUt6UCtaZDJlaHViL2F2?=
 =?utf-8?B?QVE1cnVvek9vQ0RJZE93Mkh4TkxRb1plenpGWUtBN3RnSmtNbysreEE3WjNv?=
 =?utf-8?B?MVBFcWcvbFEvUVN4bWtPQ3g3OEpKUmwxQzEvTWN3ZytiWTlsNURBY3owVDZz?=
 =?utf-8?B?M1ByOGdBcndPalNzZ2FGV0FaR0hTODBkQjA2L0gyemdtUC8ydHRleTVQZytk?=
 =?utf-8?B?T3RuSmtHVXkyejlJYXEzOVZlK2VuK0k5MnZpUFlpZVIzMGd0dW1KSldFWmd3?=
 =?utf-8?B?emlpOG9zSUg1d2xUcFFzMVoxSUptMFZnaVNNWlVMQXJ4RjQ0UExFYUlJTjlU?=
 =?utf-8?B?Tk91U0p5cUo1bk80VWlGTUJISjZ4aHZiTnE3L3RFbUg1MzFBaWp2UUh3MEdq?=
 =?utf-8?B?YktlMEx2ZHZYS3ZVWmJaNjlDVXF1aXRMbS9tdTN1b1VjV051MjdkQ3hzaEJG?=
 =?utf-8?B?V083MG1ObmN1bUdIak5mODNYYUdSdHJBWm93TGNUK0crZ3BaeU0rNlRqQVhZ?=
 =?utf-8?B?bG1SSHZDMEZUYXZsdG1yTnJYK216eC9UK2lMTFNPS3VNQTFXQTB5cHIzOHRp?=
 =?utf-8?B?RXovSmF0VEk2c2MyeWFydG0wTTllU2Z3Yis0aEtSOEh5K1JyQS8vZ3JCb05E?=
 =?utf-8?B?cUxaNkRZYnNNYkR2UjZjUzJHMGxrcVVKN2ZWZmVYNWplb2F4OXhZRWJUU0tT?=
 =?utf-8?B?bUVOZEJUVGd2Z09zQnJyZnQ4c2UzTjl0QnV4VE9QQXFzWjNocWxTUnl1S0sr?=
 =?utf-8?B?RHJWTGN1eDhMR0dDYnZJcVR4Uk0zK0Vqa1FldHU2MGozajBPWThPU2lWU2Vi?=
 =?utf-8?B?Z2NpR2NpSHdzeUozTTdPSWdVdUhKK2xZSUxZeEJFaVUxVit3dmpKeGhGTW9U?=
 =?utf-8?B?WloyeVVvV3AyNTBjVDIyb0I2U0kvRUM0SHA0NE02SzlhT29GbWsxVEVvVSsv?=
 =?utf-8?B?dDlPcjFvazB1cTNHcTVCMGYzRG9obXhDanRabHBmY0JrUTRSbkhCOCttdTdq?=
 =?utf-8?B?aFFKWC9McXJRTGl5alpFOFlyUU5xZThvTTV4ZFdtYk04anRaZThCbG5qcXBD?=
 =?utf-8?B?Uk5idUhIRmY3VFJydzRzYWhjMDAvYmhxTHJKRkhPRk5JOG5rdUlURmRnODFj?=
 =?utf-8?B?U2c3ZXdqYVEwZDNHc3VMd2puNkpFU0pBR2xOSERxV3R4YlJpYU1RbkdlUUY2?=
 =?utf-8?B?eThPemZLWmNGb1dhS1dRZHhtSjE4Nk0wZjdqd3RJK0N4YnRCekNqci9HY0xw?=
 =?utf-8?B?cHA0ZVZoV0ZvVjN2NHcrSGMwMGRGcWoxWExhWEhGQnhKSWdFQVJPcnllSXkw?=
 =?utf-8?B?dDdqWnlSdEdIaUNQQ0dVVFdFcTFseW1MUUpmak5WaEpVWTR3TEx1Q2FEVGM1?=
 =?utf-8?B?cnpCZVBwVU55WlpXMkRMNEM0MjIvQWlaWVRnN3d2YVBDSDQwNlBkMXoyU3pS?=
 =?utf-8?B?VE5CRU9sZWFjSk1SaWhqOGRlRDhsdU8wZ0k4MytOeldndGpXRU1LUFFyRTd6?=
 =?utf-8?B?ZXRuZEVZYzJ5bldKY2VNdTdZb0loenpEOGt2aFFKbVE3cG5xSEZNQUYxbTls?=
 =?utf-8?B?RUkxT2Nad2ZpamNTTkZ3bWswMjM5QSt0NCsrWjU0WkY4bm8zWU1MRjJod3dU?=
 =?utf-8?B?OXRKdlNpY2RVMU51ajM3RFo4Ymc0dHBqTHZLRXExUHlCVXpodDcvWk5vV1JV?=
 =?utf-8?B?T2JiRnZEL05BNGdMTC91aTEwNkR6KzlBNmg0QjlGU3MvOXYrSEI0b0hzc0d5?=
 =?utf-8?B?N25zMjYwemJqRk53N203VnlGZ1NlN1ZqTmVnTmFCV0ZxYjk0UWZHenpUMHJs?=
 =?utf-8?B?bk85dmlwcVdrVHI5K1Z1U090L1NGNzlYV3p5Snd1S0cvUm5GN2ZGL2M4aFBE?=
 =?utf-8?B?WmVWRHdhSHFvOVp5d2pwQXA5bmtWZDV0V1dESFhLNXBkQXlrZ1FPYWk3Y1NM?=
 =?utf-8?B?b1ljM0xjV2xwejc0S3dFelpuK3IzZ3BVYmMxYjFwRDFycjlub01rMWVTbExi?=
 =?utf-8?B?cG4zUU4xODZDamZXV0dBWmtKQkxpc0Z1dTYrL2lyaGo3WklnQXFkbGRzVThj?=
 =?utf-8?B?emNMeGthV0tBWktwaUs1ODdWa2I2UXg2eDVuNzlET0JZcGJFZDU3Q2VoR3A1?=
 =?utf-8?Q?zsRmnNjNBONhdGzlYzpv17U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc460f77-5ad7-4a41-0a7d-08dd933796cb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:35:12.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RDb7EjUV95p1vx90QSY4i7y8IJcva9TprHxhpXlXMZzzzZi3+/qduF3tBY3IY5TIGceBrDUYVJpYXeZCiMz2Ufj/fRR1Xa5sr01MCGfCFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
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

On Mon, May 12, 2025 at 12:35:47PM +0530, Riana Tauro wrote:
>Add a helper function to check if cork is active and
>end cork
>
>v2: use single function (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 18 ++++++++++++------
> 1 file changed, 12 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 2e29a4056..9b57b5bfc 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -134,6 +134,12 @@ static uint64_t get_event_config_fn(unsigned int gt, int function,
> 	return get_event_config(gt, eci, event) | add_format_config("function", function);
> }
>
>+static void end_cork(int fd, struct xe_cork *cork)
>+{
>+	if (cork && !cork->ended)
>+		xe_cork_sync_end(fd, cork);
>+}
>+
> /**
>  * SUBTEST: engine-activity-idle
>  * Description: Test to validate engine activity shows no load when idle
>@@ -169,11 +175,11 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 	pmu_read_multi(pmu_fd[0], 2, before);
> 	usleep(SLEEP_DURATION * USEC_PER_SEC);
> 	if (flags & TEST_TRAILING_IDLE)
>-		xe_cork_sync_end(fd, cork);
>+		end_cork(fd, cork);
> 	pmu_read_multi(pmu_fd[0], 2, after);
>
>-	if ((flags & TEST_LOAD) && !cork->ended)
>-		xe_cork_sync_end(fd, cork);
>+	if (flags & TEST_LOAD)
>+		end_cork(fd, cork);

I think, you could just call end_cork unconditionally here ^.

Rest looks good,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
> 	engine_active_ticks = after[0] - before[0];
> 	engine_total_ticks = after[1] - before[1];
>@@ -244,7 +250,7 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
> 		int idx = i * 2;
>
> 		f = &fn[i];
>-		xe_cork_sync_end(f->fd, f->cork);
>+		end_cork(f->fd, f->cork);
> 		engine_active_ticks = after[idx] - before[idx];
> 		engine_total_ticks = after[idx + 1] - before[idx + 1];
>
>@@ -305,7 +311,7 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
> 	usleep(SLEEP_DURATION * USEC_PER_SEC);
> 	pmu_read_multi(pmu_fd[0], 2, after);
>
>-	xe_cork_sync_end(fn_fd, cork);
>+	end_cork(fn_fd, cork);
>
> 	engine_active_ticks = after[0] - before[0];
> 	engine_total_ticks = after[1] - before[1];
>@@ -433,7 +439,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
> 	max[0] = (end[0] - start[0]);
> 	max[1] = (end[1] - start[1]);
>
>-	xe_cork_sync_end(fd, cork);
>+	end_cork(fd, cork);
>
> 	/*
> 	 * Restore min/max.
>-- 
>2.47.1
>
