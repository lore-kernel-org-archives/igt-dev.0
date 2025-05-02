Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F26C3ABAA
	for <igt-dev@archiver.kernel.org>; Fri,  2 May 2025 22:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC57C10E09D;
	Fri,  2 May 2025 22:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQi9ieJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1188810E09D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 May 2025 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746223712; x=1777759712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kz0h7XfoFSxSEFzM60RXYreLwsjYV9V+M1OWM3r/6Ds=;
 b=DQi9ieJ4sdFoNQLCNNxkfDHCTlpSP0IOrRoQWHwu3KGQBA+Cc4Smuvus
 Zjms15jNthMoGANfsQ/HAMYyiED4uqPh8UG05iFbjLb4+lYiR0vtBhExj
 /l+gUZm/EtapzIaYIfctaVV/hwKQtdXJx9hR2Wjz8tHwK3r8zN8tw4KyC
 +DkOpiaUCmPz3A0XgkcFam0nkJ58mUPJJSRja1STguhiuIWu1AbYz6dXc
 xsilbFfGGSOWq56St9fyeJid+S/oHL2wTxmL0y3Xi0y9WkNubg5Y/33Gu
 rL+4y0zD6vcegPYw29rR+yu/BAgenGFuGRM9rKUXtVMG/md2fk3utbvOn Q==;
X-CSE-ConnectionGUID: LgsGMDlsSE+Z/b6OIQviyg==
X-CSE-MsgGUID: ej8wug8oTTW8cEVfa+R2nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48052377"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="48052377"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:08:31 -0700
X-CSE-ConnectionGUID: uhYDtqkgSqiofPhudhL6eA==
X-CSE-MsgGUID: RT1yqU6rTYedayg5vddr2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="134711427"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:08:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 15:08:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 15:08:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 15:08:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3fTJw6qAzOgbHJ8BNWTZlEbdOHwd1xzDzbOoM2AJ0QX9GDs0i6xneC49muH423dxT3UhdCnbXA517bfWW0TGN5PQxmW4qBhjPDf8VvyhVnuWP/eFuICsCkeP83NPHVxiKMmmti5su6XrznfrZm3e7WEQv7LDqwbJYLHDWMN4SlVA2aZYLLcM0Upob5MjGrbnOsCFG0AzEqqdn9+mFr0iMWs+nRnJD8ZttiFVfkTiPSVcBHMINYH0H2S76JPC3qSPBVg8cjl42GAp6g/OIpcB8HtlqnUvyB3ZF0SlgCdfc7BP+2ObdRWHbkTnjrMD+whUcKngVU3tEkCmI3aFEouIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyXyxl+BLrOrCN8x1cG/GSUM10uuZCvEFlFCVlXhx2o=;
 b=M2FnTu5EpgxE0jL9acFYDP7okWA6ESOySV/sdc5lKnt5n3rdogtJOy2/2wqt1wuFJTHzMDTegaxoWLK6xJt/EPk78HwInO/JQ+lqFixni2eRuRCdKZwLsOlheAIXTZ9/kbcqRImRkEQURBY+OTLYKdn0EnQLFzxfLH3N976VuS52+wsWdrQ1bjxZAtLNvT7pMDclxgpBxaF1cIoJxXzJ1PS9cHW1eBgmf/JeUYQT0Vpz7+KdeygnRqA/dp3r02cY+pRSiHrxIGytB1wRg9k434t1Zdmka5T3F2P78AoQr/d3GQd5sg3PtDaQMoz2uq1P081gt37Lb4yYr3BL+iebCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 22:08:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 22:08:27 +0000
Date: Fri, 2 May 2025 15:08:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/6] tests/intel/xe_oa: Drop pec_sanity_check_one
Message-ID: <aBVCWUceBIjPFhVR@unerlige-desk.amr.corp.intel.com>
References: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
 <20250422193458.1467567-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250422193458.1467567-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f512514-2df3-455b-426c-08dd89c5dd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXdiWTlLOEVHZFlHSEdJelBWWEdMTytSMTRkSkt3TE80Z3U1SmNmUDRPQ2lN?=
 =?utf-8?B?YjZhYWdhRVVnVW81UDNTQmJsYXBmLzl3NHJOeU1PRFJTRC82UGcyYUZ2SlBq?=
 =?utf-8?B?ZGFXS01MenJBQU5aOG96MndFeUFkVTRwd3NDN09EVG1ZQ1BBUEtha3lPME5j?=
 =?utf-8?B?ZFdlZy9ZbFR2Tk9oeEhlbDRhNXVzV1RLOGtnSC9sKzhQSnorQ003azdHV2NT?=
 =?utf-8?B?VGMyZUdtcUcvRXZpb0kxa0gxejdRK2JrYVNrU3lmamtVTVhJR0NtaVZxVzhU?=
 =?utf-8?B?dWpsSGZ2OG9obHo0MjZteUxwb3FkbDM0QVUxMG5MSk9PU3ZTb0doUkxhaHpX?=
 =?utf-8?B?Qm1xVmNmSkEzWnRDN0dySmVQUmx0U0dQQlZNVnFKL1pBODNqcmlBMEgxYVA3?=
 =?utf-8?B?VDkyUVVyTEkzZlRNMk1OM3pZVEh0OXpCTTRCUDFWQXk2NkMwTmtScDBNRzBt?=
 =?utf-8?B?VXZBZ1ZwZjNDQ3hVTzU1anpZL2UyRmJvS0dMVWk4VU91ekdhUTZ2a0tFVFRO?=
 =?utf-8?B?SUFTR0JlV1FjQW9kT0ZaOGhhcE0xNWQwQ1JQeDgwdVg4V1l1VEx6ZjJGNCta?=
 =?utf-8?B?NDdYald2QmNCS1ZsKzdtdTlwTnNnZ09rZ1pxRWV1Q0dIWW5ac0QwY2dUV3NW?=
 =?utf-8?B?Qzh3eXdGOTQ3cnJCQ2VDNUJaSTkxYlRuY1FxdkpRQXNDMU9KdHNFTTlQSGRT?=
 =?utf-8?B?UEhCcUJZZk01QkE3ZE5pZEhNSGNsbjlQSVNuYlNWT0ZIalN5Rkx5MmtEaThS?=
 =?utf-8?B?cXFia0IwWHkzcUdOczV4UCt4L2RQQWNuR1A4TFBUMHJiZDdPUWs1MWxyNDhu?=
 =?utf-8?B?eUFrQVFKdTgvUG5yZ2JSOFhMQ3RQa2M0bjFNNXlzSFhuQjBEMnU4bmcra2JI?=
 =?utf-8?B?S29FbTZvODRUWnFBenJnZXJaL3VuazJQejQ0M0V0ZEtjR016ZG9WNnZ3ZTdn?=
 =?utf-8?B?dDdMODZ2bnBiWGxaZjAxdWRxNGNidSs3c2lkSEdFQXZUM3NNWm03eUJhbFpS?=
 =?utf-8?B?M0h1Wkd4SFJGWWJSNE5mL1JObzFYbkZzNDJoUnRYc1dKMTFac2ptVEdVdGsz?=
 =?utf-8?B?NWZGaVphVjZleUc3aEN3YStlUGxRS3dERTJoVVFwQmFMeEYzVTF0T1ZmcUFK?=
 =?utf-8?B?VkhqUUthTmdzYnBVWWpVV2E5VERkMWFpUFBqbUQrWVZUWjM2SGRjbFJpdDIv?=
 =?utf-8?B?K1lQYzdDeWwreWE4aTZma01UcnlZWUpJSTRoQnFvTUtHKzVHUjd5V0tpL2Uy?=
 =?utf-8?B?Y0RVNUdzNkxPSzZCM0xkNXBTdUxyQnZyN0wzYWpSWUQ3c0M2eVh2NTArM3Ji?=
 =?utf-8?B?U3RRQkJBL1k5Tmp2WWdEWlJyZHdWRXM3T05yN0ZzTDZQSWxYYzVnY0JKZUR5?=
 =?utf-8?B?RGpNS3Z2eG8vNFVsVGJxWENzdDVmaGM4bXFZcHN3dmpNZkt6aWYvTUlVQm95?=
 =?utf-8?B?T29oNXdiU1R4c3AwOURyOVNGTlJ1UTNDWkFzWURFZ0JVR1krVGdNRUlka0VO?=
 =?utf-8?B?SzFyM2ZOMFJ2NGxKa2xKLzBLOS8yeDdNWjFRblc3cTVhU2VKWGM4TzZZcC8y?=
 =?utf-8?B?dEtLaXEwTUJpTkl5UFRPdDJvbm5GSTI0QlhKQ1ZrVXE2SVJqcm5Sc3NRdXR4?=
 =?utf-8?B?RlBrQko4NlE2R1BxY2s4aDNtd040bm9hWkV0aHNWWWVHRzRiRnFEakxjaUJq?=
 =?utf-8?B?NXRqRWE1aGVUU1hwNXZPVUJYRUN2Y1dlTWdsZWpzdlljYklYMmswSFRvb0pG?=
 =?utf-8?B?YWtVdFd2NHJoM2dLQ1Jub3k0RXZlY05VSjI3d21NYjRIUnQ5ZUZndExrM050?=
 =?utf-8?B?K3pJOUNpL3FQcGM0SW14TDYxNzE3dnBEVU5mWFY5Q3JGV0picmVKSFZpUFNR?=
 =?utf-8?B?MUFYUDIwMVlKZjJKNzEreHA2aDZmS2h4UUk3K3EzK1VTNzBMZnlvU1VZblZX?=
 =?utf-8?Q?euC/Rp9YxEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVpkNGdTMmpUMytwRDFINnJEV1grbzVRbFdhd0xPZFZrVHpaN284RlFkTEw2?=
 =?utf-8?B?a0lyWGwzZFJMZVpwVnlTdkF6UjlRbGs1bjROQmVOMHNvMWtjLzFZYlBhSkdM?=
 =?utf-8?B?ZDNFNmtNYUdRUFJ4M3pZMVNhaGlwcW92TUV1NVdhMUlKZXFMYStnZFV5cm80?=
 =?utf-8?B?MklXY1F4Mm9ucjVJWXVHVGs5YWhnckhRazhEK1Y0dHlIOHpCMVhBTWFaR2U3?=
 =?utf-8?B?OFR6ZXcxS21NcUNXSWhjNXZJRnBLazhmL2h1bXh2MFFwM1BEVlN3RnNHT0hF?=
 =?utf-8?B?cElIU0E1Q3d3eGJWS0dYTXBIMGRWRzZvVklzM1dGem5hQk5jWkxmR0pIYnB1?=
 =?utf-8?B?KzUrKytxcENCNnBQMktMTXpsWkhxdFhrRytuS1c1dVJyVk5yUWdSZTdoRlJo?=
 =?utf-8?B?NUlMVHlHSDYzSkJGRlNOMFlKdW9HNnh0Uks3eDE0TXl6TDRzSVZhYi9ZMTJU?=
 =?utf-8?B?OWV1M1ZNcDlCemZka2JycjRpZFNGU202ZVVuTWd3UGFsdkFGVk5WSFd4Mmsw?=
 =?utf-8?B?NmdOQkRpR0lsQnhKeGRzU2RVQkxpTkpTL0RPZlJNU2dPWm8wemlMMTNYM1Q3?=
 =?utf-8?B?YXQ0NWxHc0lVNmZMLzRwek96TDJnVHhEZzgzRU5vWmFWQXZWMWI0Y1JJVlRT?=
 =?utf-8?B?NmNWdHI4aEw5YTcvbGVwY2thZDBTMEtPTkZvWXdGUVU3NkJiSXVZUnBVaDE1?=
 =?utf-8?B?Q1JycHJjbDl5c21NYmoxS2t5V1V1eGQ3Z09HNzNFaDJjSlRZTXZEN1Bva1I4?=
 =?utf-8?B?TFVabTQ0Y0gyZFhnRTNSWDFFamZhVjFOK0hwSlVpYWNYczRqM2t5aFB4OTdx?=
 =?utf-8?B?NWt0dWJqV0hRSVhpY2Z0NlZ5L0sxUEovK3k4UlN3K0NJL0FLb0RrY0VtNnA5?=
 =?utf-8?B?VURnTk84MTlRZ3phWlNpYytHZ1V4SktqWDFlcEIwS3V1MnJaaHBYUGQvd1Vn?=
 =?utf-8?B?Z003VDJWU2JBTm8zL2VSSHM2RjVoTHVrQXhKRXJXN2lhSEJOL1NYRStWTTdt?=
 =?utf-8?B?WVdjUUxxaHdKaTdRZlBxcit2NFhNWHMvY3AxeWgwTDNyQTJ1VmV1NnV4MXpT?=
 =?utf-8?B?UnlvN1BCSkVCd3hlbEszR3FUVEh0a0hGcVlZSlNlYUo0TklIRjJwUFdsdUpF?=
 =?utf-8?B?cm1wMFpRNWVyYjBJdm9FS211a0VBalhrRXMwcDB6ZnRKMk9Jb3VZUFZ3TlIy?=
 =?utf-8?B?S2s5aVZZS2dnWHYwZW53bU5PK1RYRm9SNVE5YXBFNTFnNUtIYzExS2tlemhE?=
 =?utf-8?B?N1NHUVZNR0VWa3Y2ZVR2Nk42c1dUY0FMMWJZS1RxeE9JSGdHRDdKcjV4Y25S?=
 =?utf-8?B?OHhQTThGcUpmb0JuT3c3WjZKY0F5S0RwNVhta2RNNWVIN1RHeUw2VXVqMmpJ?=
 =?utf-8?B?VUVNWUJqQzBXTlRXanJHUzU4RjFNNERlV1c1Z3E1QTdOWFEreGxubURyWkll?=
 =?utf-8?B?eHdmbjBMTng0UTVnam94VzNlbi9nMXBXRWlpUXhVV1h5eFdRMWNmV1VNTHBr?=
 =?utf-8?B?WGFsTXRiQ2txdXVyVTdqREdVc1JoM1gxOVBWVlRyMVFUdlFObE5XT1lHSlVJ?=
 =?utf-8?B?ZFVKeUdYVjBqMHhmWHI0dkpLT2FHaW5KcjFSRUVvVFd2SEtOZklrcUpDeU9G?=
 =?utf-8?B?SFJPcWF6YzB5UHpMdzFEYjQ0VUlOV2FybnMxNWJYeHFWdTVaU1VFT0hnTUxm?=
 =?utf-8?B?OHVzWFVzZnY3S0MweXlZUnVLNTBsYUhLUitwa1k3c3UzcFNxLzFSMWhKV0FY?=
 =?utf-8?B?U29mbGVuRVR5Z3NWUktvUkNlRFFwMkhJUTl0YVVmWjF6RTBGRGhmNUNRWkdK?=
 =?utf-8?B?VXM2TVdoZXA3d293QTdpaFF1QnRtbDFrVE9uQ0QxMXdLZFZscUdveERKWnlX?=
 =?utf-8?B?RVBOd04wc1N0S1poKys2OXpYOFhveXc3alZEaXRWaFZ6NGljV3hETDI3WCtl?=
 =?utf-8?B?YlpFQ3Z6ejRoWWgyeEtIUzBRaXlxd0UySGROMFUxZXZ1SiszTmtpUUlEUVdk?=
 =?utf-8?B?MjFkWGRtdDR2emJuaUdaYk9YaFdLNVNUcTJGSkliV0dQcmlZTTJ1V2JwUmto?=
 =?utf-8?B?MTgxUmVOclo5MWNTVXF5bTVRR1RJODVwU28vM3NibTNJdS85UDU3VlhLL1Bz?=
 =?utf-8?B?R2ZpNmVpOHJRK1JPdHhTUWg3RDJVdXJTa1lDMFp3ZzhFOG10MUxKdTVkWWhi?=
 =?utf-8?Q?5rkVX4xKHdJ5PzLZe1ybePA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f512514-2df3-455b-426c-08dd89c5dd41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 22:08:27.2065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep5PWep6CoO4pRz3UGr2QndnCR9YQfiMxfxdiKNjbzYoulvLTkBBMKED8XF0owkjqdfN0qf/a7UsuRAaqgpJ/CyRhi0PaAO5g6uQtYMkAd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

On Tue, Apr 22, 2025 at 12:34:58PM -0700, Ashutosh Dixit wrote:
>We only care about delta between two reports, so pec_sanity_check_one() is
>not needed, only retain pec_sanity_check_two.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 40 +++-------------------------------------
> 1 file changed, 3 insertions(+), 37 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index c01adbad34..5324595995 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -994,40 +994,8 @@ accumulator_print(struct accumulator *accumulator, const char *title)
>  * These equations are not exact due to fluctuations, but are precise when
>  * averaged over long periods.
>  */
>-static void pec_sanity_check_one(const u32 *report)
>-{
>-	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>-	u64 first, *pec = (u64 *)(report + 8);
>-
>-	igt_debug("\ttest_event1_cycles: %#lx\n", pec[2]);
>-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++)
>-		igt_debug("\ttest_event1_cycles_xecore %d: %#lx\n", i, pec[xecore_idx[i]]);
>-
>-	/* Compare against the first non-zero test_event1_cycles_xecore* */
>-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>-		first = pec[xecore_idx[i]];
>-		if (first)
>-			break;
>-	}
>-
>-	/* test_event1_cycles_xecore* should be within an epsilon of each other */
>-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>-		int n = xecore_idx[i];
>-
>-		igt_debug("n %d: pec[n] %#lx, first %#lx\n", n, pec[n], first);
>-		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>-		if (pec[n])
>-			assert_within_epsilon(pec[n], first, 0.1);
>-	}
>-
>-	igt_debug("first * num_xecores: %#lx, pec[2] %#lx\n",
>-		  first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2]);
>-	/* test_event1_cycles should be close to (test_event1_cycles_xecore* * num_xecores) */
>-	assert_within_epsilon(first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2], 0.1);
>-}
>-
>-static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
>-				 struct intel_xe_perf_metric_set *set)
>+static void pec_sanity_check(const u32 *report0, const u32 *report1,
>+			     struct intel_xe_perf_metric_set *set)
> {
> 	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
> 	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>@@ -1087,9 +1055,7 @@ static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
> 	dump_report(report0, set->perf_raw_size, "pec_report0");
> 	dump_report(report1, set->perf_raw_size, "pec_report1");
>
>-	pec_sanity_check_one(report0);
>-	pec_sanity_check_one(report1);
>-	pec_sanity_check_two(report0, report1, set);
>+	pec_sanity_check(report0, report1, set);
> }
>
> /* The TestOa metric set is designed so */
>-- 
>2.48.1
>
