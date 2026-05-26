Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205D5CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 18:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10D910E6E0;
	Tue, 26 May 2026 18:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Td/RROem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096AB10E4BD
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779820261; x=1811356261;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X3BNls1FyihkCN4fYEOMGPcTOa99EoI81z1P0MV+gA0=;
 b=Td/RROem/DlxlyU97Iw+HgojMS5kwQBFXLrRUoj78EONcCUxl6jl2m2Y
 T8aB5U87pOj29w9JdO3QzpF61xnAbaol1AL7IrvFVQz7i4puGKq6DyBTS
 7sZY2M7UlpCSsy7ICY/aSwBeOoFSZtHlYGGb1iJbH12eQQIs8nzQRNds0
 oSuYIHe8p5zzHDkxC3Bg6i4k/vTXcL8sLoJyziGkNJShDhN1lNpgKexyx
 8tCsFv0SFAKp6kKWq42TT+KcYLfLOj5/2y8Ycb9xjU3Nc04oPY8LZKLHz
 t6142/a8bV3hwHk/gN0+RbSGkGnv8BiSb2+BwPFvZyOxy0i1Q9s57ELCV w==;
X-CSE-ConnectionGUID: JC3m+428ScS0obn0VXCm/Q==
X-CSE-MsgGUID: 8oP5TMdmRpqBymOdAHJrYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98068545"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="98068545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 11:31:00 -0700
X-CSE-ConnectionGUID: 1g0tnec3TROIVgy6vG/1pQ==
X-CSE-MsgGUID: QFiYocWrTS25DlYTOAMBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246034580"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 11:30:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 11:30:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 11:30:56 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 11:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQYz5mworaSoHqJALEDiGaF5hDsHztL4Ts9eyBqZOzxLRL0rWKIoKUs9Y1xseLmdCcgqfoR5mnGP4t47iqyaG8efv0anUDKEL+rochvl9wLm0otQN4OQeBDRE3wMznXh4pVVJEWsl8mQrwREbcTLA5bJmYV/nN8AksiwsDbi/OnkZbkr/yUBWb6+QL7hYPpGhm6bfQaWdtDRcAmC4OjU3QMb1QMtQg7G54vE/Ga7ue25AqRJlrZH0/jnUU2w/rA+v7UH8bQkEmglu8ZOYaUwOz1PB/I+AXf1O8Q0dAzMWKmWX+p+JemNYEmyvX37z8KhcJSgBLIUYm20KNpJWj993w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO9tM3oUi0UpkK/ca6JHOR1MehRWKA5z1RoPQz/AfHg=;
 b=dnwV8t805ld0xfGms5WRzL6EQC0ahGRMi28lbcN5hen4dGKVnDZa7gRujtFXhR1xL9FhtGKAPq/XsPtpYqPf+x8uzHGbM/Wonzk/Gmv7R2aCCOXFeDJKNTOoHRSzCxsIOVTAhqOCHT7CanOmOsqtPpaVajobytIX8GH6QnEOJhNLrFJaOJdhGJJcFKr1U4l7/xy30mP8sAhTKoOq07g9Y+bXgQPEC4oKaXt8bJ/s7I/46gldjFM2wpHUGIGxaYaQ58HOjq8R27qjpZoWFh3Cjx/QVpWYV8OttDu7aYhnJuBYbE1Y9m9KWKtuNo0XPuDS/mROYqI48WJJQyYKfj3XPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SAWPR11MB9547.namprd11.prod.outlook.com
 (2603:10b6:806:4e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 18:30:53 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 18:30:53 +0000
Message-ID: <d6e7a7b2-614f-49c7-98f6-77368b2a6160@intel.com>
Date: Tue, 26 May 2026 20:30:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/meson.build: add rebuild_iga64 target
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <20260526-rebuild_iga64-v1-1-531eff7e3e24@intel.com>
 <20260526092519.srfr7okxaay65lze@kamilkon-DESK.igk.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260526092519.srfr7okxaay65lze@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0065.eurprd03.prod.outlook.com
 (2603:10a6:803:50::36) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SAWPR11MB9547:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3f137a-a45d-4091-0022-08debb54eb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099006|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Ev6OHor8vv788CKCDpsHt67P7b2CloIU2Zpdg/VTRPrMkVoGPkB0AjR5Dir6sDWE98GORkSePH/0c6VrUJp5fDuNj9uzocuvp2vwsL0zUXHtJp8986zleSSKMiMcE7xBsw0KTBgFaZax2C46jP4XAZ6TJ9bwNPGof8njibtY/W27xjTGQBZht6VeAuVEtTxVOEwdfj27BFuJvnQ5rx53YX7Hqt6+XPNFBqjvnpqb3UuySLU47il3d9xPMdCBNMGWJqEoAJ7ORadC+Sx8NuTXieZ86gY3W/wsKB0Ph3eGYDC+kh/Nat0+ztsS3BBb39V7BE3rZCMlrUeqUMixHqcm83tGH0Rs2//NoUAX2jJuMum2a1ntDPFuXFY8zmkT8R5UYhOxE1EmbWJk6tpvG00E/NgT85F6CN3HFfLpHUImMPCZj+lilkLAvdQ8dG/koEyDDSzTB7tD6V/7TsvlcbhJQiWSgTDrICcNnAw9WIY/7UQP685GRZpRDbM30c007Rz6alvrL6yi55M84jbsC0RMAt55bKvGX9/rnbukgpMcWyXU1NLld2DjIUIsrf4rltVLH2cU/3PNlNm4XItEnZinDaS8BObe6Nr7yMqlwnwzxkg6ncrEva4To56oAwvEtom/wnDBfIr6lWk67Ggt7Bw3+Li2My+wh0EdJslpqivCsq5SmIT76JwT6TEamlic/MNi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFAxcndNWHBmWGJHM251Ri9PK01zb1YyWVR1ZURXYmxuUXVoek95SlZiNHBu?=
 =?utf-8?B?amlzRU5WQTBSeWhGUm05REJkZE5kc1RzZi9DamZZTHZTYnpkYkgzRVlmdFRG?=
 =?utf-8?B?cDlUeGxYTXE1VEEzMUVQcFF1eStWL1FLcGszeWR0TUpyTEhFSUgvc3ZoRXZn?=
 =?utf-8?B?N1dGYWx4cWliR21xZ2tBb3NibFRsRUxjalFzTGQ2d3VsVlQxZVVLTnFkUDBZ?=
 =?utf-8?B?MkVHWTdrMDFZMXhWMnNpNjB5TFhYR08yZkZmd2ZKNVlDZDMrdXdHVlFTV2oz?=
 =?utf-8?B?elkzUWpMWGtpUE1nVnBPaWJFMTFOb3YxMXFweG9kbFpSbGJVSXZUVDRRU2Rv?=
 =?utf-8?B?MWhNTFpwMFBVWXI4WVhpNDRENlFpMEN1U3RieFJmaitiWldmcE9YNHZqNGcz?=
 =?utf-8?B?Ny93Z29qQi9TU2R5YnJNZGhpRnczTW5PRC9vYTU5dll4Z0lCcUtKZVM0SXVr?=
 =?utf-8?B?emlzcWdsaG1zY2RQNWEvYmV6YkpUM1lwT1hHNllHTUpTNVI2dENZc0pISFp6?=
 =?utf-8?B?TGJ2d0lLY3B2ekR0VXFjckorZEZmQ29aMHRLcDVyS3NnTkY1MjZUalZIL2FC?=
 =?utf-8?B?QTdwSzA1NjFPdnFnMzJQUVZtQ3hacVRudWpJWHloZ28zNHBFTFdZdkVRbE42?=
 =?utf-8?B?cXpLdFRKNno4M044U3pyeloyTUROMVRmK1FQVmNLMU5tL0tpV0UrUUNvbEFH?=
 =?utf-8?B?Tm0zUXI1c1U5SEtxTTJSMTZEd25lNHFVUjhOVDZWKzRLbnZZUzBJU3BjeGla?=
 =?utf-8?B?NCttRWc3QllEMjlJV1FyY1lHdXdqcjNzdG02VkFlbGM1aG4zSnVjR1h0T3Yy?=
 =?utf-8?B?R2VIOE1tOHZIc3B2NlUrOGhldHFrL28yUURJMWxzS2FhbVNRKzMrempsWkJm?=
 =?utf-8?B?eEI3SXBGMmxuU1dDaEZKQXBCeVRycDFOaC9scjVDMExTUDZwQ1FyRVNJcUpI?=
 =?utf-8?B?MG5hYTVJempCU2tHYmtZMnU5d3VoWVN5WXdSa0hxMGIxSXhUYWJSMldWOUtC?=
 =?utf-8?B?WFBKWHM0Rm42eHExM1RQRVZ3U2RIeUkwTC9FMWRTZDJ3Y2ptL1hId3RWT1B0?=
 =?utf-8?B?ckxqMnFRUGpwejZkRlZPZ1FOMDlGMnhLVEQxd2pVeEZLOFhWYW54NjM0RHNU?=
 =?utf-8?B?WnIvL05vM2NXMGoyNFdDdGJtKy81cktDdEJzcFVLT21QU3MyL1M2amJqRkxl?=
 =?utf-8?B?andVRzRXR3pkcEhDL2NnbE92MEt4L1lXeHRUT1h6VVBESHhYQmdFOW1JNEFN?=
 =?utf-8?B?VlZQVWgyUCt6VDBaUytIM2VEV1JDS3dCc0tSWW40YU53NmZvUmZBTlVUb2xx?=
 =?utf-8?B?M2pnMURUaVE3bUZSNTVYUWxuSTNXdjNoS25wTXNuUFZNaVBWa0lhR1JFeFcx?=
 =?utf-8?B?K0x5M1QyYzVkT1hZYW5kOCtqZXlMQWd6M3hrbVdCR0E2R0RINjdJN2RnTGsy?=
 =?utf-8?B?NUZqanQ2bkhYUmxaakJUWHVmOURBWm5zTkJwYVNsWEJxWStKMFpOZ2FiYzVO?=
 =?utf-8?B?V2RnWS9OaVdkQmpob1cwaWRjWXRjM3NLamxQeDRGelREYUFQWnhQaVFFWjRT?=
 =?utf-8?B?emZyZU1MMFlQblhVUnBya1o3a0lBSDlLVDVrZGRqcmNDVTJhSGY2aVlaVUk2?=
 =?utf-8?B?RXZwVUFuV0Q3SnJMR0dhS1lIQ1pzZFhaS3IrVXVKNVBhQ2VRTmNRWkNrSGhF?=
 =?utf-8?B?REhsZVU1bWxlQWdTbnpyRFpwTFNycXVNeHRuTEF5Ri9meFNHbkczR1dOK1RI?=
 =?utf-8?B?SDFiYTRWZGdVMEthbEhZQlZkVy9kYlJPc2V6T3BFOTlLY05hOXh2OVFaMGNV?=
 =?utf-8?B?cytUUVNucDFzbWljTFg3VXkrb0RBVEFnWGhxU2t3dlE1UjhGT1dGaU5SdDRh?=
 =?utf-8?B?WEtMY2xyS3UwMTRGb0M3YU1xMDhxd2l0VXFqUUM5VnJCRlFFL1dNWTkrb2RM?=
 =?utf-8?B?Y2VDOStGZjJvekNkWWRHY0xFaGdpMDRvQktGMU5wYXVvME80WWJhU245b0Mv?=
 =?utf-8?B?MjdDeW1iOHhQYjRzTUVkVlBSZ2tRRjd5TE5mWXpsWHhxdHdxN1cxQmNLWGNH?=
 =?utf-8?B?M2l6SlJvQkFPNkVZT1M2cnVrOFBQM1M4dDdjaXV2bnlqQTEzVmxuTjdLbVpX?=
 =?utf-8?B?NjVCZ1FtNXpvOWtSanJtZkVlVm9EcWRDS3VvVjJmTG51cXNnR2l3dGRIM1Ra?=
 =?utf-8?B?bXhndTAxa25wTlgwWHAwZEEyVXliT2tRQ1RMazJqVmU1bzdMNVVNVzhaUy9Z?=
 =?utf-8?B?T2phbGZ3dldoTTJvbStEbi94ejdKUTFUZ2NXYkQyck9WdnRSdnYxNTRGQXdG?=
 =?utf-8?B?cDlhcVhac25SVDhXSnNhMXB4c1J6b21IUE9QSHIxZHhTdlFhek1rUT09?=
X-Exchange-RoutingPolicyChecked: LWKp4575zY1ERSVKs70Sf4RVnWjpWBeP6xpbv21Cjnqvz7f5Lgj8XtVHm4OCQnbfVLf1nsoRcewhlh0Ar2PHkdkJw+bdoRzTo0KoAOJXDjuBRM/Vc8hnRn0tBcmbphpk4yF+Pq52o2MO94Em7AJKO7LDSuPWMqgBY6D+tJf4/P3Yr2FBLK2n1J5MQtkv3TPas1mzltEbMZ0eYL7b29EALtJWp5OqOQzQIi8OaezaGkRbLSm5LX8ngiTcdepZPN/GNbj/I2sJYgeOm+PgU3rimFFzVDkaDsoaNlmqtoXQW5RgBKizcIA7f5ww+XFYwxnQR+ceFZ3Qogaw9akas21zPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3f137a-a45d-4091-0022-08debb54eb2a
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 18:30:53.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLQ9vaztbXJTXttl92Rn7grr1iBF1cRWGC6cP7kJP/oB6pxHhI4ElsakhOQMsO72ZBl7nLOIYLUJWFAXhHvyTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9547
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

W dniu 26.05.2026 o 11:25, Kamil Konieczny pisze:
> Hi Andrzej,
> On 2026-05-26 at 10:23:38 +0200, Andrzej Hajda wrote:
>> In some circumstances rebuilding all GPU asms is desirable.
>> There is already a way to do it, but it is complicated.
>> rebuild_iga64 virtual target encapsulates it in single command:
>> $ ninja rebuild_iga64
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thx, merged.

Regards
Andrzej
