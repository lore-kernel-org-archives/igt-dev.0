Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7405BC83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 17:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128CB10E1BA;
	Thu,  3 Jul 2025 17:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GP/2vA7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86A10E1BA
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751564985; x=1783100985;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZpeLxf1JcHDavh7HwaQ2+89nFgSWNV8mNAxreE8fKks=;
 b=GP/2vA7NjTzvwX3Ssnz1CicPg8lI5CkSgY3XYcX2r1J/FLALYo+OUauZ
 yB6NB7tMxqCxUxIFWUeAuRj0jWbVDuq1by735pIENpBfvXNWF0ksg4u+g
 AcqH3CjX8kMgmmc5lGxJbaf/r2cha9+g+euknJCIs1IW8id9fOO2Uw3pZ
 H5hsBLfVE3w5OpMH1EAdaQCJufpGcp5un9bCWnxmFIhf9NGCwiSICsIry
 x2v78KXfoXB/DNx03e/TEsZ3/d1IvGFyoY7CwUrYx3cAx2QJjwAK537oq
 yw66+m5srEYcCkfbV0OLpRU9qETiIjxYWJhy9vYoKEEMH6upJYJYSfGka Q==;
X-CSE-ConnectionGUID: PPrAEuFnSZWGk6UBaonS5A==
X-CSE-MsgGUID: 3u2Yzo33QwWtCTbJDapwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53768604"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53768604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:49:45 -0700
X-CSE-ConnectionGUID: eO3xnQk2TP62p/ZE9mumdg==
X-CSE-MsgGUID: iaHN8E27RxSsq1kU3y4g7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159947799"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:49:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:49:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 10:49:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGOo9nakfO/D4CpQaiLr78v/KTjtrQXb3M0WiYJ1hQheTtNu0h+sslHLKlpBrNTmSta7ltb1lTgRg5s5UPahL2tJuQYtUaG3M1pYBgV7Z3+e9pAn+fRe3pRO0tRKqkiy6FSIW0ldogpbPR02SA24rF0pe+9QHGeBLSoA1uuTK9SB1hqeFvI50OlgDkDWFn1eG0i6CHIBzPhcrFm+mvlqHPZQej+cq/sdrU6pVQd8gUNGM6GD998wbIRWPrkyJPWA5zK2OPOjNVbEV6ppFrC74+qEcpG2xOI4SDYioNA87K1rdWZwSLwpjCn5DRK1T39rl3tkx6VWLPmu9Aq03lPFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwK1HhlGX0ZW7FgLWpZP34fNI2TKgTqzCbGHsLQ1ydc=;
 b=cBIIDmpKUzrL53l/IpQA3JK6pq+gv81LNzqluqN0BkGTqPoKJ6+5y/rm0fIgdsM4vVpfWYtXzHxP98lxKajayVsPuh3/ZhZFO2ADBShEetN21JFLt5mSTfxhYE6ri9X3VW66YK/nW+byKqMTJeoBzWtkCQ1vU8/a5ESl+iuGPSRJbUYb5gmA9kdwet7J/+CfJ9KZAl8mLWN1+D1c77FV/zCl79VNTSgcps3tjzihEETD+wXgua+EkA+axYLo6oWB96xmaSPMdiDaUtejr1Vc3Qhd21I21BIPcweX8AzUxrbvK4rqyYnWHs0MIWeESbyUsrAK6T6KrPBTeFszjiqUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 3 Jul
 2025 17:49:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 17:49:40 +0000
Date: Thu, 3 Jul 2025 10:51:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_system_allocator: Add prefetch
 sections
Message-ID: <aGbDGTkS6D8PSD+c@lstrano-desk.jf.intel.com>
References: <20250616070640.2061642-1-matthew.brost@intel.com>
 <20250616070640.2061642-2-matthew.brost@intel.com>
 <BL3PR11MB57474C43E4168D36750DA552D07AA@BL3PR11MB5747.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL3PR11MB57474C43E4168D36750DA552D07AA@BL3PR11MB5747.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4682e6-6e00-42f7-f48b-08ddba59fc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlZHVkRuU2V0eGxxVjNGcHdYZDNHcVlDL2dZQ0RPeERzSEdJRjJ1Z3Rja2w3?=
 =?utf-8?B?ZE5vdHhHNys4TmQwMTBYMDZZT2RER2JDYXNCdUlDbWk1eUYySFo2bGp3dlJG?=
 =?utf-8?B?WFRycGNHNTF5ODlDOS8wQ0tkdmMxSzZDRlp6S0dTWTJHT0laRVlWMDZ6WE9q?=
 =?utf-8?B?SStFSEE4STZtdzFFUE5kenBWNjZFWGxHL3VuWVE5blV3QXhpSjl4TlRtQ3F2?=
 =?utf-8?B?OHd3VnAyMzlZU2EzYjE1L29UZml2UzBpdnBYNFJqL2JVbXJLaTBncjF1YnBO?=
 =?utf-8?B?QyttdVFHTi9kSGpvbWNOaS8xdlUwR0dlMHJnbjZEZjlqbDZ6NTdaaEkyY2Zp?=
 =?utf-8?B?a2FPUkEyVDVHZUhWVThoSExnZmh3RTJpbTZnMWgvcFp4UDNBMjZqVTVBcjVP?=
 =?utf-8?B?Ti91d1NHbXZlczVMZEFFVFJSbDhOd3RvMjMrazRybi9NQm5MYXVGSktPSDdM?=
 =?utf-8?B?UHhEWThNdFdQQlNaSmxGQ1Z5SlNLTm00WGxFYkxXM1g0UGpwbHZ0cWJjaFBm?=
 =?utf-8?B?VzlYRUVmeExBdkhkSmdTV1p1eG9XRzNoRHRVQ3ZkMlRUclB2TmZvVEhDVzNz?=
 =?utf-8?B?eWt4a3l1YzVaVjFlUTVTK0ZXUTJ0TnhWK0VsQk1TTlJVd2VVZGl4SmIxcnhX?=
 =?utf-8?B?RUl2WTZZdUdGQnNkRjV3QTdXTkRVMzNXRVNVODVQNyt5ZFVHdS95c0RLOS8z?=
 =?utf-8?B?aDdvazVuUWFhbFFIRjRiUnY5UzVVSDRWNUs4TUdtS01tMm5BbzJnSW5nU0Jq?=
 =?utf-8?B?QlNrQzIrd2txZVkxNGJkNXJUZ2lGLytuQ1BCTEVHVi9OUzh4TC9CTW5RUDM5?=
 =?utf-8?B?V3RGQ3U2SEhVNHBUU1pzZnR0anRZdWpyc0xwRGgvZUt1bHZGWlZEcUJHRXlW?=
 =?utf-8?B?ZkNoeHFlQWhKUHBzOUt3cDg2NmlRNVFSQnRXSHRaTHY3eVdiVXJKSmJIYWM4?=
 =?utf-8?B?Q2xHSTVXWEwyZWY4NE8wSW1oSGNnMU51SGsySWJ0eUpLbktPbWFVdk55MkpM?=
 =?utf-8?B?cEVJckN5cnJ0QWJrem9SdVdKUlZGR2swczNSMEV4dVFmT2p0YXhMTzJ5T2pr?=
 =?utf-8?B?dWRVMGVTbEZQbzJjY1BxZUJLbm1rZEZVeGZ1dFNDaGE4bkZVaEp5cnZUU1ZE?=
 =?utf-8?B?ekhHRDVNN3JPekxoMUVJVCszRFdzQ3NLL1E3cG1udE05L1dpUFgydEFpVDZt?=
 =?utf-8?B?NGx1TzZxQ0NQRlAvaXVsTVQyQWE3VTFlUURTVlFaeGVxaEhmMmFUeWx5Q2JX?=
 =?utf-8?B?Vk0vOHZmb0pOQ2p6UzZaK0lhUk9vNnFyMjkvZDg1ZDAveGRyeFBqNDdoZ3RE?=
 =?utf-8?B?R0pUdFZEUjRxS3VtblBNbHpDSzZoVzZzRHBvNXJMU29CN0xXREYyeExmL3du?=
 =?utf-8?B?andRcUxLcXBwOTQzUk1VeEdwaUwrUGZPOGZyWEZrOXJ6NmlpUi9US3RrbUow?=
 =?utf-8?B?U2FNdFM4RHdiaGR0K0pqY00vTW1JV3ZVOENrdGZEaVhJVk9KdkZ4UldlZzlk?=
 =?utf-8?B?UFR0L0d0YzlNSXIydmdOZ3M3MnlPd3c4bkV2U0tDOFc1UnczZWJQeno0a1cr?=
 =?utf-8?B?eGRTWTQwRHY5aDZEeWVqR1IzYWdwRnFReHVDcEZvcW5TdDJWSGsxSjNaV3g4?=
 =?utf-8?B?V3g1Z0FBM3BXVkRubnRzMktWM0t0clV4c28wemYrVXd0T2toc1VEWWptNUxj?=
 =?utf-8?B?Ym1Qc281bWo2TlAxY0lXTm1EaEtYQVhKT3hMbVNUZUtNYWVvSTVpRFkra3pS?=
 =?utf-8?B?U2ZTblBUeXBtYnpXa0FlamJzdksvL2J1L2ptVis3UmNtSFQzeVp3aXBCL2hz?=
 =?utf-8?B?Rm15c1lnNm0zN3BESGFDV0hMVEE4OWpFV2kzUTNHR2YzQ09wNlV5Q0V2OWp1?=
 =?utf-8?B?amJyc0tGS3RoZGx1U1F6Sit1YzRJYVR2K3pSZzBNajVja1ozcE9QZ0tJaC9I?=
 =?utf-8?Q?HQka3mdOu5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1BER05Ta01zV2t0RG13aW5vaGZXQWh0WTc5NDYxbFg5R3VQenpRWHJabU9i?=
 =?utf-8?B?VzhIa2kydFhuRWdxNTVhQzhHa2Yxc1lGSTQvR3BQYnlodU1QUFdRb2tWN29Y?=
 =?utf-8?B?TlB2Qi95ajEwOWVxRno3R2FaaVZMbEZHR1ZkbUlibnVYaDFTbzUxZlJ2REpP?=
 =?utf-8?B?RFFndVc3aXVmUXNsYndpd0I0UWYrL2pkVlhXKzh4TDF4TnZ2R2lpNDNrRC80?=
 =?utf-8?B?MktNT3lxSXpDdVc2ekRDbng5Wk1nVFYxNDVVd3J2eUNFaTdyRG1OS0ZFcHJQ?=
 =?utf-8?B?NlFaTkVPV2o3VVhtaWhBS1lzZkV1ak9Dbkd2aDZVRmw1V3ZQTURMd1lwR3Mr?=
 =?utf-8?B?WktrSkxESXZISHp0UUNYaXF6WFZyUkpZR0lkY2tKS2pmbC8zYkwzam5ZTDFa?=
 =?utf-8?B?Uk96SFNIZUMzQ09RV2cwSEZwWGd2NGluVEJYT2dnVTJCVjdJbjU2bnhSeWJO?=
 =?utf-8?B?d1ZHayttbURmdXVTeFpxMFNwU0NVZTRpN1MwTzZwaXIrV2NLRFNvV0NmbGtB?=
 =?utf-8?B?Z0JDd1YrdzU2V0I5NVRGU1dSVDNzYStSbVdMSnhOMzRrSGdaNHROVEk5dCtv?=
 =?utf-8?B?LzNYR1ZNT3JlZjQ3eFdJMnUzS05ZY2FRL2p6TWE1SDBDQ1QxcUxRNU4zZi80?=
 =?utf-8?B?RUYrdUtReEwvVnZxcUtjdCtha2ZtbnowUWVHK2Z3UVIyRFZwd0JqSGxvendw?=
 =?utf-8?B?akZycXdSUUpWNmpjWFJ0akpSaHdleW9uUGx3SGsyajF1VElmQko5UjhGblNk?=
 =?utf-8?B?SkhTbHlBZCtxU0ltTWVsYkM1WkxSUUZrcVlhTXZTd2NaczhGU2l4c2xDRU1j?=
 =?utf-8?B?VnJOYVZzZkpjOU9WRGxEZ3BjdU1IaVhoTHhRbU8xRGdpQ2t6Qjg2Mnd6Y0tl?=
 =?utf-8?B?aW1MK0dqSmE3V2UzWHhmMDFtVktTdFNKbE1vWFBRQ3VueEIwZjhVMmFyc0Nr?=
 =?utf-8?B?dmdDeVdOdTRic2FMZ0tQczV0TzVYWmFlT2kveE84b3lMZjJtbE1iNnUxbGZN?=
 =?utf-8?B?Q3hXUXpMU0RPazlNWHhneElSbHo2eTNWWUpuS3VqYnlPdzJoMk9XbHhlOENJ?=
 =?utf-8?B?dnE5czBPVktQNURFQ1VMRjd3L1VqaTJrMUo2ay83R2p3NE5kQzZ4VnBTYnl5?=
 =?utf-8?B?M29UdDJSYzJaODRrMFdvMTdTd3lCT2FkSjZKeWRBOUo5RVphT1JraUppNWlQ?=
 =?utf-8?B?cDNZODFGYkZnZ3Y4cFY4SWI1dnNndUswd3pYNjZyL2VHRldVaTZ2emR4L3cz?=
 =?utf-8?B?dEkwOFVJUHBkY1BzWGFhcVRQei9Kc3BLQnZ2RGhnSFdES093bVZGamoxQXhn?=
 =?utf-8?B?NjRGdlM2YzMwR0QweElIdmdBWkFjaUE0VGt2NTFPeW1RVnVjY0lYZHdxR0hN?=
 =?utf-8?B?YTdWQytmNkNXTVhGeXhGRkt1Y2hqaDJsQjJwSTNjalZLQ2pGTE1vSWI5djF5?=
 =?utf-8?B?WDRPcXFRcU9pMmJjeVlIOERTQmtQdytjN1hXYlJnUFJLeWJndW5CZVk5eHNh?=
 =?utf-8?B?QWQ5RG9na3NEc1RzcnR3bCtWc1A1cWs2R2hmUWllM0dZanhwY3VTa3hZbHNY?=
 =?utf-8?B?eXUybGk5L20rN2Njc2NKd1N5UGpqNytoeWVxaVQvTEljZzlJL1EzTjRlZEdH?=
 =?utf-8?B?T0xnY2p1OTk1anptdzI4YVFEU09DUHhkQUlMSjU0VGZlM2tsSk1CTmU4WDJ3?=
 =?utf-8?B?cU5hUnVJVDQxTnNpYy82WmlNMVpkRmcycTRFQjRIVzdyM2hEQUFqMTA5dWlp?=
 =?utf-8?B?WnltNklCbGg3Z3dmNnNiaXVnZXUybGp4ZktQWjRobEtVRjFlVjkvMjRyakdS?=
 =?utf-8?B?cm1VbXhudlpCQ2gyMzEzdys5R1NBK2FKUVZKN2NicnBQbFZPaDMwZ2lRenp6?=
 =?utf-8?B?Mk9BWEp4NFpQblptSjBVSEd5bmtmNnQ5ak16L1NQRkFvcXZoSEtrSFNISEw0?=
 =?utf-8?B?bVRQL2Evc0p4ZFFhYStQSE1CNU90VGxBaWRVdVBTR0ZVNjVsbWE4MStSaWZH?=
 =?utf-8?B?Z2ZsQmVqRFJ1aWxhZkpCa3hBemFjSUVLZU8xRkcvNWp1aUJOZll6Qmx6enNV?=
 =?utf-8?B?aUxNaUJ3S2ZlM3Qvak9CSHMyczRIV3dBZlI2QlU2bm01aW01WVpPWEx6dXZH?=
 =?utf-8?B?eVhjSEpPcFlPZ2s4Z210OFNsdFdyaVpHUXc0WjR2dWZZTnBodFdWSW53dXlS?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4682e6-6e00-42f7-f48b-08ddba59fc20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 17:49:40.3591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqjPmhn9uv7dE26EHSV0nl7cdO4o13EhgJ0U70wUE0dznpDZSlBm0hMVRXGvZwKPN9AxD4KAp8q1dF2xCvEMuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
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

On Thu, Jun 26, 2025 at 11:25:47AM -0600, Ch, Sai Gowtham wrote:
> Hi Matt, 
> 
> I was revisiting the code and here are my few observations,
> 
> >-----Original Message-----
> >From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthew
> >Brost
> >Sent: Monday, June 16, 2025 12:37 PM
> >To: igt-dev@lists.freedesktop.org
> >Subject: [PATCH 2/2] tests/intel/xe_exec_system_allocator: Add prefetch sections
> >
> >Update the test_exec() function with flags to initiate and understand prefetches.
> >Prefetching is tested by verifying that the fault count in the GT stats has not
> >increased. However, a mismatch does not cause the test to fail—instead, a
> >warning  is printed. This is due to the unreliability of system allocator behavior; the
> >added sections primarily serve to ensure that the driver remains stable.
> >
> >That said, if the page fault counts are consistently incorrect, it may indicate a
> >problem in the KMD.
> >
> >A prefetch benchmark section has also been added to help profile prefetch
> >behavior  in the KMD.
> >
> >Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >---
> > tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
> > 1 file changed, 116 insertions(+), 5 deletions(-)
> >
> >diff --git a/tests/intel/xe_exec_system_allocator.c
> >b/tests/intel/xe_exec_system_allocator.c
> >index 65d281c784..6899da5c44 100644
> >--- a/tests/intel/xe_exec_system_allocator.c
> >+++ b/tests/intel/xe_exec_system_allocator.c
> >@@ -21,6 +21,7 @@
> > #include "lib/intel_reg.h"
> > #include "xe_drm.h"
> >
> >+#include "xe/xe_gt.h"
> > #include "xe/xe_ioctl.h"
> > #include "xe/xe_query.h"
> > #include <string.h>
> >@@ -770,6 +771,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci,
> >unsigned int flags)
> > #define SYNC_EXEC		(0x1 << 19)
> > #define EVERY_OTHER_CHECK	(0x1 << 20)
> > #define MULTI_FAULT		(0x1 << 21)
> >+#define PREFETCH		(0x1 << 22)
> >+#define THREADS			(0x1 << 23)
> >+#define PROCESSES		(0x1 << 24)
> >+#define PREFETCH_BENCHMARK	(0x1 << 25)
> >
> > #define N_MULTI_FAULT		4
> >
> >@@ -878,14 +883,17 @@ partial(int fd, struct drm_xe_engine_class_instance
> >*eci, unsigned int flags)
> >  * arg[1]:
> >  *
> >  * @malloc:				malloc single buffer for all execs, issue a
> >command which will trigger multiple faults
> >+ * @malloc-prefetch:			malloc single buffer for all execs,
> >prefetch buffer before each exec
> >  * @malloc-multi-fault:			malloc single buffer for all execs
> >  * @malloc-fork-read:			malloc single buffer for all execs, fork a
> >process to read test output
> >  * @malloc-fork-read-after:		malloc single buffer for all execs, fork a
> >process to read test output, check again after fork returns in parent
> >  * @malloc-mlock:			malloc and mlock single buffer for all
> >execs
> >  * @malloc-race:			malloc single buffer for all execs with
> >race between cpu and gpu access
> >+ * @malloc-prefetch-race:		malloc single buffer for all execs,
> >prefetch buffer before each exec, with race between cpu and gpu access
> >  * @malloc-bo-unmap:			malloc single buffer for all execs, bind
> >and unbind a BO to same address before execs
> >  * @malloc-busy:			malloc single buffer for all execs, try to
> >unbind while buffer valid
> >  * @mmap:				mmap single buffer for all execs
> >+ * @mmap-prefetch:			mmap single buffer for all execs, prefetch
> >buffer before each exec
> >  * @mmap-remap:				mmap and mremap a buffer for
> >all execs
> >  * @mmap-remap-dontunmap:		mmap and mremap a buffer with
> >dontunmap flag for all execs
> >  * @mmap-remap-ro:			mmap and mremap a read-only buffer
> >for all execs
> >@@ -896,6 +904,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci,
> >unsigned int flags)
> >  * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only
> >buffer with dontunmap flag for all execs, check data every other loop iteration
> >  * @mmap-huge:				mmap huge page single buffer
> >for all execs
> >  * @mmap-shared:			mmap shared single buffer for all execs
> >+ * @mmap-prefetch-shared:		mmap shared single buffer for all execs,
> >prefetch buffer before each exec
> >  * @mmap-shared-remap:			mmap shared and mremap a
> >buffer for all execs
> >  * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with
> >dontunmap flag for all execs
> >  * @mmap-shared-remap-eocheck:		mmap shared and mremap a
> >buffer for all execs, check data every other loop iteration
> >@@ -907,6 +916,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci,
> >unsigned int flags)
> >  * @free:				malloc and free buffer for each exec
> >  * @free-race:				malloc and free buffer for each exec with
> >race between cpu and gpu access
> >  * @new:				malloc a new buffer for each exec
> >+ * @new-prefetch:			malloc a new buffer and prefetch for
> >each exec
> >  * @new-race:				malloc a new buffer for each exec with
> >race between cpu and gpu access
> >  * @new-bo-map:				malloc a new buffer or map BO
> >for each exec
> >  * @new-busy:				malloc a new buffer for each exec, try to
> >unbind while buffers valid
> >@@ -941,6 +951,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci,
> >unsigned int flags)
> >  * @mmap-new-huge-nomemset:		mmap huge page new buffer for
> >each exec, skip memset of buffers
> >  * @mmap-new-race-nomemset:		mmap a new buffer for each
> >exec with race between cpu and gpu access, skip memset of buffers
> >  *
> >+ * SUBTEST: prefetch-benchmark
> >+ * Description: Prefetch a 64M buffer 128 times, measure bandwidth of
> >+ prefetch
> >+ * Test category: performance test
> >+ *
> >  * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
> >  * Description: Create multiple threads with a shared VM triggering faults on
> >different hardware engines to same addresses
> >  * Test category: stress test
> >@@ -998,14 +1012,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> >*eci,
> > 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > 	struct test_exec_data *data, *next_data = NULL;
> > 	uint32_t bo_flags;
> >-	uint32_t bo = 0;
> >+	uint32_t bo = 0, prefetch_sync = 0;
> > 	void **pending_free;
> >-	u64 *exec_ufence = NULL;
> >-	int i, j, b, file_fd = -1, prev_idx;
> >+	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> >+	int i, j, b, file_fd = -1, prev_idx, pf_count;
> > 	bool free_vm = false;
> > 	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> > 	size_t orig_size = bo_size;
> > 	struct aligned_alloc_type aligned_alloc_type;
> >+	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
> >+	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
> >+	uint64_t prefetch_ns = 0;
> >+	const char *pf_count_stat = "svm_pagefault_count";
> >
> > 	if (flags & MULTI_FAULT) {
> > 		if (!bo_size)
> >@@ -1136,6 +1154,43 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> >*eci,
> > 		memset(exec_ufence, 0, SZ_4K);
> > 	}
> >
> >+	if (!(flags & FAULT) && flags & PREFETCH) {
> >+		bo_flags =
> >DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> >+
> >+		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> >+		prefetch_ufence = aligned_alloc_type.ptr;
> >+		igt_assert(prefetch_ufence);
> >+		__aligned_partial_free(&aligned_alloc_type);
> >+
> >+		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> >+					     bo_flags);
> >+		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> >+
> >to_user_pointer(prefetch_ufence));
> >+
> >+		sync[0].addr = to_user_pointer(prefetch_ufence);
> >+
> >+		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
> >+
> >+		if (flags & (RACE | FILE_BACKED |
> >+			     LOCK | MMAP_SHARED | HUGE_PAGE)) {

btw - there is bug here, should be:

               if (flags & (RACE | FILE_BACKED |
                            LOCK | MMAP_SHARED | HUGE_PAGE) || !region) {


> >+			region = 0;
> >+			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> >+					     1, region);

Please wrap replies at reasonable intervals (e.g., 80 lines or so) for easier
parsing.

> I see this coverage dose create prefetch address ranges for system memory and not specific to VRAM's, having said that in some coverage like (region || flags & (NEW | MREMAP))  I could see from dmesg prefetch ranges are migrated to VRAM's 
> However I'm trying to understanding do you thing we need some coverage in creating prefetch ranges specific to VRAM and use them for further exec submissions.

As long as the section doesn't have any of the flags tested which are tested
here, it will do a prefetch to VRAM in the main loop.

> >+			xe_wait_ufence(fd, prefetch_ufence,
> >USER_FENCE_VALUE, 0,
> >+				       FIVE_SEC);
> >+			prefetch_ufence[0] = 0;
> >+		}
> >+
> >+		if (exec_ufence) {
> >+			xe_vm_prefetch_async(fd, vm, 0, 0,
> >+					     to_user_pointer(exec_ufence),
> >+					     SZ_4K, sync, 1, 0);
> >+			xe_wait_ufence(fd, prefetch_ufence,
> >USER_FENCE_VALUE, 0,
> >+				       FIVE_SEC);
> >+			prefetch_ufence[0] = 0;
> >+		}
> >+	}
> >+
> > 	for (i = 0; i < n_execs; i++) {
> > 		int idx = !stride ? i : i * stride, next_idx = !stride
> > 			? (i + 1) : (i + 1) * stride;
> >@@ -1186,6 +1241,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> >*eci,
> > 		if (!exec_ufence)
> > 			data[idx].exec_sync = 0;
> >
> >+		if (!(flags & FAULT) && flags & PREFETCH &&
> >+		    (region || flags & (NEW | MREMAP))) {
> I don’t see we are testing MREMAP with prefetch (at least we don’t have this subtest being added in main) , do you think we should still use this flag here. 
> >+			struct timespec tv = {};
> >+			u64 start, end;
> >+
> >+			sync[0].addr = to_user_pointer(prefetch_ufence);
> >+
> >+			start = igt_nsec_elapsed(&tv);
> >+			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> >+					     1, region);
> Rebinding of prefetch ranges I feel it's a bit tricky, initially we are are by default creating prefetch ranges in smem and rebinding/remapping of region zero prefetch ranges here again
> I'm not completely aligned to it.
> 

In the case of region being non-zero (VRAM), as soon as the test touches the
memory it is moved back to SRAM. In the case of (NEW | MREMAP) this is a new
buffer or VA. In either case to avoid a fault, we need to issue another
prefetch.

> In case of VRAM, we should keep platforms which dosen't support vram in mind before prefetching non-zero regions.

I'm not following.

> >+			end = igt_nsec_elapsed(&tv);
> >+
> >+			xe_wait_ufence(fd, prefetch_ufence,
> >USER_FENCE_VALUE, 0,
> >+				       FIVE_SEC);
> >+			prefetch_ufence[0] = 0;
> >+
> >+			prefetch_ns += (end - start);
> >+		}
> >+
> > 		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
> > 			addr + (char *)&data[idx].exec_sync - (char *)data;
> >
> >@@ -1277,6 +1351,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> >*eci,
> > 				} else {
> > 					igt_assert_eq(data[idx].data,
> > 						      READ_VALUE(&data[idx]));
> >+					if (flags & PREFETCH_BENCHMARK)
> >+						memset(data, 0, bo_size);
> >
> > 					if (flags & MULTI_FAULT) {
> > 						for (j = 1; j < N_MULTI_FAULT;
> >++j) { @@ -1359,6 +1435,26 @@ test_exec(int fd, struct
> >drm_xe_engine_class_instance *eci,
> > 		prev_idx = idx;
> > 	}
> >
> >+	if (flags & PREFETCH_BENCHMARK)
> >+		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
> >+			 1e-6 * prefetch_ns,
> >+			 bo_size * n_execs  / (float)prefetch_ns);
> >+
> >+	if (!(flags & FAULT) && flags & PREFETCH &&
> >+	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
> >+		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> >+							   pf_count_stat);
> >+
> >+		/*
> >+		 * Due how system allocations work, we can't make this check
> >+		 * 100% reliable, rather than fail the test, just print a
> >+		 * warning message.
> >+		 */
> Why can't we rely on "svm_pagefault_count" ? Should we expect any false svm pagefault's ?
> >+		if (pf_count != pf_count_after)
> >+			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
> >+				 pf_count, pf_count_after);
> >+	}
> >+
> While going through the code, I've realized we are missing error handling mechanisms during prefetch.
> 

That is part of part of this - but it more there isn't a way to guarnetee the
core MM does not invalidate the buffer - this is completely out of the drivers
control. Prefetch really is just opportunistic - hopefully it avoids faults but
no guarnetee.

Matt

> -----
> Gowtham
> > 	if (bo) {
> > 		__xe_vm_bind_assert(fd, vm, 0,
> > 				    0, 0, addr, bo_size,
> >@@ -1370,6 +1466,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> >*eci,
> > 		gem_close(fd, bo);
> > 	}
> >
> >+	if (prefetch_sync) {
> >+		munmap(prefetch_ufence, SZ_4K);
> >+		gem_close(fd, prefetch_sync);
> >+	}
> >+
> > 	if (flags & BUSY)
> > 		igt_assert_eq(unbind_system_allocator(), -EBUSY);
> >
> >@@ -1435,7 +1536,7 @@ static void *thread(void *data)
> >
> > 	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
> > 		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> >-		  t->flags);
> >+		  t->flags | THREADS);
> >
> > 	return NULL;
> > }
> >@@ -1553,7 +1654,7 @@ static void process(struct
> >drm_xe_engine_class_instance *hwe, int n_exec_queues,
> >
> > 	fd = drm_open_driver(DRIVER_XE);
> > 	test_exec(fd, hwe, n_exec_queues, n_execs,
> >-		  bo_size, stride, 0, NULL, NULL, flags);
> >+		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
> > 	drm_close_driver(fd);
> >
> > 	close(map_fd);
> >@@ -1604,14 +1705,17 @@ igt_main
> > 	struct drm_xe_engine_class_instance *hwe;
> > 	const struct section sections[] = {
> > 		{ "malloc", 0 },
> >+		{ "malloc-prefetch", PREFETCH },
> > 		{ "malloc-multi-fault", MULTI_FAULT },
> > 		{ "malloc-fork-read", FORK_READ },
> > 		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> > 		{ "malloc-mlock", LOCK },
> > 		{ "malloc-race", RACE },
> >+		{ "malloc-prefetch-race", RACE | PREFETCH },
> > 		{ "malloc-busy", BUSY },
> > 		{ "malloc-bo-unmap", BO_UNMAP },
> > 		{ "mmap", MMAP },
> >+		{ "mmap-prefetch", MMAP | PREFETCH },
> > 		{ "mmap-remap", MMAP | MREMAP },
> > 		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP
> >},
> > 		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> >@@ -1626,6 +1730,7 @@ igt_main
> > 			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
> > 		{ "mmap-huge", MMAP | HUGE_PAGE },
> > 		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> >+		{ "mmap-prefetch-shared", MMAP | LOCK | MMAP_SHARED |
> >PREFETCH },
> > 		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED |
> >MREMAP },
> > 		{ "mmap-shared-remap-dontunmap", MMAP | LOCK |
> >MMAP_SHARED |
> > 			MREMAP | DONTUNMAP },
> >@@ -1640,6 +1745,7 @@ igt_main
> > 		{ "free", NEW | FREE },
> > 		{ "free-race", NEW | FREE | RACE },
> > 		{ "new", NEW },
> >+		{ "new-prefetch", NEW | PREFETCH },
> > 		{ "new-race", NEW | RACE },
> > 		{ "new-bo-map", NEW | BO_MAP },
> > 		{ "new-busy", NEW | BUSY },
> >@@ -1801,6 +1907,11 @@ igt_main
> > 			processes(fd, 16, 128, SZ_2M, 0, s->flags);
> > 	}
> >
> >+	igt_subtest_f("prefetch-benchmark")
> >+		xe_for_each_engine(fd, hwe)
> >+			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> >+				  NULL, PREFETCH | PREFETCH_BENCHMARK);
> >+
> > 	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
> > 		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> >
> >--
> >2.34.1
> 
