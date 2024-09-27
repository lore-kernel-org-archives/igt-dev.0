Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15886CDD1CD
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 18:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C364410E0F6;
	Fri, 27 Sep 2024 18:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTDKnQ6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4838210E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727460260; x=1758996260;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=QA2PA6N5BwPycJxYPlSewQkCMoh3FQADJboXDMpFiHY=;
 b=ZTDKnQ6TTBm1yflFUNL1xFxtIVc/gBfsHdIJBpsKWyggjTINEL2xRsXA
 TJfHSQ5M0fKEwuW6uy9lKDFu+qHmPsKtIo98POvl/W5euXU5C598kvdQz
 2gfxJjRK9gN91BQV4CEBG2O7zGlQgFF5AOYPMYSt+AZ53YOh7eQNYGKJJ
 Rl4yKgCIQ0VtlFT2DDJx68+F6kdEraWmVxy25tgUB5olAfr77hEGeaKlV
 vk09qjpT6S8ftL0TXMbPkm+E/GxUzlZvMninNVNknXNU+aN2DQkSZqz7f
 9OKrU/pAcnZGIuBIgalozsiJeIA3ag4N7fmTJn8r7Ottudb38/2/9RJEd A==;
X-CSE-ConnectionGUID: V+mAP4XXQtGaBYSpuqTHkw==
X-CSE-MsgGUID: Dw05mO6uR3qELDNKaC2RIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52028825"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208,217";a="52028825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:04:18 -0700
X-CSE-ConnectionGUID: G/UYy9QUSJiyRkaNcSP8cA==
X-CSE-MsgGUID: gUJWNDrCTR22sKHCJOi3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
 d="scan'208,217";a="110099951"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 11:04:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:04:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 11:04:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 11:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Avwd6g0GMsRL3DwUYLFotPQy/ALxhJ5qbZOXcovZM5jP3n6VsF2m3uJgOJPr5ceMo2r9Ri3i5fZPeF7cFqfwW4WfWWEdQyQ93RcIQIc6UZUH2REPtEvcL9PYUjUG3GnQq9mnX/8NsiC8Yhu/BmZkuCyTkBmbB1fPjXOrzRH8or9HUt4SRY6TAkDU/B6gYu6nG4D0oFWy4F63uCrhioawK9bFUbGBQDM5QowiAfMaRVGOdwq1X94vEWriOXwTDJdywb3JD/02Zp2OtZq2JFCB/femQJHAEUZFGCP8D8MPVpC3cJifJYAGhmprr8YD0XrWzpF2MeDsi5nMJC4sgUB2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBpjA6Uyn7CrnysWBJllB53XpjF/K+YBfUV0gX7LjVo=;
 b=ixs+5Y2PlSFZSI/ANwx486PgGKva33tyhfdtDU545iJoYxjePdVmaMrWcp3YdS7YQIzCTQ0+ZWiiZLE4SHGrD83FEiXPnendGicnvVTg7hk3S9afw7kblhX2W8OfbZUwW7oI+e0IWM67wqAc6TVgVXhUzh+FT6TjcdNQz8amwUCDYRhFoUX8cs/xquhVhghtsocpmEViJLm/ybKarmZSua3NDqFy5sC3Lcp15WR9+zlJhNqz+9Ph9VI1Yx3sDdNTf+60wRJDD7ghOr5nvboOp0MjFbTUiXXHdFpZaX0lDVeBTAhxQJ58piuLVFXQSgywQoyAZYbd+FwvCm7V4Tf+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 18:04:08 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 18:04:08 +0000
Content-Type: multipart/alternative;
 boundary="------------yABYiYFoQfUTzg2l0WCBKCnx"
Message-ID: <fc6851c9-84c4-4e74-80e8-897949e2034e@intel.com>
Date: Fri, 27 Sep 2024 11:04:06 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL3hlX2d0?=
 =?UTF-8?Q?=5Ffreq=3A_Use_sync_reset?=
To: <igt-dev@lists.freedesktop.org>
References: <20240925220923.2030384-1-vinay.belgaumkar@intel.com>
 <172735461687.1106898.12762976372599254301@2413ebb6fbb6>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <172735461687.1106898.12762976372599254301@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c9c799-4239-44e2-f64e-08dcdf1ec7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlphdVF3amxaN1pjOWs5RnVuVk9RWmVlKzZmbk8zZm4yUlZJQ3pxazBPQXU0?=
 =?utf-8?B?b2Z3TElpOEZyRTNYS3kwK0FvMmpCdnV2MytnMjZHMjd6VDdvL1ptSUhucmxy?=
 =?utf-8?B?ZWxvRENlek9kV1pjaE1rN1J1Vlh1VEhaR01GU3FsOXZwS1ZEdlA1OFU5UTUw?=
 =?utf-8?B?MFNyaERJSHVaR3IyU3FycTg0MGVoRytHTTVjNWxyMWFjeTRtbEU2YWNJWnpF?=
 =?utf-8?B?eWxYZlpZUis5bVZ4Z05lNEdBL0paQzVuTllQZUJxWXlEVzBlTDNIL3ZveHRH?=
 =?utf-8?B?eUROYnhNUXJjbldpeUl1L2lFcWg5RlBrYTdJMzA2ZnpXaFdDc2pXUVF3VnR5?=
 =?utf-8?B?dFN3UkMrMGdMak1jM1J0ZVFHYXVydUZhTHUrRXV5QXNwaVcyTXBNNmdhZ2hI?=
 =?utf-8?B?UVRqUEd0ZmtxMlpLbmQ0eGMwSzB3aUNRbGFqTExWM0NxOFBqK1FtUzZWbGJI?=
 =?utf-8?B?WVVqTTk0TjBvTzVFTnZ3cnJldGNCbHJ3NkUzY2tYVTFiRXhmZlBEVzhUV3pn?=
 =?utf-8?B?Z2NNWUdMSnluV2NmUmdPNlhoVnpaWDl0ZElzMDBQYWo3c3ljTkdrMjAxYjJ1?=
 =?utf-8?B?UnhLU1hmYmpJV255QkY5WEh5SnJBZWNHSlVhNDViWHAwbGJPbldnY3RVSjcx?=
 =?utf-8?B?SkhscC83ZzlEUkZYaHFCcEJBdVIwZE14K3RUdFNieklxRlhYTUF6VFZ5TEg3?=
 =?utf-8?B?bGJLV0xtK1pSV1dlVHRKQldHZXR6YVczd1I2dXA4TnFLMzRXZmxNQzVHZ3Nz?=
 =?utf-8?B?V0hBYS83cFpTVGpTVXIxcWdzdS9heXdOUW1aQ21sRDFDQzYvQnFkY0FCL0Zs?=
 =?utf-8?B?Y2F0YTI2TkJERW5ocTA3ZkhGUW1IZFRPSmJKeVRGY1ZHczVDVmFDZFJBZUFZ?=
 =?utf-8?B?N1g0ZWdOWkNMZjBZazJXTzY4Z1VGeDNsT3lxZGJBMXEzeDBybGJ3QU13UFhm?=
 =?utf-8?B?TkVvVGFVY0krUS92c2piQ2pDVStHeitaVjJPMHRpUEtqWFBQU2RHVS9tM0pz?=
 =?utf-8?B?UW1DRjc2MlBsNzFNR25hZmQra2hNcnluYXlWb05hOXlaZWljZDRYLzBKU1pF?=
 =?utf-8?B?bWxua0JQcnpIako4NmZlYldjcTRwVEtRY04zeFVHQXNLRTJXT21wY1hWQ3dX?=
 =?utf-8?B?cTc4M3grdWxXMW5BNVpHTW9EWFRKMEUybkMxdXp0Sm1BZFZ2RGlwVXROTlho?=
 =?utf-8?B?SmltbE5LMnBiN2J1cnBLNW1mT1lOalkzZkFvQjJFRUN0ZFFidk9QanRET2o2?=
 =?utf-8?B?REE4cTh2YytnVGk1em5uWVh3NWJjeS9LVHA0VDBNTFRxT3NOME1GZ2YvUW5K?=
 =?utf-8?B?U2l0dHdDbFNJcEpSY0ZoUG9XYXA1WWRpZjRnS1o4TWowWlY4SEwzekdUeEJP?=
 =?utf-8?B?dUJ1RU1zdDhuamFmUTN2MUZVYitOTGZTS0Zxb1F1RUNvd3lNQ0RtYm52TSs0?=
 =?utf-8?B?MHduSC9ibkFaLzZieGZ0QmNrYlp3THNlMkd0Mkw4M3MyWmRTM2FuL1lINEMx?=
 =?utf-8?B?ajB6eCtNZ2EwUENDQzdWamc3VGIxd0h2aUxkQ3RVY0NJKzdrVVhGdjN5aDhT?=
 =?utf-8?B?TkZDa1I4bk1iSEE0L2QwTWo0UnA5cEpmb0kvQWxGS1RRQXg4ekFkVmMvL0xN?=
 =?utf-8?B?MkhqRnhPMWdDcUhWRk5LemhhRWJzbW12RUVuRUltaDhYUGJBOEFsc2h5WGFW?=
 =?utf-8?B?NStuemRidFJ1TGhZTVpiY0s0WUl3dnpEN0xyYi9UZUlzUnU4YUc1NnZacTdW?=
 =?utf-8?Q?Yu+VqvKhBu1/P79tqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGpTbWJQaEg5Tnp6cTB6TVB3NEoxdnp1TUdNNHlRalR6VGdPd25BUjRnMlhX?=
 =?utf-8?B?QXFTejN3cWxubGxsWlh2dWRUQ09FS3dvc0pObGNaSXV0ekx3THFSN1p3emFw?=
 =?utf-8?B?TkZWN1VuVUV1UkJYcEk5NzhzcjFnKzMzTFBwR3kvTmF4a3ltaDAzSCtDRnVD?=
 =?utf-8?B?SWlObDM5NHFEYTh1cjRTQk9pajhpMGZSMkdlazNjSlQzbU9tdzRSK3dmQVUw?=
 =?utf-8?B?RGJESmt6RnhZSmUreVZKS0ZFSnpIejJFT2E3ZFBWSVNmeDdHYkJZU240L2w2?=
 =?utf-8?B?eUJOZSs4N3NZSHlDcVZtdDdFM0tEMlByRHJub1gyc0xDRFd0TFFNVUpvQjlZ?=
 =?utf-8?B?bDRJVnhXZXlWU2tJWnNHNnVTN014Sm1HeGt0dy8zMmRsZGI3ckdmSGltaHl6?=
 =?utf-8?B?bkZxanM3V1prSzBPb0lEWWE5M2kyKzkvRitiSUpMUmpTbEJyRVAzUFVqdGt4?=
 =?utf-8?B?TU5yK1c3dnVwN0lscHJodmNGRFZpb1M5dGpLQzF1ZGlHRlp4RDU2Z0M2S1Mz?=
 =?utf-8?B?MHVpOEpJMVg4cC9FdStFOVJtbTkrcFI2MlVobXVBblVDOUl0OUsxMWU4TUlj?=
 =?utf-8?B?bWVMenlxTVdIM0o3YVlGVnA2YmhoM1pxMFYxUHNBcUtmREhWM2todUw2Y1dz?=
 =?utf-8?B?QTAzWUxpbGZ1TVp4TTJrKy9ycHhZMXErNzRwVitIT0ExS1F3N3FpMXpmSkJx?=
 =?utf-8?B?WGNxQ0MvNGZaeWhQWFlNbmZkWWJJTEQxZU04Y2Y1Zm5qM2NrbnAzelFIYUpP?=
 =?utf-8?B?YkJiK2JhMHl5R3hIOVFiNlpIWXpHYVo5NzhUSk5jdXQvV3M2UWhmTC9Ncm5N?=
 =?utf-8?B?SG5iZEV6aWNDQ3paRTNhcUFveVBwblRyZkVycnROaE5OUFl6UVZXNDFhN1Vu?=
 =?utf-8?B?YTFSRFB6MkFCSEV1eUVUNURxYlRvUysxaTRNLzh2a3QxVkxFUDE2YjgrdHYx?=
 =?utf-8?B?QmhINmlTZnkwODFhRDlvRk9sbm9LTnBsTG5QSWovbVdSRWxrdzZPZDNZZVBK?=
 =?utf-8?B?VEp6bHdrMHAyWkE4ZHdLcUJ6czNmWGNWb3lzKzhYZnQ5NjExZkNEbTFZZjlq?=
 =?utf-8?B?Z0liaW5uQTh1Wm5DVDhEQ01CbDVaRW91bFFUUlBQUFVkK2hWY2M4YVZGRUYv?=
 =?utf-8?B?UjBTSFRFTCtGVFlpa0ovNUI2WjZCSUNNT2FnTlZteGhtKzlITmVuVTI2eXJG?=
 =?utf-8?B?YXJBelcvU2VCeEYzbFRZK2VsWXFIZ3B1bWJoVnF1R2VYSGdPNDhJeXVqMm1s?=
 =?utf-8?B?N3NOVzhPMytaOTZNa09IbnhrdmRZTlFmaWo4ZE4yR0VyN1FndWJiSFRVb2ZG?=
 =?utf-8?B?VzBJU3RrRHlaV00yOEcrL0tYQjF0YmpoZ1BOTVUweTNFMDhpeTFtOVV2Z21n?=
 =?utf-8?B?L3pYRDFhb1plL29zQUpQQTZ4MnBSN0pjSWU5dVNLUTZHRXRFbnFOdWYwdG5a?=
 =?utf-8?B?elBCQ01nejYrUUlRcGJHVnJmYm01WTFrRTg2TEFGa1piSnBUUDBScEJpWnF6?=
 =?utf-8?B?TyttRXRaVEdlOG5UUDFpNUNQSnFsR1NQMmYzVDJnWnFXT3kvVXd0cHhGM2RN?=
 =?utf-8?B?QmI2VmlIZGhpQ0JBd2tBSFJYZGN3dTREdjh2RDd1MTc0M2tjd1NhS3JaL3hY?=
 =?utf-8?B?Z1cyVkx2Y3R6cUlnL0JxSnJuMkNUQnJLU3cyZ1psUW11M01JT0crbXNPQXg0?=
 =?utf-8?B?bmFTSk9OdHgzV0JiV08rKzVTdFVrYUdLS0dYOW1ObTI4TlBGSzErY3Mxc3Fh?=
 =?utf-8?B?TlI4YTc2UHRtQlBhY0tuQTI2SFZkSm5wYTBHZUlCWW04NUt3VkpENUFlRE8v?=
 =?utf-8?B?ZnVScmxmM0I2NExkVkl2bWJJeFc5WFhlaktvVlQrTmovWVVBbWtRSDIzc2dv?=
 =?utf-8?B?ZUY0SEVmLzFJbW9aQjdRcFViaHhVeWJDL0tWeUpMYlZCc1VEWE1uL09yb2tO?=
 =?utf-8?B?SlY5UnMycm1ramRSSjVDYjFiUThiK3p6eFRjbXA3UlFxT2dqYUtZQ2g0QWEx?=
 =?utf-8?B?TlByRkxFZlhUa2VSb0RRVTU1STc3Ym56WmhoTTBuUU1wQVJDZnExeTFvZXFT?=
 =?utf-8?B?c3NrODhWRUVGOXUzOFNoQ2Zpc2JwcW1JRmpsUUZiTXBWYnlnQUdmRXh6S1dw?=
 =?utf-8?B?enFJTkswUENSS202ZUdYNVlWcjBQOXdtRDRGYmhRWThNWlV6cmw1eXA4aVpL?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c9c799-4239-44e2-f64e-08dcdf1ec7dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:04:07.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIgc8gcYoIqaa49OputcdvAyNXcqauf945teLjBc/qZU8EkDu+am+xBzJ2NDSCef+LpmaBb/Lar9Co+NO5yr8P+hrbll4S28Mq85WQx4b1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

--------------yABYiYFoQfUTzg2l0WCBKCnx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/26/2024 5:43 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_gt_freq: Use sync reset
> *URL:* 	https://patchwork.freedesktop.org/series/139120/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15446_full -> IGTPW_11806_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11806_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11806_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/index.html
>
>
>     Participating hosts (8 -> 8)
>
> Additional (1): shard-glk-0
> Missing (1): shard-glk
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_11806_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@gem_busy@close-race:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@gem_busy@close-race.html>
>  *
>
>     igt@gem_exec_schedule@preemptive-hang@bcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@bcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@gem_exec_schedule@preemptive-hang@bcs0.html>
>         +1 other test incomplete
>  *
>
>     igt@gem_softpin@noreloc-s3:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb4/igt@gem_softpin@noreloc-s3.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb5/igt@gem_softpin@noreloc-s3.html>
>  *
>
>     igt@i915_suspend@basic-s2idle-without-i915:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html>
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         +24 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x128:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x128.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x128.html>
>         +10 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html>
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         +19 other tests skip
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_plane@pixel-format-source-clamping.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html>
>         +1 other test abort
>  *
>
>     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html>
>         +24 other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         +4 other tests skip
>
None of these failures are related to this change.

Thanks,

Vinay.

>  *
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         ([i915#5286]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html>
>         ([i915#6095]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html>
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_content_protection@dp-mst-type-0.html>
>         ([i915#3116] / [i915#3299]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_content_protection@dp-mst-type-0.html>
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-5/igt@kms_cursor_crc@cursor-random-max-size.html>
>         ([i915#3555]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_crc@cursor-random-max-size.html>
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         ([i915#11453]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         ([i915#4103]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         ([i915#5354]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         +6 other tests skip
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         ([i915#9906]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o {shard-tglu-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         +60 other tests skip
>  *
>
>     igt@gem_exec_fair@basic-throttle:
>
>       o {shard-tglu-1}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-1/igt@gem_exec_fair@basic-throttle.html>
>         +1 other test fail
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11806_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         ([i915#8411])
>  *
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html>
>         ([i915#8411]) +1 other test skip
>  *
>
>     igt@drm_fdinfo@most-busy-check-all:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all.html>
>         ([i915#12179])
>  *
>
>     igt@drm_fdinfo@most-busy-check-all@rcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html>
>         ([i915#7742])
>  *
>
>     igt@drm_fdinfo@virtual-busy-hang:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@drm_fdinfo@virtual-busy-hang.html>
>         ([i915#8414])
>  *
>
>     igt@drm_fdinfo@virtual-busy-idle:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle.html>
>         ([i915#8414]) +14 other tests skip
>  *
>
>     igt@fbdev@nullptr:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@fbdev@nullptr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@fbdev@nullptr.html>
>         ([i915#2582])
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-9/igt@fbdev@nullptr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@fbdev@nullptr.html>
>         ([i915#2582])
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html>
>         ([i915#9323])
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html>
>         ([i915#6335])
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html>
>         ([i915#9846])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@gem_create@create-ext-cpu-access-big.html>
>         ([i915#6335])
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12027])
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12027])
>  *
>
>     igt@gem_ctx_freq@sysfs:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-8/igt@gem_ctx_freq@sysfs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@gem_ctx_freq@sysfs.html>
>         ([i915#9561]) +1 other test fail
>  *
>
>     igt@gem_ctx_persistence@heartbeat-many:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-many.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@hostile:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb2/igt@gem_ctx_persistence@hostile.html>
>         ([i915#1099])
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_ctx_persistence@hostile.html>
>         ([i915#11980])
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html>
>         ([i915#280])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html>
>         ([i915#280])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_ctx_sseu@invalid-sseu.html>
>         ([i915#280])
>  *
>
>     igt@gem_exec_balancer@bonded-semaphore:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@gem_exec_balancer@bonded-semaphore.html>
>         ([i915#4812]) +3 other tests skip
>  *
>
>     igt@gem_exec_balancer@parallel:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@gem_exec_balancer@parallel.html>
>         ([i915#4525]) +1 other test skip
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-tglu: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-2/igt@gem_exec_big@single.html>
>         ([i915#11713])
>  *
>
>     igt@gem_exec_capture@capture-invisible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@gem_exec_capture@capture-invisible.html>
>         ([i915#6334]) +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html>
>         ([i915#6334]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@gem_exec_capture@capture-invisible.html>
>         ([i915#6334]) +2 other tests skip
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html>
>         ([i915#6334]) +1 other test skip
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#3539] / [i915#4852]) +4 other tests skip
>  *
>
>     igt@gem_exec_fair@basic-none-rrul:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@gem_exec_fair@basic-none-rrul.html>
>         ([i915#3539] / [i915#4852]) +3 other tests skip
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@gem_exec_fair@basic-none-rrul.html>
>         ([i915#2842]) +1 other test fail
>  *
>
>     igt@gem_exec_fair@basic-pace-solo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_exec_fair@basic-pace-solo.html>
>         ([i915#3539]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@gem_exec_fair@basic-pace-solo.html>
>         ([i915#4473])
>  *
>
>     igt@gem_exec_fair@basic-pace@vcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-3/igt@gem_exec_fair@basic-pace@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_fair@basic-sync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_exec_fair@basic-sync.html>
>         ([i915#4473] / [i915#4771]) +4 other tests skip
>  *
>
>     igt@gem_exec_fair@basic-throttle:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@gem_exec_fair@basic-throttle.html>
>         ([i915#2842]) +3 other tests fail
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@gem_exec_fair@basic-throttle.html>
>         ([i915#3539]) +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-cpu-wc-active:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-active.html>
>         ([i915#3281]) +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read-active.html>
>         ([i915#3281]) +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-scanout:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html>
>         ([i915#3281]) +10 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-wc-gtt-noreloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html>
>         ([i915#3281]) +5 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         ([i915#4537] / [i915#4812])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         ([i915#4537] / [i915#4812]) +1 other test skip
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         ([i915#4860])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         ([i915#4860]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         ([i915#4860])
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html>
>         ([i915#4613]) +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@smem-oom:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html>
>         ([i915#4613]) +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_lmem_swapping@smem-oom.html>
>         ([i915#4613]) +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs.html>
>         ([i915#12193])
>  *
>
>     igt@gem_lmem_swapping@verify-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html>
>         ([i915#4565])
>  *
>
>     igt@gem_mmap@big-bo:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_mmap@big-bo.html>
>         ([i915#4083]) +2 other tests skip
>  *
>
>     igt@gem_mmap_gtt@bad-object:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@gem_mmap_gtt@bad-object.html>
>         ([i915#4077]) +4 other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-small-copy-odd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy-odd.html>
>         ([i915#4077]) +4 other tests skip
>  *
>
>     igt@gem_mmap_wc@bad-object:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083]) +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083]) +1 other test skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-snoop:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-snoop.html>
>         ([i915#3282]) +3 other tests skip
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#3282]) +4 other tests skip
>  *
>
>     igt@gem_pwrite@basic-random:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@gem_pwrite@basic-random.html>
>         ([i915#3282]) +2 other tests skip
>  *
>
>     igt@gem_pxp@create-regular-context-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@gem_pxp@create-regular-context-1.html>
>         ([i915#4270]) +3 other tests skip
>  *
>
>     igt@gem_pxp@display-protected-crc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@gem_pxp@display-protected-crc.html>
>         ([i915#4270]) +2 other tests skip
>  *
>
>     igt@gem_pxp@regular-baseline-src-copy-readible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         ([i915#4270]) +2 other tests skip
>  *
>
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         ([i915#4270]) +3 other tests skip
>  *
>
>     igt@gem_readwrite@read-bad-handle:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_readwrite@read-bad-handle.html>
>         ([i915#3282]) +5 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html>
>         ([i915#5190] / [i915#8428]) +2 other tests skip
>  *
>
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html>
>         ([i915#8428]) +4 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-12/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079]) +1 other test skip
>  *
>
>     igt@gem_softpin@evict-snoop:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gem_softpin@evict-snoop.html>
>         ([i915#4885])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@gem_softpin@evict-snoop.html>
>         ([i915#4885])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@gem_softpin@evict-snoop.html>
>         ([i915#4885])
>  *
>
>     igt@gem_tiled_pread_basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_tiled_pread_basic.html>
>         ([i915#4079]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@gem_tiled_pread_basic.html>
>         ([i915#4079]) +1 other test skip
>  *
>
>     igt@gem_tiling_max_stride:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@gem_tiling_max_stride.html>
>         ([i915#4077]) +4 other tests skip
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@gem_userptr_blits@coherency-unsync.html>
>         ([i915#3297])
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_userptr_blits@create-destroy-unsync.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@forbidden-operations:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@gem_userptr_blits@forbidden-operations.html>
>         ([i915#3282] / [i915#3297])
>  *
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@basic-rejected:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html>
>         ([i915#2527]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         +106 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         ([i915#2527] / [i915#2856]) +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         ([i915#2856])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         ([i915#2527])
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html>
>         ([i915#2856]) +2 other tests skip
>  *
>
>     igt@i915_module_load@load:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb6/igt@i915_module_load@load.html>
>         ([i915#6227])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@i915_module_load@load.html>
>         ([i915#6227])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@i915_module_load@load.html>
>         ([i915#6227])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@i915_module_load@load.html>
>         ([i915#6227])
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820])
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@i915_pm_freq_api@freq-basic-api.html>
>         ([i915#8399])
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html>
>         ([i915#6590]) +2 other tests skip
>  *
>
>     igt@i915_query@test-query-geometry-subslices:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html>
>         ([i915#5723])
>  *
>
>     igt@i915_selftest@mock:
>
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb7/igt@i915_selftest@mock.html>
>         ([i915#9311]) +1 other test dmesg-warn
>       o shard-tglu: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@i915_selftest@mock.html>
>         ([i915#9311]) +1 other test dmesg-warn
>       o shard-mtlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@i915_selftest@mock.html>
>         ([i915#9311]) +1 other test dmesg-warn
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@i915_selftest@mock.html>
>         ([i915#1982] / [i915#9311])
>  *
>
>     igt@i915_selftest@mock@memory_region:
>
>       o shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@i915_selftest@mock@memory_region.html>
>         ([i915#9311]) +1 other test dmesg-warn
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@i915_selftest@mock@memory_region.html>
>         ([i915#9311]) +1 other test dmesg-warn
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@i915_selftest@mock@memory_region.html>
>         ([i915#9311])
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@intel_hwmon@hwmon-read.html>
>         ([i915#7707])
>  *
>
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>
>         ([i915#4212])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>
>         ([i915#4212])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>
>         ([i915#4212])
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html>
>         ([i915#8709]) +11 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html>
>         ([i915#8709]) +3 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html>
>         ([i915#8709]) +7 other tests skip
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#3555])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html>
>         ([i915#5956]) +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         +15 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         ([i915#5138])
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         ([i915#5286]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         ([i915#5286]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         ([i915#4538] / [i915#5286]) +5 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         ([i915#3638]) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         ([i915#3638]) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         ([i915#5190] / [i915#9197])
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         ([i915#4538] / [i915#5190]) +7 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         ([i915#4538]) +2 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html>
>         ([i915#6095]) +127 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html>
>         ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html>
>         ([i915#6095]) +49 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2.html>
>         ([i915#10307] / [i915#6095]) +150 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         ([i915#12042]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         ([i915#12042])
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>         ([i915#12042])
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         ([i915#12042])
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12042]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +103 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         ([i915#6095]) +80 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html>
>         ([i915#11616] / [i915#7213]) +3 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_cdclk@plane-scaling.html>
>         ([i915#3742]) +1 other test skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html>
>         ([i915#4087]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         ([i915#7828]) +9 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         ([i915#7828]) +4 other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-multiple:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_chamelium_frames@dp-crc-multiple.html>
>         ([i915#7828]) +5 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-fast:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>         ([i915#7828]) +8 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         ([i915#7828]) +8 other tests skip
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_color@deep-color.html>
>         ([i915#3555] / [i915#9979])
>  *
>
>     igt@kms_color@legacy-gamma:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-5/igt@kms_color@legacy-gamma.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_color@legacy-gamma.html>
>         ([i915#5354]) +9 other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_content_protection@atomic.html>
>         ([i915#7116] / [i915#9424]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_content_protection@atomic.html>
>         ([i915#7118] / [i915#9424])
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_content_protection@content-type-change.html>
>         ([i915#6944] / [i915#9424])
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3116])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3116] / [i915#3299])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3299])
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424]) +1 other test skip
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_content_protection@uevent.html>
>         ([i915#6944] / [i915#9424]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-128x42:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-128x42.html>
>         ([i915#8814])
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#3359])
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         ([i915#3555] / [i915#8814]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4213])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103] / [i915#4213])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103] / [i915#4213]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103])
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9723])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9833])
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723])
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         ([i915#3804])
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>         ([i915#3804])
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         ([i915#8812])
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_dsc@dsc-with-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_feature_discovery@display-3x.html>
>         ([i915#1839])
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839]) +1 other test skip
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>         ([i915#3637]) +7 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb.html>
>         ([i915#3637]) +5 other tests skip
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-2/igt@kms_flip@blocking-wf_vblank.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@kms_flip@blocking-wf_vblank.html>
>         ([i915#2122]) +3 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         ([i915#2122]) +3 other tests fail
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         ([i915#2122])
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html>
>         ([i915#2122]) +1 other test fail
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a2.html>
>         ([i915#11961])
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html>
>         ([i915#12138])
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html>
>         ([i915#2122]) +2 other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         ([i915#2587] / [i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +5 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html>
>         ([i915#3555] / [i915#8813])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html>
>         ([i915#3555] / [i915#8810])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190])
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html>
>         ([i915#1849]) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         ([i915#1825]) +33 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         +23 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         +37 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html>
>         ([i915#1825]) +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         ([i915#3458]) +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html>
>         ([i915#3458]) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html>
>         ([i915#5354]) +36 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html>
>         ([i915#1849]) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         ([i915#3023]) +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html>
>         +72 other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html>
>         ([i915#6118])
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_hdr@static-swap.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_hdr@static-swap.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_panel_fitting@legacy.html>
>         ([i915#6301])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@kms_panel_fitting@legacy.html>
>         ([i915#6301])
>  *
>
>     igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         +15 other tests skip
>  *
>
>     igt@kms_plane@plane-position-hole-dpms:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-3/igt@kms_plane@plane-position-hole-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane@plane-position-hole-dpms.html>
>         ([i915#8825]) +1 other test skip
>  *
>
>     igt@kms_plane_alpha_blend@coverage-7efc:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@kms_plane_alpha_blend@coverage-7efc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-7efc.html>
>         ([i915#7294])
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@kms_plane_multiple@tiling-y.html>
>         ([i915#8806])
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         ([i915#9809]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         ([i915#5354] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#6953] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html>
>         ([i915#8292])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         ([i915#12247] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html>
>         ([i915#12247] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html>
>         ([i915#12247] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html>
>         ([i915#12247] / [i915#8152]) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html>
>         ([i915#3555] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html>
>         ([i915#12247]) +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         ([i915#3555]) +4 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         ([i915#12247]) +19 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html>
>         ([i915#12247]) +23 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         ([i915#12247] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html>
>         ([i915#12247]) +14 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html>
>         ([i915#12247]) +6 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html>
>         ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] /
>         [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>         ([i915#6953] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html>
>         ([i915#12247] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html>
>         ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html>
>         ([i915#12247] / [i915#3555] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html>
>         ([i915#12247]) +17 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html>
>         ([i915#8152]) +1 other test skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html>
>         ([i915#5354]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_pm_backlight@basic-brightness.html>
>         ([i915#9812])
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html>
>         ([i915#5354])
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#10139])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#5978])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#3361])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#3361])
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1.html>
>         ([i915#9301])
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html>
>         ([i915#9519]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         ([i915#9519])
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         ([i915#4423]) +1 other test dmesg-warn
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         ([i915#9519])
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524] / [i915#6805])
>  *
>
>     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html>
>         ([i915#9808]) +7 other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-cursor-render:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html>
>         ([i915#9688]) +21 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html>
>         ([i915#1072] / [i915#9732]) +17 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-7/igt@kms_psr@psr-cursor-mmap-cpu.html>
>         ([i915#1072] / [i915#9732]) +14 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-move:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_psr@psr-sprite-plane-move.html>
>         ([i915#1072] / [i915#9732]) +16 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-onoff:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         ([i915#9732]) +22 other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         ([i915#9685]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         ([i915#9685])
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-90.html>
>         ([i915#11131])
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         ([i915#5289])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         ([i915#5289]) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         ([i915#5289])
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         ([i915#3555]) +5 other tests skip
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_setmode@basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_setmode@basic.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>  *
>
>     igt@kms_vblank@ts-continuation-idle-hang:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-4/igt@kms_vblank@ts-continuation-idle-hang.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_vblank@ts-continuation-idle-hang.html>
>         ([i915#9197]) +35 other tests skip
>  *
>
>     igt@kms_vblank@ts-continuation-modeset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html>
>         ([i915#9197]) +17 other tests skip
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_vrr@flip-suspend.html>
>         ([i915#3555] / [i915#8808])
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_vrr@lobf.html>
>         ([i915#11920])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_vrr@lobf.html>
>         ([i915#11920])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_vrr@lobf.html>
>         ([i915#11920])
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         ([i915#9906])
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         ([i915#9906])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         ([i915#9906]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         ([i915#9906])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         ([i915#8808] / [i915#9906])
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_writeback@writeback-pixel-formats.html>
>         ([i915#2437] / [i915#9412])
>  *
>
>     igt@perf@global-sseu-config:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@perf@global-sseu-config.html>
>         ([i915#7387])
>  *
>
>     igt@perf_pmu@all-busy-idle-check-all:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html>
>         ([i915#11943])
>  *
>
>     igt@perf_pmu@most-busy-check-all:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-6/igt@perf_pmu@most-busy-check-all.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html>
>         ([i915#4349]) +1 other test fail
>  *
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html>
>         ([i915#8516])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html>
>         ([i915#8516])
>  *
>
>     igt@prime_vgem@basic-fence-mmap:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@prime_vgem@basic-fence-mmap.html>
>         ([i915#3708] / [i915#4077])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html>
>         ([i915#3708] / [i915#4077])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@prime_vgem@basic-fence-mmap.html>
>         ([i915#3708] / [i915#4077])
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@prime_vgem@basic-fence-read.html>
>         ([i915#3291] / [i915#3708])
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@prime_vgem@fence-write-hang.html>
>         ([i915#3708])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@prime_vgem@fence-write-hang.html>
>         ([i915#3708])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@prime_vgem@fence-write-hang.html>
>         ([i915#3708])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@prime_vgem@fence-write-hang.html>
>         ([i915#3708])
>  *
>
>     igt@syncobj_timeline@invalid-wait-zero-handles:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@syncobj_timeline@invalid-wait-zero-handles.html>
>         ([i915#9781])
>  *
>
>     igt@syncobj_wait@invalid-wait-zero-handles:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@syncobj_wait@invalid-wait-zero-handles.html>
>         ([i915#9781])
>
>
>         Possible fixes
>
>  *
>
>     igt@drm_fdinfo@idle@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html>
>         ([i915#7742]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html>
>         +1 other test pass
>  *
>
>     igt@fbdev@unaligned-write:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@fbdev@unaligned-write.html>
>         ([i915#2582]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@fbdev@unaligned-write.html>
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-14/igt@gem_eio@hibernate.html>
>         ([i915#7975] / [i915#8213]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-12/igt@gem_eio@hibernate.html>
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-mtlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-1/igt@gem_eio@reset-stress.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@gem_eio@reset-stress.html>
>         +2 other tests pass
>  *
>
>     igt@gem_exec_balancer@nop:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-3/igt@gem_exec_balancer@nop.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@gem_exec_balancer@nop.html>
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-16/igt@gem_exec_balancer@nop.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_exec_balancer@nop.html>
>  *
>
>     igt@gem_exec_params@no-blt:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-3/igt@gem_exec_params@no-blt.html>
>         ([i915#2295]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_exec_params@no-blt.html>
>  *
>
>     igt@gem_exec_reloc@basic-scanout@vcs0:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@gem_exec_reloc@basic-scanout@vcs0.html>
>         ([i915#3639]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@gem_exec_reloc@basic-scanout@vcs0.html>
>         +5 other tests pass
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html>
>         ([i915#3591]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html>
>         +1 other test pass
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         ([i915#4423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@i915_pm_rpm@system-suspend-execbuf.html>
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-3/igt@i915_selftest@live@workarounds.html>
>         ([i915#12216]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         ([i915#11808] / [i915#5956]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html>
>         +55 other tests pass
>  *
>
>     igt@kms_feature_discovery@display-1x:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_feature_discovery@display-1x.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_feature_discovery@display-1x.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html>
>         +9 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-modeset-vs-hang:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_flip@flip-vs-modeset-vs-hang.html>
>         ([i915#3637]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_flip@flip-vs-modeset-vs-hang.html>
>         +5 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html>
>         ([i915#3555]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         ([i915#3555]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>         ([i915#5354]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>         +9 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html>
>         ([i915#1849]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html>
>         +10 other tests pass
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html>
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-5/igt@kms_plane@pixel-format.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_plane@pixel-format.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@planar-pixel-format-settings:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html>
>         ([i915#9581]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html>
>  *
>
>     igt@kms_plane_alpha_blend@alpha-7efc:
>
>       o shard-tglu: SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/CI>
>         ([i915#7294]) -> [PASS][448]
>
--------------yABYiYFoQfUTzg2l0WCBKCnx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/26/2024 5:43 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172735461687.1106898.12762976372599254301@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_gt_freq: Use sync reset</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/139120/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139120/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15446_full -&gt;
        IGTPW_11806_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11806_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11806_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/index.html</a></p>
      <h2>Participating hosts (8 -&gt; 8)</h2>
      <p>Additional (1): shard-glk-0 <br>
        Missing (1): shard-glk </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11806_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@gem_busy@close-race:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@gem_busy@close-race.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preemptive-hang@bcs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@bcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@gem_exec_schedule@preemptive-hang@bcs0.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@noreloc-s3:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb4/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb5/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s2idle-without-i915:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb6/igt@i915_suspend@basic-s2idle-without-i915.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html" moz-do-not-send="true">SKIP</a> +24 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x128.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x128.html" moz-do-not-send="true">SKIP</a> +10 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-edp1.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +19 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> +24 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html" moz-do-not-send="true">SKIP</a> +4 other tests skip</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>None of these failures are related to this change.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:172735461687.1106898.12762976372599254301@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3116] /
              [i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-5/igt@kms_cursor_crc@cursor-random-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_crc@cursor-random-max-size.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> ([i915#9906]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
          <ul>
            <li>{shard-tglu-1}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html" moz-do-not-send="true">SKIP</a> +60 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle:</p>
          <ul>
            <li>{shard-tglu-1}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-1/igt@gem_exec_fair@basic-throttle.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11806_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411])</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all.html" moz-do-not-send="true">FAIL</a> ([i915#12179])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html" moz-do-not-send="true">FAIL</a> ([i915#7742])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-hang:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@drm_fdinfo@virtual-busy-hang.html" moz-do-not-send="true">SKIP</a> ([i915#8414])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-idle:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@fbdev@nullptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@fbdev@nullptr.html" moz-do-not-send="true">SKIP</a> ([i915#2582])</li>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-9/igt@fbdev@nullptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@fbdev@nullptr.html" moz-do-not-send="true">SKIP</a> ([i915#2582])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html" moz-do-not-send="true">SKIP</a> ([i915#6335])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html" moz-do-not-send="true">ABORT</a> ([i915#9846])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@gem_create@create-ext-cpu-access-big.html" moz-do-not-send="true">SKIP</a> ([i915#6335])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">FAIL</a> ([i915#12027])</li>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">FAIL</a> ([i915#12027])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_freq@sysfs:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-8/igt@gem_ctx_freq@sysfs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@gem_ctx_freq@sysfs.html" moz-do-not-send="true">FAIL</a> ([i915#9561]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-many:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-many.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hostile:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb2/igt@gem_ctx_persistence@hostile.html" moz-do-not-send="true">SKIP</a> ([i915#1099])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_ctx_persistence@hostile.html" moz-do-not-send="true">FAIL</a> ([i915#11980])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-sseu:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-semaphore:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@gem_exec_balancer@bonded-semaphore.html" moz-do-not-send="true">SKIP</a> ([i915#4812]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> ([i915#4525]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_big@single:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-2/igt@gem_exec_big@single.html" moz-do-not-send="true">ABORT</a> ([i915#11713])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> ([i915#6334]) +2 other
              tests skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> ([i915#6334]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> ([i915#6334]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible@smem0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html" moz-do-not-send="true">SKIP</a> ([i915#6334]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_exec_fair@basic-deadline.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-rrul:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@gem_exec_fair@basic-none-rrul.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +3 other tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@gem_exec_fair@basic-none-rrul.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_exec_fair@basic-pace-solo.html" moz-do-not-send="true">SKIP</a> ([i915#3539]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@gem_exec_fair@basic-pace-solo.html" moz-do-not-send="true">SKIP</a> ([i915#4473])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-3/igt@gem_exec_fair@basic-pace@vcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html" moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-sync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_exec_fair@basic-sync.html" moz-do-not-send="true">SKIP</a> ([i915#4473] /
              [i915#4771]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@gem_exec_fair@basic-throttle.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) +3 other
              tests fail</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@gem_exec_fair@basic-throttle.html" moz-do-not-send="true">SKIP</a> ([i915#3539]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-wc-active:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-active.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read-active.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-scanout:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-threaded-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-threaded-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +4 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_lmem_swapping@smem-oom.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12193])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> ([i915#4565])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@big-bo:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_mmap@big-bo.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@bad-object:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@gem_mmap_gtt@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy-odd.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@bad-object:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +3 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@gem_partial_pwrite_pread@reads-snoop.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-random:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@gem_pwrite@basic-random.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-regular-context-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@gem_pxp@create-regular-context-1.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@display-protected-crc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@gem_pxp@display-protected-crc.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@read-bad-handle:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_readwrite@read-bad-handle.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#8428]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#8428]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-12/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gem_softpin@evict-snoop.html" moz-do-not-send="true">SKIP</a> ([i915#4885])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@gem_softpin@evict-snoop.html" moz-do-not-send="true">SKIP</a> ([i915#4885])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@gem_softpin@evict-snoop.html" moz-do-not-send="true">SKIP</a> ([i915#4885])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@gem_tiled_pread_basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@gem_tiled_pread_basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiling_max_stride:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@gem_tiling_max_stride.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-unsync:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@gem_userptr_blits@coherency-unsync.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@create-destroy-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_userptr_blits@create-destroy-unsync.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@forbidden-operations:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@gem_userptr_blits@forbidden-operations.html" moz-do-not-send="true">SKIP</a> ([i915#3282] /
              [i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-overlap:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@gem_userptr_blits@unsync-overlap.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> +106 other tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856]) +4 other tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> ([i915#2856])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> ([i915#2527])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@valid-registers:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> ([i915#2856]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@load:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb6/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> ([i915#8399])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@test-query-geometry-subslices:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html" moz-do-not-send="true">SKIP</a> ([i915#5723])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb7/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311]) +1
              other test dmesg-warn</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311]) +1
              other test dmesg-warn</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311]) +1
              other test dmesg-warn</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#1982] /
              [i915#9311])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock@memory_region:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@i915_selftest@mock@memory_region.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311]) +1
              other test dmesg-warn</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@i915_selftest@mock@memory_region.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311]) +1
              other test dmesg-warn</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@i915_selftest@mock@memory_region.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311])</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">SKIP</a> ([i915#7707])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> ([i915#3555])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> ([i915#9531])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html" moz-do-not-send="true">FAIL</a> ([i915#5956]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> +15 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html" moz-do-not-send="true">FAIL</a> ([i915#5138])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5286]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +2 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#9197])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> ([i915#4538]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +127 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#10434] / [i915#6095]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +49 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +150 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12042]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12042])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12042])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12042])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12042]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +103 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +80 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#11616] /
              [i915#7213]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> ([i915#3742]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#4087]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_chamelium_frames@dp-crc-multiple.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-fast.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9979])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@legacy-gamma:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-5/igt@kms_color@legacy-gamma.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_color@legacy-gamma.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#7116] /
              [i915#9424]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#3116])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#3116] /
              [i915#3299])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#3299])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-128x42:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-128x42.html" moz-do-not-send="true">SKIP</a> ([i915#8814])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#3359])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8814]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4213])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213]) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9833])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#3804])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#3804])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#8812])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_dsc@dsc-with-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-2/igt@kms_flip@blocking-wf_vblank.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@kms_flip@blocking-wf_vblank.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +3 other
              tests fail</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#2122])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a2.html" moz-do-not-send="true">FAIL</a> ([i915#11961])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html" moz-do-not-send="true">FAIL</a> ([i915#12138])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672] / [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8813])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8810])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#8813]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#5190])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> ([i915#1849]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +33 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +23 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +37 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +36 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> ([i915#1849]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> ([i915#3023]) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +72 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#6118])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> ([i915#6301])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> ([i915#6301])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html" moz-do-not-send="true">SKIP</a> +15 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-3/igt@kms_plane@plane-position-hole-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane@plane-position-hole-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#8825]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@kms_plane_alpha_blend@coverage-7efc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-7efc.html" moz-do-not-send="true">SKIP</a> ([i915#7294])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> ([i915#8806])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">SKIP</a> ([i915#9809]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">SKIP</a> ([i915#5354] /
              [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> ([i915#6953] /
              [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#8292])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +4 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#6953] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#6953] / [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555] / [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#8152]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> ([i915#9812])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#5354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#10139])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#5978])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3361])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3361])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#9301])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423]) +1
              other test dmesg-warn</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524] /
              [i915#6805])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#9808]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-render:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html" moz-do-not-send="true">SKIP</a> ([i915#9688]) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-render:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +17 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-7/igt@kms_psr@psr-cursor-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +14 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-move:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@kms_psr@psr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +16 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-7/igt@kms_psr@psr2-cursor-plane-onoff.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> ([i915#11131])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> ([i915#5289]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-7/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-8/igt@kms_setmode@basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-idle-hang:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-4/igt@kms_vblank@ts-continuation-idle-hang.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_vblank@ts-continuation-idle-hang.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-7/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8808])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-5/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> ([i915#11920])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-4/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> ([i915#11920])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-17/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> ([i915#11920])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> ([i915#9906]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> ([i915#8808] /
              [i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-3/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@perf@global-sseu-config.html" moz-do-not-send="true">SKIP</a> ([i915#7387])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@all-busy-idle-check-all:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">FAIL</a> ([i915#11943])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-check-all:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-6/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">FAIL</a> ([i915#4349]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@other-idle-gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html" moz-do-not-send="true">SKIP</a> ([i915#8516])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html" moz-do-not-send="true">SKIP</a> ([i915#8516])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-mmap:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@prime_vgem@basic-fence-mmap.html" moz-do-not-send="true">SKIP</a> ([i915#3708] /
              [i915#4077])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html" moz-do-not-send="true">SKIP</a> ([i915#3708] /
              [i915#4077])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@prime_vgem@basic-fence-mmap.html" moz-do-not-send="true">SKIP</a> ([i915#3708] /
              [i915#4077])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-1/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> ([i915#3291] /
              [i915#3708])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-6/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-11/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-2/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
          </ul>
        </li>
        <li>
          <p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-3/igt@syncobj_timeline@invalid-wait-zero-handles.html" moz-do-not-send="true">FAIL</a> ([i915#9781])</li>
          </ul>
        </li>
        <li>
          <p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@syncobj_wait@invalid-wait-zero-handles.html" moz-do-not-send="true">FAIL</a> ([i915#9781])</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@drm_fdinfo@idle@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html" moz-do-not-send="true">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@unaligned-write:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@fbdev@unaligned-write.html" moz-do-not-send="true">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@fbdev@unaligned-write.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-14/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> ([i915#7975] /
              [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-12/igt@gem_eio@hibernate.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-1/igt@gem_eio@reset-stress.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-3/igt@gem_eio@reset-stress.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@nop:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-3/igt@gem_exec_balancer@nop.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-6/igt@gem_exec_balancer@nop.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-16/igt@gem_exec_balancer@nop.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-14/igt@gem_exec_balancer@nop.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@no-blt:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-3/igt@gem_exec_params@no-blt.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#2295])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-1/igt@gem_exec_params@no-blt.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-scanout@vcs0:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@gem_exec_reloc@basic-scanout@vcs0.html" moz-do-not-send="true">SKIP</a> ([i915#3639]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@gem_exec_reloc@basic-scanout@vcs0.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html" moz-do-not-send="true">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg1-15/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-3/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> ([i915#12216]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-8/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> ([i915#11808] /
              [i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-mtlp-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">PASS</a> +55 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-1x:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_feature_discovery@display-1x.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_feature_discovery@display-1x.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> +9 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_flip@flip-vs-modeset-vs-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-6/igt@kms_flip@flip-vs-modeset-vs-hang.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html" moz-do-not-send="true">PASS</a> +9 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html" moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-tglu-5/igt@kms_plane@pixel-format.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-tglu-9/igt@kms_plane@pixel-format.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@planar-pixel-format-settings:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15446/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html" moz-do-not-send="true">SKIP</a> ([i915#9581]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11806/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI" moz-do-not-send="true">SKIP</a> ([i915#7294]) -&gt;
              [PASS][448]</li>
          </ul>
        </li>
      </ul>
    </blockquote>
  </body>
</html>

--------------yABYiYFoQfUTzg2l0WCBKCnx--
