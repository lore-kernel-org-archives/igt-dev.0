Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20FFD64086
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 07:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464FA10E868;
	Wed, 17 Dec 2025 07:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ6Lp7gW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D1B10EBA0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765956116; x=1797492116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KR9RjhpXwA/9tUoAL43V4eU4o3GMKVe2IP06UlxlxP0=;
 b=HZ6Lp7gW+4W6JQrh5+5u/IUQXvev3qlKlgB/UehhBDbTAqs73noLd5+3
 sMnkekJwzTSA8PIRpe7XbYXZx7fKLAg/W/T+lv5Yht+s8ipmObVoA/WBc
 0fZfAZwpkMpirwVBQnp53txq1/t7Ara3SC1np83zG0I+jk/DsPF+vq2Ub
 fMAj5QNplM+tIgM3eU0yKS1LeRB652imCGS4QxSLSsn9pO8+ctmO7hcr7
 uTLHbZoSHffhz4eYdAOf5LecuZ3xyCQZWfS4UMOo5jaAxstmfFuEPDWUU
 cYQ1hUwfkPmE3fsxOksF1JLBKLU14I00Mf9442zOcaQLF4tWjS0PlnJLO w==;
X-CSE-ConnectionGUID: mcReeowDSZW1q0DAq2g3hg==
X-CSE-MsgGUID: AwkFEnp7RzCEvCeEl+Fkqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78196927"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="78196927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:21:56 -0800
X-CSE-ConnectionGUID: krKgkRgWQiek6lM9qTRHZQ==
X-CSE-MsgGUID: Y3Vva4N0RR2Un6lah9gGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198729583"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:21:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:21:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 23:21:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT7IOsDwOdtzFbNJ1QsMpJWkaUjnu9dKgvbsXnfMn0UV1gTYJc2AOnJDtRZl8+VmeG1xt8lqxC+ZH/BcXMmIoT4eBiIyhUop1pJDbWGe2kgQd7PKNul+y1VOsxjlsCBJxGjlKFOgWv5Jc0MPSdMd3IXmEYqlFGkMQicAZrSXjzTCDxJHqbXh2nATMQYHMF7ExTlKEzMpIZiNimRuHQ1fVEHAsUwyfEWXdzlByDhMVU1AKhVi/Tfx3UvUFXvjbKsu/oPEVswq/3d/g5Nsq6Ft6YSlQibGSSDfkb0IFNvYgle6UPmuC3eMEyPJyhCP/8bYfw4PVh6xCVG2i1KCVRoVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j66A9UyIoHWhjNzH4P0HlSAPZTn8N5qhJvdH5FOwsRk=;
 b=AQjUec3+3o0HOGHDZDAXcX5Yw9e059CrjDcFsMlSGvdm+HtWQAQZDO4+vqjwIonwC1fW4OnBQ8S+dQtgD9sGeOiOX2q/51ypuWpoULVDrjkOR4KPFmEIinF/jerNlGbjdw8EE+Df+vIzSJyj8qcCD5mlMO7lmJCDjCuKB5bVJYTUmu1KiMQ6caxeuKbEvXipFDF3EhrC7MAd4hfMnlTQWzuBwaF+FsES8qaItOZl5bE7QXvJJyFR9yyZ2HCEme0sI3iMIckbpNWPcQ3jzLynxClfxaJNKVS+e9V35UCSZol23VqjUchTezOhm6mzf9kIxWbm+HqGVg0KxpuxSKWQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 07:21:49 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 07:21:49 +0000
Message-ID: <01006a0f-1df1-4178-a90e-75a1de8d43a1@intel.com>
Date: Wed, 17 Dec 2025 12:51:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <alex.zuo@intel.com>, <shuicheng.lin@intel.com>,
 <stuart.summers@intel.com>, <kamil.konieczny@intel.com>,
 <matthew.d.roper@intel.com>
References: <20251217043450.241761-1-x.wang@intel.com>
 <20251217043450.241761-3-x.wang@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20251217043450.241761-3-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::11) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 07855eb0-96f6-4963-5243-08de3d3cf193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajFoei9hM2tYWkg5NmFjcGhEY21oZ0ZUeU1wbWRwWU1acFE5M3Rxd0poN1ZI?=
 =?utf-8?B?R0EvR2FCczc2bDQ4SmM1bkQrV0pmK0w3SnRLMjNKVHF4MXVMVlZZS2hGVGFr?=
 =?utf-8?B?bzFQQUlNTDdyM1FvenJHNFJtcXI1alBOQ0xNUHZlOG4xZGRMQzFlT2l4U3Nh?=
 =?utf-8?B?U25CTTN2KzVIRTZMZVl5eDkxNk9wanlDN294ZXlOMEt6azAvTFY5T0lwQlVv?=
 =?utf-8?B?NFZLdW1HUHdUeEovQzNVTllqYlN5ZlZpQ2UrMGgxNzQyQzVLSWx0bFZ1Qm5v?=
 =?utf-8?B?N08xY1NNUjdpaUlUSk1RMXNja3FuTU1DYXZZRUpUL2p3Y3Y1cWNvR0lQZHhJ?=
 =?utf-8?B?VWZBSUpCWkQ5dGdNQmlTdllkRDh1VWdYV29wNkMxcitzdTdFdjhhN2drU3Az?=
 =?utf-8?B?bldyMXdtd1ROOFZiODJkK1VvU3VKdFFvQWFkOHM3cTIrMHJuZUkvL09MMk05?=
 =?utf-8?B?RHMxQjVyeEd6eXZDVjdUOGN1T1FtQ1BhQWdlQ3FObFhBc2RJQXdPMFUyTkFa?=
 =?utf-8?B?VHhMaXJxSU9VTDFxTlBqWlVNTWhMeWlqNit6QWw0S0x5cHNsK3YzdmtEZnVj?=
 =?utf-8?B?eWJmQW8vdGc3VnBxT3ZDZWcxTVV0UklOTmRwVFpDVUgxK0J4SlpHM2Jwa1BE?=
 =?utf-8?B?TUg3OXAxMGtDMmlVMDVwdjRVam9vSTZUeWR4MER2TWh4dXNydWtGa2tOcmVX?=
 =?utf-8?B?VWU1MXRCNUlQVGtjaU0wL2F6bStBU1k3emNCREpIZDFuaFNVc0NyWG5ZYm0y?=
 =?utf-8?B?VEtaT0RhNXRNdVN0ZUlQZ1NrMCs3TVBJcTVGNjlrM3lKU1RmZjBFZUpLWWg1?=
 =?utf-8?B?YmtmSlZpWnFTSENUdWpFVzFUdmg2blVadysxclJBTTFmdkxzazZFVXRscW04?=
 =?utf-8?B?ZW9KN2lkZ0QzRFNEbXRtcDZET0REWW03dHpuOSt6WDBzZnlLM3Q5WkpGWEt1?=
 =?utf-8?B?SGQwZmp4Y1NqMmJiVmNUNGxWRUtLdHp5TEdhSTY5b3dmYVo2MkZkWldONTAx?=
 =?utf-8?B?eUxVdDR0dlZUZDQwTjFYZlQwSDVNS1gzZHVXMGJuTmljcGp4bTNoNTBJVklr?=
 =?utf-8?B?YjhsNndFWi82NXN2ZkRKQ0J6bmFKM1BXTzZyRC9aeHErck1ZQ3RhV3RBeXBZ?=
 =?utf-8?B?REVqcXR2c0d4ekc1bnFDY2dPTjZjMzAvVHMzM1pKVGFoSXo3RGowbTBFWnNi?=
 =?utf-8?B?OVhSdzN5M29QNTE5V0ZYdUZLeFlDUTk2NmJhQ3gwTUZCUXR4dEFCbmx6dlc4?=
 =?utf-8?B?b0NXbTFVUHJTcHhXREhJRXVMUVY3eStEOExkOVJYZ20vcjEvc05LcDNic2wz?=
 =?utf-8?B?dFRQT0VCdzAyVlM1VjlVbjVVMkp1Yy9aQWJDTG5HS2hvWjJCK2ZEUkxreWVJ?=
 =?utf-8?B?QXZVaUQxM2Zvb0tHOTBCM2xNbTRMS2Mrb3BxaTNoNFRSWFhxVVNPbXNNSVFv?=
 =?utf-8?B?T2xzUzZFenBaZHdzdkx6NSt6YzNENEh0L3JvK1VYb2c5QnZnU3RhcGE4WGZP?=
 =?utf-8?B?cFZWeW5GdlMrZ2FBUzhlL2dJSGVaSktDdWcxNHZuNnhCaFFmakhNUlE1YzZs?=
 =?utf-8?B?eFpPVGV5bjUwZk9zRnI0TDR4dHFiL0NSdWZoMDlCSFZKZjh3ODVOWkMzbm9h?=
 =?utf-8?B?N3dpR2NyWXBSMTRmbi8vdHFnUE4rYkpYeTZoMWpvS1hITWlGb1lBdnJsUmF5?=
 =?utf-8?B?ZzlvRDBPRUEwdVp1VkFsbmg0UUJxd21ycGJNSHBEM3NwS2pMbXNnbFk0NnZF?=
 =?utf-8?B?NEt6d1RabDNSVEZTbVNwV2llMWFSLzNlbklBbW80dFFQQkNuUXIxeUsvQTJt?=
 =?utf-8?B?R0wyMWF3b0ZWN2FEa2JFaElhbEYwQnVrMXBteFNoY2NtdURJRlQ4RHl4R0pw?=
 =?utf-8?B?WXFTbjZNNUg2bmg3Ty96UkMwN3BhcVVZME42azk2OHZUL2JTS0o2UnVOS2Nw?=
 =?utf-8?Q?MyIwmUCj54/dA+m/hyzdL25G6OvD4fkC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVvSUxUWlRiQ3Z3N0VsRHVYVGNEWXV3UEhZWWEyb3NYemlrSWNoVjQvU0xs?=
 =?utf-8?B?bkJTRkhia3d0OGp2Nktta2djcjNpN1dUYk5EL1lqV1NVTlFKeTJkWEJUOFRv?=
 =?utf-8?B?Z21rcEZSVENLVkplMzhtNXdaVnh1MHd3clVSQ1dLMmhkZzBaMTZRY1ZUN05G?=
 =?utf-8?B?YTRoVFdzQnhIM1N6U2dmbDdQUlU1dldONnY0UGk5U1lRT1FLRmVjb3JWNGJN?=
 =?utf-8?B?aFpFN2xHUVZmcXpuYkV3NUJJTVNLOERXcC9SQ2E4OEZjQWF3NU5RV1U1Q2tj?=
 =?utf-8?B?MlVuMldSOTIzSUtKdGZtWWhQbHJHMmxrR3BhOUo4c1NjNDNLbUlncC95RWNG?=
 =?utf-8?B?YjVFSUR5RTFKc2VKWGY2WFNxTWZhbjhSME5zSHA4N3grM3J3cDVyMHJtYTVR?=
 =?utf-8?B?MGpXMFhaeE1DK0V1NUJRc3RYZnE2UW0xMHJ6UzJBNWxVZThZam1DNkt3ejVq?=
 =?utf-8?B?cU1hK2Npaks4OUM1eTFybEhBZUtZRysvU3N1ODd5SDJhdkx4bWZCVVoxMDVz?=
 =?utf-8?B?R0hCNDRwTWhxOEsrZG1kSzM2TzRxZWNtUHRqbnBLOENmS0tnYUROL2wzc3Zl?=
 =?utf-8?B?Z2NKc0pEcHpKWXJKVElnZHFOR2JYYTZGMENOTjlGN1FHajNRNlExWUVjdjBJ?=
 =?utf-8?B?dG9ZUktsbDJYOUlxUGtsNnMrVEhERXgvb0ZxSHVzRUZEcGV3YjRISXVHQUZs?=
 =?utf-8?B?SkFicTNtLzZTcWRUZm1SK3Y2VDRmYmV0eUNPamFEdmZzZ1dZWU42ZStYS2oz?=
 =?utf-8?B?eEw4aVQrbkx6VkovUWs4RG1ycVNxVlI4bGVPb0hSY1REcWtHbll5bFh3VW5C?=
 =?utf-8?B?c2xrSURmWFRsZitBM1JEMkxFRG9OWUNubG5nUjIzc21YV3ZManFKSUdtcm9Y?=
 =?utf-8?B?TlJuV1grd092bmJDWkNyaFYxK2RBY05NUGlSUTBZV25lTit3VkdHZ2REUC9Z?=
 =?utf-8?B?U3VxVFhKeEpsa3B6bnl6akNlUHJTSmt5RUtncDI0azJvN2dWb21oRHh1UXdF?=
 =?utf-8?B?aDdxVlFtd2kyNTZObWJ3cm1vcitxT01iVktlUm9uL3ZhUzRHb1F2S2dZQ081?=
 =?utf-8?B?dlgvbklEUDhCSTdiZVFCR0x1Mzh3NmFUS1ZKc0swN1FXTklWMHloQ0FXbzQ3?=
 =?utf-8?B?Z28xeDJtWlE3eFZhNUJ3T0ZId0JmQU5oMTY2dWlxNmxRbUlTUEZycHhVNnds?=
 =?utf-8?B?bFZ3ZjMvb1VNYisrbjRZb1BuL1lQd1ZBSnVpQVZFOFJEdWZia0ZQdDZLT1Rw?=
 =?utf-8?B?NFJ1QmJVWmV3VVR3WmRmVGhrQWF1dzZDdlhXMFVOa0FkLzFNVFJMcTNXd2x6?=
 =?utf-8?B?Z3NraFVYYmpuK21Ha0E0VUZaTERzT0ZPZVJPNXQvQzh1UTd2MHpoWjZNQ3Z3?=
 =?utf-8?B?UStMTmFkTFNObUFJMWtudmVVY3UyRTdEa2RmU2xSOWhVejFpMWJQa3l5cEEz?=
 =?utf-8?B?M2g1bmprSTdSeUhKcmRRaTFtNDAzNDRneExaV0hMbWRqMFVFdFFnMWtpV1Fl?=
 =?utf-8?B?aDlLOFJDV2xqMUVXeHQ0MWROMmtGVyt2WnNCUHlXbkwxaGptRVZBNnlXTmto?=
 =?utf-8?B?aDBPSjJ6RThpM1oyQjdFWWZqUExkQzRsSzBLMnNacFArK3VFVFJSUlZYQjBw?=
 =?utf-8?B?WVJ0VmhOU2t6d3dnZVNKeTJpUUg4R05SbS9BTzdSQ1VYdG5QNENTVVJvK2VN?=
 =?utf-8?B?bCt1Q3FVdjEydGdYd25MYWZuL2p5VytqTUZzOUpRUlZ3REZaSlhnZExqMkx1?=
 =?utf-8?B?WFcrK2RPRmJwWmx3TExacW5mc1pJczFUWW9FZVgwOUFVVDBkK0R5UUpCZ2hI?=
 =?utf-8?B?Y2ZSS2Uram5MQkM4d0hxb1lrSkpHK0hCZW43UWhpakNhOE5rQk9ETHk0T2dB?=
 =?utf-8?B?T2dXZ25VR0piaTBqeUJLakRCWXZHRTV1ZTlDR3N1dkUvdGhCL2QrWENGZEpB?=
 =?utf-8?B?T3dCU2VYWEgzNkI1K1E4L01hVHMyYjd1Z3UxR0Z6alBNRHJidTcxTlFhSDJE?=
 =?utf-8?B?blJKYTFNcWU2Zm81aTJTSnJiRVF6N1ZhbnFCUHBLN3lZQ1NMaVpmOWxLSHJ6?=
 =?utf-8?B?QWVEL29aZTh5Q2kwS1FaT015bGtEaDlRNzlqUXBjazhWR1NQMGhUd2Q5dDdq?=
 =?utf-8?B?OG5wWkMxNlF5UWlSMUc0ejNrMEZzSzMveWtueno3cHYwZGhjUmVWMi9LZlJp?=
 =?utf-8?Q?Llgl43DQwf7fJqteZOHZPMk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07855eb0-96f6-4963-5243-08de3d3cf193
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:21:49.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBzQVi0uXWXkC96e1cu4jubw8/EygFKAHXu4Tg9sWqfgAmxNVbiPVdPHl6sv+fPQFopH7aJ8xTxUwduClJSegW75YdC83XbNTquaWf/HWj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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



On 12/17/2025 10:04 AM, Xin Wang wrote:
> For platforms with graphics_ver >= 20, query the runtime xe device ver
> instead of relying solely on hardcoded values from the PCI device table.
> This enables accurate IP minor version (graphics_rel) detection for
> platforms like Xe2 where different steppings have different IP versions.
>
> Implementation details:
> - Use weak symbol linkage for xe_ipver_cache_lookup() to handle static
>    library compilation (libigt_chipset.a, libigt_device_scan.a) without
>    xe_query.c dependencies which are used for i915 tools (i915_perf and
>    intel_gpu_top)
> - Provide a weak stub that returns NULL when xe_query is not linked
> - For Gen20+ platforms, prefer runtime xe device versions over static data
> - Fall back to PCI table if xe device info is unavailable
> - Reset cache on query failure to allow retry
>
> Remove hardcoded graphics_rel from static table entries for xe devices
> as they will be populated at runtime from GMD_ID.
>
> This unifies device info handling between i915 and xe drivers, enabling:
> - Platform-specific workarounds based on accurate IP versions
> - Consistent device info API across both drivers
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>

Regards,
Ravi Kumar V
> ---
>   lib/intel_device_info.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 20147479a..3bc20ab68 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -3,6 +3,16 @@
>   #include "i915_pciids_local.h"
>   
>   #include <strings.h> /* ffs() */
> +#include <stddef.h>
> +#include <string.h>
> +
> +/* Weak symbol stub - will be overridden if xe_query.c is linked */
> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid) __attribute__((weak));
> +
> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
> +{
> +	return NULL;
> +}
>   
>   static const struct intel_device_info intel_generic_info = {
>   	.graphics_ver = 0,
> @@ -505,7 +515,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
>   
>   static const struct intel_device_info intel_lunarlake_info = {
>   	.graphics_ver = 20,
> -	.graphics_rel = 4,
>   	.display_ver = 20,
>   	.has_4tile = true,
>   	.has_flatccs = true,
> @@ -517,7 +526,6 @@ static const struct intel_device_info intel_lunarlake_info = {
>   
>   static const struct intel_device_info intel_battlemage_info = {
>   	.graphics_ver = 20,
> -	.graphics_rel = 1,
>   	.display_ver = 14,
>   	.has_4tile = true,
>   	.has_flatccs = true,
> @@ -529,7 +537,6 @@ static const struct intel_device_info intel_battlemage_info = {
>   
>   static const struct intel_device_info intel_pantherlake_info = {
>   	.graphics_ver = 30,
> -	.graphics_rel = 0,
>   	.display_ver = 30,
>   	.has_4tile = true,
>   	.has_flatccs = true,
> @@ -700,6 +707,8 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
>   {
>   	static __thread const struct intel_device_info *cache = &intel_generic_info;
>   	static __thread uint16_t cached_devid;
> +	static __thread struct intel_device_info xe_dev_info;
> +	struct xe_device_ipver *ipver;
>   	int i;
>   
>   	if (cached_devid == devid)
> @@ -714,6 +723,17 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
>   	cached_devid = devid;
>   	cache = (void *)intel_device_match[i].match_data;
>   
> +	if (cache->graphics_ver >= 20) {
> +		ipver = xe_ipver_cache_lookup(devid);
> +		if (ipver && ipver->devid == devid) {
> +			memcpy(&xe_dev_info, cache, sizeof(struct intel_device_info));
> +			xe_dev_info.graphics_ver = ipver->graphics_ver;
> +			xe_dev_info.graphics_rel = ipver->graphics_rel;
> +			cache = &xe_dev_info;
> +		} else {
> +			cached_devid = 0;
> +		}
> +	}
>   out:
>   	return cache;
>   }

