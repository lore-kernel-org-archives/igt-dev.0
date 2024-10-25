Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EAAD0C61F
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 15:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1C810E0B1;
	Fri, 25 Oct 2024 15:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZYVt/QL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBC410E0B1
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729868737; x=1761404737;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=7vzGJvuoLfzFdMvkJVjJtbdDIFHwbSHT3Yxw/cFNc38=;
 b=fZYVt/QLNv3BqlE+7jCiV+DVMMx0WFUYYz0n4YRggZOZAfyOysf0GCpf
 2RhAG2wai93/0/syhK/6I+FCEttmXh7HQ2iBtctXSlk60LxSNOg5ecT2q
 rYPPRp3+yJTFsSEzny9cUqcnHcvTxHTVWbknfV2G+SVsdoiB3oT45R92f
 UPEpbuBXApTreN1b8Hi/7HMqGpnfnSmjWb09kZebGKydFX6WPI3ge7EBt
 XwCoOxk9YFjvi1eQSUFZ3ZHuj1JCoSZzQk6qdTD0iD7jwtfnwbID24SIF
 sI2ZpHrTqvZKNhDLLQJffwRUCdbR+5oI/i/yZ4pLsswrdkfOlRABnCM8C g==;
X-CSE-ConnectionGUID: Z1e1t7/xTKqEQkDBs3NGGQ==
X-CSE-MsgGUID: 80LCQkN7RzymoPg5mroBpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="32400672"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208,217";a="32400672"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 08:05:34 -0700
X-CSE-ConnectionGUID: JiuW+Zl8QN6SsIJpllDmVg==
X-CSE-MsgGUID: Nfm8fCkhQhepTbb1JsjUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208,217";a="81370723"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 08:05:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 08:05:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 08:05:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 08:05:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmcwM/zrxZRY9SansLYwuPoYNX9EzHwFW2LZZAm8Kscw/xTIwViq4z0L8WAzyLj0d+9S438Qp/o+nwVoPeePhmbPPEPNwPIWfns3DOSFXE9hbGzZwHrucYTKcAvOvLXJK0msaDSQ3LDouk6B1MTYErZ/pbOW5YGt4P7nkxyKSHJ+eKx3Jjwf0Bq4pbs/1SiUonCFpyRC6OG9fmasCe7T0O7OJfWIGHB9HSsVDx9sSWEMKOlDCFJ2ntRPtZnt08VwtX1MeWFkMMEKyPucD72M23kWabHLrnPT5urB1CL/BM1cDh2kXt3I2PiPNVvbcB6r23klxVWlIymCCQLQP8bzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/34IJcm5YUx9+XOzfDxyHlcGAklPd7fWAxH43l1VZgA=;
 b=coGpqHZt7N2zRXRJ5i9nABKtpmDNMYhKfQ7lUe5iLteGQ2y65IjLvNM31q6HeQ4Nndjs6iXtLHEem7zWld3T4A8oIRgvmsQPM7K1aAE4grF64dHri7ZHuCDQko3NtSpVM8aAuaZKh0D7AoN5pr2Hu9Vz3GjWVJ/K3222brwfUvOujdHek8xHwKfW45zY4JlMP+6nBHtRVS6pVm7txIS4V28GITVLxHBFmOoZiOXRXh5hTl2+P6ucqXQL0r8duwv/Kcdghi1vNlvU1DUj8/eFl9BP6TyiRz2uC33ynykzgL5iFf7LeqSbdPwPpnelcLgJbcA14mM2u8tdzjUcOnPzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 15:05:19 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 15:05:19 +0000
Content-Type: multipart/alternative;
 boundary="------------Nti6IWrBYLG3m7fSH3iCNtfR"
Message-ID: <f0a80ee1-3624-4a5c-8d31-fdbc78352d14@intel.com>
Date: Fri, 25 Oct 2024 20:35:10 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL3hlOiBB?=
 =?UTF-8?Q?dd_tests_to_validate_GT_coarse_power_gating_status_and_toggle_coa?=
 =?UTF-8?Q?rse_power_gating_states_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20241025055959.2152585-1-sk.anirban@intel.com>
 <172985716032.1331322.15675395718827361356@2413ebb6fbb6>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <172985716032.1331322.15675395718827361356@2413ebb6fbb6>
X-ClientProxiedBy: PN3PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::20) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CO1PR11MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fd2460-1500-4cfc-721d-08dcf506706d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dU5HdlhPZmFVSzd6OVlYNFdnd2ZOWWZCNTZrSmxQNEcwZ3NiNU1Ib29vWnI3?=
 =?utf-8?B?REJ2ODZSWmFKZnVRSEQzTGtZVkZxWWRiQW53YVZtTGgyb0szM3k5ZnpMWUZY?=
 =?utf-8?B?QUdsMWJSaWdqWDlJZmw4dUhJZXRrTFIwUUZYT3RmMk1NQWpDTFVXd2ljMzZZ?=
 =?utf-8?B?SUZrSGJrN2V2M3YxanRGVHQwQWVzcFlGT3VuclBxK2ErUG8zckNXUVZHN3hW?=
 =?utf-8?B?S0VTZFBITlB4T0Rlb3dJQW1aYTk3dGhIdGdVdmlaa2FRSkxHejJxd1M0TmpF?=
 =?utf-8?B?MkpqOGY4Wk4zaVJFY3dTTjVjYVZQRmFJVzZFbnBPZms0QVAvc3N1MjdZR2lM?=
 =?utf-8?B?RHhuTmUzZGEyT2Flc3pWNnk2TVpjQkdxSkVnZXZpUk9lNHFVS0hyRnZLSXB5?=
 =?utf-8?B?dDN6OXVZbzJpY1RrYU9VcVp5UnQ1MCtDNUlnTm9JWmNuTEd1bzVvVitRaDVw?=
 =?utf-8?B?YjBxMndjQXh5bGpZVGhndXo0cWNJSENTY3pLQThZb2FoMzNraUhUZGZjV2sx?=
 =?utf-8?B?MWlDWXJzc3dzblpzS082bE5PSHlpWkY0S1dzSncxQWpORHVaVm45c0FHQlVP?=
 =?utf-8?B?RTA1SWE5OUZEeXllczAxc05ocS96SDRjS2xHQnRFWTVQMG9VTE1UYm9EYUhX?=
 =?utf-8?B?Rm40Q0FFZFpKNjR1KzZYSm93Y2FWbWQrWlRKRU5qcWIwWTFQNHFDOC9BOVVQ?=
 =?utf-8?B?VzYvSFhDM2dtNXAreS9hTmg0WEMwM2tjejFhWWkxa0k2QmNHVWgveUxUbWxN?=
 =?utf-8?B?Z1FVRks4UURhUEs4d1NhRmZtMUtRbEFtTDJXNEtPVlNxZTI1Ykh2MllJVFJ4?=
 =?utf-8?B?OW0zYW9hZEh6TW1tSGxFR3NHYTdoemNyQU0rbjhUZzlqOEVPZ2NEMXI2VVNs?=
 =?utf-8?B?NFFCYVRwSU14eTR6em9IY1ZtdktQNEhyUDI2YjVDUFhjbjQzSU4xdDVWQWdH?=
 =?utf-8?B?Z0o4d2FUNEkvQVArbFR5QVg0RFU3bm0xUkFsVFlTUFB4aGRiUEVJWmhOeGho?=
 =?utf-8?B?UUtMRFFkbXZCVFFvZEFnRHNBYUhCNS94RGlmaXpnSDQvVzhjSlFyNkQ1OVlM?=
 =?utf-8?B?UW0zSFVhTFNEVG5Hd01KWHhaZUpVb0dHa2tOYWlFL2txV1dWVmYrSVhyWnEy?=
 =?utf-8?B?M1dsTXl4VGhFSTh5dldVajVTVUQ0aThQaXBoZElBTmtxQTIzM0NsS1pLb0Yy?=
 =?utf-8?B?WlBTcVJKY2RQVlJqRExoWm9zcmVjaWRkRzVkMXNyZVVGN1pFQUlsMWRIOHFD?=
 =?utf-8?B?MHZqMlhBRjVIM1V1ZGp4cEFORHVHUlo3VCtHTmd1OHVNT2xIOS81bXpweURL?=
 =?utf-8?B?N082RFJvbit1cU55S2ZYcmdDOUZYOXFQQnRCWU4rYS9qWlNqT2xqVnordnl1?=
 =?utf-8?B?anAvYitGVjIvcHYrRk5lSGRybFZHaHhESnRucHRLb2ZnbzVSaWs3aVg5dGRi?=
 =?utf-8?B?YVE1d1BUM3Z6VnU2aHFCM3hXYU4xWlJWelh2YytWWXVIWlMzM2IwdXU1UDEr?=
 =?utf-8?B?eVhsWDJDZXp1RzVUYkRHTDdILzViS2s5QTFvOTBTeHdyeDB5SEROVXRSYWVx?=
 =?utf-8?B?dDhReUpnQlpMQlJqZ29uTmltSWR5NTIwSHFXN1dNWUp1ODRtRldsaGVlMElq?=
 =?utf-8?B?STBFVCs2QTliUzh2NEJlMzZ5cVdEYURsYmxFSzVhMlZsUTBrYi9uVFpaUmVi?=
 =?utf-8?B?Vk42eEQybGZVa3VzZUhYNmR4UlRJVERIbjRrRDV5ZnBSTVBKS1UzNkl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zld6dTRUWitNWk5GOU9hczVITXQ1disyQjc3dUJwNlBCU0VvSGVxVW5Ya2kv?=
 =?utf-8?B?dThtYXpzb0JZSE9FdzloaXdwUU5QS25NQVhRbnZ4aVVvTFA5TERKK21yUVB2?=
 =?utf-8?B?TzNLU2dIRzdIcDY4bU1yVE14eW16enBSaFpKbnZMVEZ5QzJmT0dwZ2w2VXov?=
 =?utf-8?B?TDZFbGd5Zy9lQ1JXVWVBNUFzYzJEREtlNnVRNVVHeCtqRjN3OVJENHhHdHBH?=
 =?utf-8?B?ZFQ3akNKVHEvZzZobzBwaW9tWXNBdGk3aFJqYXNiaVY5TXdkeUJKYzV6WElG?=
 =?utf-8?B?YlQ0RksxMUpSa25CREpaN3BtNzlLOGE4LzBOTURqb2pQcDN4aG54NWl6V3dL?=
 =?utf-8?B?RENtNG83L1orbmRqN0RTcm5lNXRGNVk2N0d0S1VTYURRbHBSeG85eCsyUEZk?=
 =?utf-8?B?NFY4aDBkb1VZdzFIL2pDbnFGc3o2MTRzNE5iU3Nickk2WitmeWNqbzY3SE5M?=
 =?utf-8?B?ZHZXMWF4N3haYk5tQVBhRjkyNjg3Szg5MDMrbUVmRWw2eUZBSEJlWVpsMG1X?=
 =?utf-8?B?NXMxNk5kUk1FMUhBdnh4TzFyL0o2eFExZEQ2UVN6c0VoRHpSSEhFRTY5SFNO?=
 =?utf-8?B?RFR6Q3pYbUl0cDVZYm5qTlI1MEZaYWk0dVdFM1VmdVdjV3BUeUNzRjFCSmMy?=
 =?utf-8?B?TXMxMDl3VExrUWJJc2dKdldxbGRscVN5T2xIKzB2ZFRCUUZKbEd1MXBOUFl6?=
 =?utf-8?B?UkRzbHhISkhRTXpaL2JvSTRZQzI5YW1sL2htQUovNjRYUW82V0lBOFFZSnM2?=
 =?utf-8?B?a2ZKSEpNNG96Nm1VaEwwRkIyY2pjS0FtZ21DM0h4VEJ3ejFNa0ZQNzlTaG54?=
 =?utf-8?B?aVFITmkydGxFZkpwZWIzZHQwM1B3MkdOTHNlc1hKTzExV1VibFBJNisySHlG?=
 =?utf-8?B?cG50R1FQTzE3K0x5eSthSjIzUjR1Si91YmJqZ2gveHBFTUJmL3QzRmdHVGVC?=
 =?utf-8?B?dmRIekFrcG1SMHo1T0NmZ0poK1FFaFhuVHRzQUNJVmhmYjZCZlRNM3RxS3pP?=
 =?utf-8?B?ZzN2Y1pnV2lCNUlDd3RJYS82UnFrUjFlVlZTWnNOek5meUpaY3hvcFJCMlkx?=
 =?utf-8?B?dGVMejFvdGM4M3lwZXM3YllYZDJWOUY0WURrQmdaY1h6dGdYc3Q1STUwRVl1?=
 =?utf-8?B?eWlBWDNMYU5SMFFEbVlCQ2JxZnBxLy9CYlo5L1JBNEJiSzY2RThoaUMvU1J3?=
 =?utf-8?B?Qm4zYlVmVUMxWEd4L0JBelBZUVFuRDNhYldXbEFrc1NUclgzVjVhNXUxRXQ3?=
 =?utf-8?B?S2I5Q1psVFc1Zi81M2ZrTGpVN3BCTGRKN2o2S3JEbjB1eWMwUFZRalZMS2gx?=
 =?utf-8?B?Y3Z4RVh3SmUxbDBiL2dxazZpdW93REtZbzhTaEtjbDRHeHhnL1NEOENKL2pJ?=
 =?utf-8?B?Zm9XV2NJR2FuNW5CeWN3bGQ3MFlmdmpQb2ZURzBheDFobFNwL0lDNXZ3WXJi?=
 =?utf-8?B?SVM1MEJ1RGdrNFpVZm9QTFEwZ0VvMUtObU1XM3pDUEs5MHBMU1YwRVpRb09M?=
 =?utf-8?B?ODlkZy9LRllrSERYRXpaR1pGb2tYM29zQjd6ZTMvc05TMU9tMy9iUit5Mzlw?=
 =?utf-8?B?azZpVXpCWVNxUTZ3VVdlam5jNU5tWHdkMFVYRm5URXl3QTlaVTJJc21VejZr?=
 =?utf-8?B?OUk3dE9QbVNMSThDcEJlOEx0L2JYQnlyNDlCTytOWFcwWnZNWktpZEkxNHlG?=
 =?utf-8?B?VjdMank1UTNlYXU5VTFYaytwaVNRbnUwdWQ2WnpHVkxIamI5UmpjZDZYRnVy?=
 =?utf-8?B?cFJmSFNzV0lHM05ITDRlZXlXSU4rQWNWQzc2TnV3MWg4VVVwVG9xUlRLZ01H?=
 =?utf-8?B?d0lLSDhtaHhIUU9aak8rdFpEcnQrV1BrUkhHK3o5OWh4Nkt6OFFUNzVTdE54?=
 =?utf-8?B?aGRxSVR0aXloZGVMQ1RobXpEVFcvaXBwTU8yaml3N0hreFROSEMvTlBpb00z?=
 =?utf-8?B?N0p2UTBXdXY5Q3JSeGM0MzdBTE85bVlPNnVIamVBWHBwTVgvTkhhUkRMUWpQ?=
 =?utf-8?B?SWQyTEdBK3hhRk1vSy9vT0lxMm83enRrbXBsWWhnTTBwQXpzYkRjK3paMDYy?=
 =?utf-8?B?SS9UQ1cxdmcwbkgzZ2czbWRiRm9mS3dlWDMzYlhYWmlMeWwydXJvK2MzVTVG?=
 =?utf-8?B?ckFsS3l3RzlGa0tYVHRsVFZnYnNFVUNIU3ZkYXV6NjNraHp5MVdjRVVneVB3?=
 =?utf-8?Q?50LaSMLdTEPRAUzi+o33G+xnHoZ7a6iyyo9v1ZD9ZNhf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fd2460-1500-4cfc-721d-08dcf506706d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:05:19.5200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0osHJEF4QTU8o0vYc0zizzp+3T9qIHZ+c8gM7dQZWnE4shuTsP5t+NvQOKeUFUf8y21ROgWrR75GxhWcYzAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
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

--------------Nti6IWrBYLG3m7fSH3iCNtfR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
The possible regressions are not related to my changes.

Thanks,
Anirban
On 25-10-2024 17:22, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe: Add tests to validate GT coarse power gating 
> status and toggle coarse power gating states (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/140473/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15594_full -> IGTPW_11981_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11981_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11981_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/index.html
>
>
>     Participating hosts (9 -> 8)
>
> Missing (1): shard-glk
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_11981_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_color@ctm-0-75:
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_color@ctm-0-75.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_color@ctm-0-75.html>
>         +1 other test skip
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11981_full that come from known 
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
>     igt@debugfs_test@basic-hwmon:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@debugfs_test@basic-hwmon.html>
>         ([i915#9318])
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@device_reset@cold-reset-bound.html>
>         ([i915#11078])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@device_reset@cold-reset-bound.html>
>         ([i915#11078])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@device_reset@cold-reset-bound.html>
>         ([i915#11078]) +1 other test skip
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html>
>         ([i915#11078])
>  *
>
>     igt@drm_fdinfo@all-busy-check-all:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@drm_fdinfo@all-busy-check-all.html>
>         ([i915#8414])
>  *
>
>     igt@drm_fdinfo@all-busy-idle-check-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@drm_fdinfo@all-busy-idle-check-all.html>
>         ([i915#8414]) +1 other test skip
>  *
>
>     igt@drm_fdinfo@virtual-busy-hang-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@drm_fdinfo@virtual-busy-hang-all.html>
>         ([i915#8414])
>  *
>
>     igt@drm_read@short-buffer-nonblock:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@drm_read@short-buffer-nonblock.html>
>         ([i915#9197]) +10 other tests skip
>  *
>
>     igt@fbdev@nullptr:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@fbdev@nullptr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@fbdev@nullptr.html>
>         ([i915#2582])
>  *
>
>     igt@gem_bad_reloc@negative-reloc-lut:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@gem_bad_reloc@negative-reloc-lut.html>
>         ([i915#3281]) +5 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc-lut.html>
>         ([i915#3281]) +6 other tests skip
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html>
>         ([i915#3555] / [i915#9323])
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html>
>         ([i915#9323])
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@gem_ccs@suspend-resume.html>
>         ([i915#9323]) +1 other test skip
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html>
>         ([i915#6335])
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12031])
>  *
>
>     igt@gem_ctx_persistence@heartbeat-stop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-stop.html>
>         ([i915#8555])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-stop.html>
>         ([i915#8555])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@hostile:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_ctx_persistence@hostile.html>
>         ([i915#11980])
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@gem_ctx_persistence@hostile.html>
>         ([i915#11980])
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@gem_ctx_persistence@hostile.html>
>         ([i915#11980])
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html>
>         ([i915#280]) +1 other test skip
>  *
>
>     igt@gem_exec_balancer@bonded-sync:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html>
>         ([i915#4771])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@gem_exec_balancer@bonded-sync.html>
>         ([i915#4771])
>  *
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_exec_balancer@bonded-true-hang.html>
>         ([i915#4812]) +1 other test skip
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html>
>         ([i915#4525]) +1 other test skip
>  *
>
>     igt@gem_exec_balancer@sliced:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_exec_balancer@sliced.html>
>         ([i915#4812])
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-tglu: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-7/igt@gem_exec_big@single.html>
>         ([i915#11713])
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@gem_exec_capture@capture-recoverable.html>
>         ([i915#6344])
>  *
>
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842]) +1 other test fail
>  *
>
>     igt@gem_exec_fair@basic-pace:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@gem_exec_fair@basic-pace.html>
>         ([i915#3539])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_exec_fair@basic-pace.html>
>         ([i915#4473] / [i915#4771]) +1 other test skip
>  *
>
>     igt@gem_exec_fair@basic-pace@vcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-1/igt@gem_exec_fair@basic-pace@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_flush@basic-uc-pro-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html>
>         ([i915#3539] / [i915#4852]) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_exec_flush@basic-uc-pro-default.html>
>         ([i915#3539] / [i915#4852]) +2 other tests skip
>  *
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html>
>         ([i915#3539]) +1 other test skip
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html>
>         ([i915#5107])
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html>
>         ([i915#3281]) +3 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-wc-noreloc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html>
>         ([i915#3281]) +5 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue.html>
>         ([i915#4537] / [i915#4812])
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         ([i915#4860])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         ([i915#4860])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         ([i915#4860])
>  *
>
>     igt@gem_lmem_swapping@basic:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_lmem_swapping@basic.html>
>         ([i915#4613])
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         ([i915#4613]) +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         ([i915#4613]) +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         ([i915#4613]) +7 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs.html>
>         ([i915#12193]) +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html>
>         ([i915#4565]) +1 other test skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-big-copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html>
>         ([i915#4077]) +8 other tests skip
>  *
>
>     igt@gem_mmap_wc@read:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@gem_mmap_wc@read.html>
>         ([i915#4083]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@gem_mmap_wc@read.html>
>         ([i915#4083]) +3 other tests skip
>  *
>
>     igt@gem_mmap_wc@write-wc-read-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@gem_mmap_wc@write-wc-read-gtt.html>
>         ([i915#4083]) +3 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@write-display:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@gem_partial_pwrite_pread@write-display.html>
>         ([i915#3282]) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-12/igt@gem_partial_pwrite_pread@write-display.html>
>         ([i915#3282]) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@gem_partial_pwrite_pread@write-display.html>
>         ([i915#3282]) +3 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         ([i915#3282]) +4 other tests skip
>  *
>
>     igt@gem_pxp@create-valid-protected-context:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@gem_pxp@create-valid-protected-context.html>
>         ([i915#4270]) +2 other tests skip
>  *
>
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         ([i915#4270]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         ([i915#4270])
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         ([i915#4270]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         ([i915#4270]) +1 other test skip
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-2:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>         ([i915#4270]) +1 other test skip
>  *
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>         ([i915#5190] / [i915#8428]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>         ([i915#8428])
>  *
>
>     igt@gem_userptr_blits@dmabuf-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         ([i915#3297]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>  *
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297])
>  *
>
>     igt@gen9_exec_parse@bb-secure:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html>
>         ([i915#2527]) +3 other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@gen9_exec_parse@bb-start-cmd.html>
>         ([i915#2527] / [i915#2856]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@unaligned-access:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@gen9_exec_parse@unaligned-access.html>
>         ([i915#2527]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@gen9_exec_parse@unaligned-access.html>
>         ([i915#2856])
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@gen9_exec_parse@valid-registers.html>
>         ([i915#2856]) +2 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html>
>         ([i915#2527] / [i915#2856]) +2 other tests skip
>  *
>
>     igt@i915_module_load@load:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-18/igt@i915_module_load@load.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@i915_module_load@load.html>
>         ([i915#6227])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@i915_module_load@load.html>
>         ([i915#6227])
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@i915_module_load@load.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@i915_module_load@load.html>
>         ([i915#6227])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@i915_module_load@load.html>
>         ([i915#6227])
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@i915_module_load@resize-bar.html>
>         ([i915#6412])
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@i915_pm_freq_api@freq-basic-api.html>
>         ([i915#8399]) +1 other test skip
>  *
>
>     igt@i915_pm_freq_api@freq-suspend@gt0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         ([i915#12455]) +1 other test incomplete
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>
>       o shard-tglu-1: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html>
>         ([i915#2681]) +4 other tests warn
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@i915_pm_rps@basic-api.html>
>         ([i915#11681] / [i915#6621])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@i915_pm_rps@basic-api.html>
>         ([i915#11681] / [i915#6621])
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>  *
>
>     igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html>
>         ([i915#4212]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html>
>         ([i915#4212]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html>
>         ([i915#4212])
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html>
>         ([i915#10991]) +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         ([i915#5286]) +3 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         ([i915#5286]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         ([i915#4538] / [i915#5286]) +5 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         ([i915#5286]) +4 other tests skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         ([i915#3638]) +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html>
>         ([i915#3638]) +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         ([i915#4538] / [i915#5190]) +4 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         ([i915#4538]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         +42 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         +6 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html>
>         ([i915#10307] / [i915#6095]) +181 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html>
>         ([i915#6095]) +133 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         ([i915#6095]) +76 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html>
>         ([i915#6095]) +19 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1.html>
>         ([i915#6095]) +44 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +64 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html>
>         ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html>
>         +38 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cdclk@mode-transition.html>
>         ([i915#3742])
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_cdclk@plane-scaling.html>
>         ([i915#3742])
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html>
>         ([i915#7828]) +9 other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_chamelium_frames@dp-crc-single.html>
>         ([i915#7828]) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_chamelium_frames@dp-crc-single.html>
>         ([i915#7828]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         ([i915#7828]) +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         ([i915#7828]) +5 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         ([i915#7828]) +3 other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7116] / [i915#9424]) +1 other test skip
>  *
>
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html>
>         ([i915#7173]) +1 other test timeout
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_content_protection@legacy.html>
>         ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_content_protection@lic-type-1.html>
>         ([i915#6944] / [i915#9424])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_content_protection@lic-type-1.html>
>         ([i915#9424])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_content_protection@lic-type-1.html>
>         ([i915#9424])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@kms_content_protection@lic-type-1.html>
>         ([i915#6944] / [i915#9424])
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_content_protection@mei-interface.html>
>         ([i915#6944] / [i915#9424]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html>
>         ([i915#3555]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x170.html>
>         ([i915#11453] / [i915#3359]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453] / [i915#3359])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453] / [i915#3359])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453] / [i915#3359])
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         ([i915#8814]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         ([i915#3555]) +5 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         ([i915#3555] / [i915#8814])
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         ([i915#11453] / [i915#3359])
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4103])
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>         ([i915#9809]) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103])
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         ([i915#4103] / [i915#4213])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         ([i915#4103])
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9723])
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         ([i915#1769] / [i915#3555] / [i915#3804])
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         ([i915#3804])
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>         ([i915#3555]) +4 other tests skip
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_dp_aux_dev.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_dp_aux_dev.html>
>         ([i915#1257])
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_dsc@dsc-with-bpc-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         ([i915#3840] / [i915#9053])
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         ([i915#3840] / [i915#9053])
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839])
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_feature_discovery@psr2.html>
>         ([i915#658])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@kms_feature_discovery@psr2.html>
>         ([i915#658])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_feature_discovery@psr2.html>
>         ([i915#658])
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         ([i915#3637]) +6 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms.html>
>         +8 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms.html>
>         ([i915#3637]) +3 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         ([i915#9934]) +2 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html>
>         ([i915#2122]) +3 other tests fail
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         ([i915#3637]) +3 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         ([i915#2122]) +5 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_flip@flip-vs-fences-interruptible.html>
>         ([i915#8381])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_flip@flip-vs-fences-interruptible.html>
>         ([i915#8381])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html>
>         ([i915#3555] / [i915#8810])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html>
>         ([i915#2672] / [i915#8813]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         ([i915#3555] / [i915#8813]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html>
>         ([i915#8810])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html>
>         ([i915#5274])
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html>
>         ([i915#5354]) +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         ([i915#6880])
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html>
>         ([i915#1825]) +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         +23 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html>
>         ([i915#8708]) +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         ([i915#5439])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         ([i915#3458]) +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         ([i915#1825]) +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html>
>         ([i915#3023]) +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         ([i915#8708]) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         ([i915#3458]) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html>
>         ([i915#5354]) +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html>
>         +83 other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_hdr@static-toggle.html>
>         ([i915#3555] / [i915#8228])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-12/igt@kms_hdr@static-toggle.html>
>         ([i915#3555] / [i915#8228])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_hdr@static-toggle.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_hdr@static-toggle.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html>
>         ([i915#10656])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@kms_joiner@basic-force-ultra-joiner.html>
>         ([i915#12394])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@kms_joiner@basic-force-ultra-joiner.html>
>         ([i915#10656])
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         ([i915#12388])
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#4816])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         ([i915#4816])
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_panel_fitting@legacy.html>
>         ([i915#6301])
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@kms_plane@pixel-format.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane@pixel-format.html>
>         ([i915#8825])
>  *
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html>
>         ([i915#7294])
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html>
>         ([i915#3555]) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_plane_lowres@tiling-yf.html>
>         ([i915#3555]) +7 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_plane_lowres@tiling-yf.html>
>         ([i915#3555] / [i915#8821])
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_plane_multiple@tiling-y.html>
>         ([i915#3555] / [i915#8806])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html>
>         ([i915#8292])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html>
>         ([i915#12247]) +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         ([i915#12247]) +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html>
>         ([i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html>
>         ([i915#8152])
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html>
>         ([i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html>
>         ([i915#8152])
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html>
>         ([i915#12247]) +7 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html>
>         ([i915#12247]) +13 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html>
>         ([i915#12247]) +5 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html>
>         ([i915#12247] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html>
>         ([i915#12247] / [i915#3555] / [i915#6953])
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html>
>         ([i915#9812])
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html>
>         ([i915#5354])
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html>
>         ([i915#9812]) +1 other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html>
>         ([i915#9340])
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         ([i915#9519]) +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([i915#9519]) +2 other tests skip
>  *
>
>     igt@kms_pm_rpm@pm-caching:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_pm_rpm@pm-caching.html>
>         ([i915#4077]) +13 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_pm_rpm@pm-caching.html>
>         ([i915#4077]) +13 other tests skip
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html>
>         ([i915#6524] / [i915#6805])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_prime@basic-crc-hybrid.html>
>         ([i915#6524])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html>
>         ([i915#6524])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html>
>         ([i915#6524])
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         ([i915#11520]) +11 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         ([i915#11520]) +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         ([i915#11520]) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         ([i915#11520]) +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html>
>         ([i915#9808]) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html>
>         ([i915#11520]) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         ([i915#12316]) +12 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html>
>         ([i915#11520]) +3 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-cursor-plane-move:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_psr@fbc-psr-cursor-plane-move.html>
>         ([i915#1072] / [i915#9732]) +15 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_psr@fbc-psr-sprite-render.html>
>         ([i915#9688]) +20 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-render.html>
>         ([i915#9732]) +9 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html>
>         ([i915#1072] / [i915#9732]) +13 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_psr@psr2-cursor-mmap-gtt.html>
>         ([i915#1072] / [i915#9732]) +17 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_psr@psr2-cursor-mmap-gtt.html>
>         ([i915#9732]) +25 other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         ([i915#9685])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         ([i915#9685])
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html>
>         ([i915#11131] / [i915#4235]) +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html>
>         ([i915#11131] / [i915#4235]) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         ([i915#5289])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         ([i915#5289]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         ([i915#5289])
>  *
>
>     igt@kms_selftest@drm_framebuffer:
>
>       o shard-tglu-1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html>
>         ([i915#12231]) +1 other test abort
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb7/igt@kms_sysfs_edid_timing.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_sysfs_edid_timing.html>
>         ([IGT#2] / [i915#6493])
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         ([i915#8623])
>  *
>
>     igt@kms_universal_plane@universal-plane-sanity:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@kms_universal_plane@universal-plane-sanity.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_universal_plane@universal-plane-sanity.html>
>         ([i915#9197]) +31 other tests skip
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_vrr@flip-basic.html>
>         ([i915#3555] / [i915#8808])
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html>
>         ([i915#9906])
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_vrr@lobf.html>
>         ([i915#11920])
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_vrr@lobf.html>
>         ([i915#11920])
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_writeback@writeback-check-output.html>
>         ([i915#2437])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_writeback@writeback-check-output.html>
>         ([i915#2437])
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html>
>         ([i915#2437] / [i915#9412])
>  *
>
>     igt@perf@mi-rpc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@perf@mi-rpc.html>
>         ([i915#2434])
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html>
>         ([i915#2433])
>  *
>
>     igt@perf_pmu@event-wait@rcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@perf_pmu@event-wait@rcs0.html>
>         +10 other tests skip
>  *
>
>     igt@perf_pmu@rc6-all-gts:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html>
>         ([i915#8516]) +1 other test skip
>  *
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@perf_pmu@rc6@other-idle-gt0.html>
>         ([i915#8516])
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@prime_vgem@basic-write.html>
>         ([i915#3708])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@prime_vgem@basic-write.html>
>         ([i915#10216] / [i915#3708])
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@prime_vgem@coherency-gtt.html>
>         ([i915#3708] / [i915#4077])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@prime_vgem@coherency-gtt.html>
>         ([i915#3708] / [i915#4077])
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@prime_vgem@fence-write-hang.html>
>         ([i915#3708])
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         ([i915#9917]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         ([i915#9917])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         ([i915#9917])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         ([i915#9917])
>  *
>
>     igt@syncobj_wait@invalid-wait-zero-handles:
>
>       o shard-tglu-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@syncobj_wait@invalid-wait-zero-handles.html>
>         ([i915#12564] / [i915#9781])
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@syncobj_wait@invalid-wait-zero-handles.html>
>         ([i915#12564] / [i915#9781])
>
>
>         Possible fixes
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-3/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#5507]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#5507]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-4/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#5507]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@device_reset@unbind-reset-rebind.html>
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@gem_ccs@suspend-resume.html>
>         ([i915#7297]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_ccs@suspend-resume.html>
>  *
>
>     igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html>
>         ([i915#12392] / [i915#7297]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html>
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-6/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12031]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@gem_ctx_engines@invalid-engines.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-14/igt@gem_eio@unwedge-stress.html>
>         ([i915#5784]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_eio@wait-10ms:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-17/igt@gem_eio@wait-10ms.html>
>         ([i915#4423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@gem_eio@wait-10ms.html>
>         +1 other test pass
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         +1 other test pass
>  *
>
>     igt@gem_exec_params@invalid-bsd1-flag-on-vebox:
>
>       o shard-mtlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-4/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html>
>         ([i915#2295]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html>
>         ([i915#3591]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html>
>         +1 other test pass
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html>
>         ([i915#12451]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip.html>
>  *
>
>     igt@kms_color@ctm-green-to-red:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_color@ctm-green-to-red.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_color@ctm-green-to-red.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         +5 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>         ([i915#2346]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         ([i915#9878]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html>
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb6/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check.html>
>         ([i915#11989] / [i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check.html>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-edp1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html>
>         ([i915#3555]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html>
>         ([i915#5354]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html>
>         +3 other tests pass
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html>
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#8292]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html>
>  *
>
>     igt@kms_plane_scaling@invalid-parameters:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@invalid-parameters.html>
>         ([i915#8152] / [i915#9423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-5/igt@kms_plane_scaling@invalid-parameters.html>
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html>
>         ([i915#12247]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html>
>         ([i915#12247] / [i915#8152]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html>
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html>
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>  *
>
>     igt@kms_properties@plane-properties-atomic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html>
>         ([i915#11521]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_properties@plane-properties-atomic.html>
>  *
>
>     igt@kms_vblank@ts-continuation-modeset:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html>
>         ([i915#9197]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html>
>         +14 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@gem_exec_capture@capture:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-7/igt@gem_exec_capture@capture.html>
>         ([i915#11965]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@gem_exec_capture@capture.html>
>         ([i915#11965] / [i915#12558]) +1 other test fail
>  *
>
>     igt@gem_exec_capture@capture@vecs0-lmem0:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html>
>         ([i915#11965]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lmem0.html>
>         ([i915#11965] / [i915#12558]) +2 other tests fail
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html>
>         ([i915#11965]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html>
>         ([i915#11965] / [i915#12558]) +2 other tests fail
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         ([i915#9197]) +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>         ([i915#4538] / [i915#5190]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>         ([i915#5190] / [i915#9197]) +6 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         ([i915#5190] / [i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         ([i915#5190]) +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html>
>         ([i915#5190] / [i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html>
>         ([i915#4538] / [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html>
>         ([i915#10307] / [i915#6095]) +5 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html>
>         ([i915#10307] / [i915#6095]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html>
>         ([i915#9197]) +7 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd.html>
>         ([i915#4423] / [i915#7828]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd.html>
>         ([i915#7828])
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-7/igt@kms_color@deep-color.html>
>         ([i915#3555]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_color@deep-color.html>
>         ([i915#5354])
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7118] / [i915#9424]) -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7173])
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_content_protection@mei-interface.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424])
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-5/igt@kms_content_protection@mei-interface.html>
>         ([i915#8063]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424])
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-15/igt@kms_content_protection@mei-interface.html>
>         ([i915#9433]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424])
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_content_protection@srm.html>
>         ([i915#9197]) -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_content_protection@srm.html>
>         ([i915#7173])
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb4/igt@kms_content_protection@type1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb4/igt@kms_content_protection@type1.html>
>         ([i915#8816])
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_content_protection@uevent.html>
>         ([i915#1339] / [i915#7173]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_content_protection@uevent.html>
>         ([i915#7118] / [i915#9424])
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@kms_cursor_crc@cursor-random-max-size.html>
>         ([i915#3555]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_cursor_crc@cursor-random-max-size.html>
>         ([i915#9197])
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         ([i915#11453] / [i915#3359]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         ([i915#5354]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         ([i915#9197]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         ([i915#5354])
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         ([i915#4103] / [i915#4213])
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9833]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9197])
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-7/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_dsc@dsc-basic.html>
>         ([i915#9197])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-dg2: [SKIP][452] ([i915#2672] / [i915#3555] /
>         [i915#5190]) -> [SKIP][453] ([i915#3555] / [i915#5190])
>         [452
>

--------------Nti6IWrBYLG3m7fSH3iCNtfR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    The possible regressions are not related to my changes.<br>
    <br>
    Thanks,<br>
    Anirban<br>
    <div class="moz-cite-prefix">On 25-10-2024 17:22, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172985716032.1331322.15675395718827361356@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe: Add tests to validate GT coarse power gating
              status and toggle coarse power gating states (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/140473/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140473/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15594_full -&gt;
        IGTPW_11981_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11981_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11981_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/index.html</a></p>
      <h2>Participating hosts (9 -&gt; 8)</h2>
      <p>Missing (1): shard-glk </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11981_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_color@ctm-0-75:
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_color@ctm-0-75.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_color@ctm-0-75.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11981_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> ([i915#9318])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> ([i915#11078]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@all-busy-check-all:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@drm_fdinfo@all-busy-check-all.html" moz-do-not-send="true">SKIP</a> ([i915#8414])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@drm_fdinfo@all-busy-idle-check-all.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-hang-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@drm_fdinfo@virtual-busy-hang-all.html" moz-do-not-send="true">SKIP</a> ([i915#8414])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_read@short-buffer-nonblock:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@drm_read@short-buffer-nonblock.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@fbdev@nullptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@fbdev@nullptr.html" moz-do-not-send="true">SKIP</a> ([i915#2582])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_bad_reloc@negative-reloc-lut:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@gem_bad_reloc@negative-reloc-lut.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +5 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc-lut.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">SKIP</a> ([i915#9323]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html" moz-do-not-send="true">SKIP</a> ([i915#6335])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">FAIL</a> ([i915#12031])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-stop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-stop.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-stop.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hostile:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_ctx_persistence@hostile.html" moz-do-not-send="true">FAIL</a> ([i915#11980])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@gem_ctx_persistence@hostile.html" moz-do-not-send="true">FAIL</a> ([i915#11980])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@gem_ctx_persistence@hostile.html" moz-do-not-send="true">FAIL</a> ([i915#11980])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-args:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html" moz-do-not-send="true">SKIP</a> ([i915#280]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-sync:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html" moz-do-not-send="true">SKIP</a> ([i915#4771])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@gem_exec_balancer@bonded-sync.html" moz-do-not-send="true">SKIP</a> ([i915#4771])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-true-hang:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_exec_balancer@bonded-true-hang.html" moz-do-not-send="true">SKIP</a> ([i915#4812]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-contexts:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html" moz-do-not-send="true">SKIP</a> ([i915#4525]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@sliced:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_exec_balancer@sliced.html" moz-do-not-send="true">SKIP</a> ([i915#4812])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_big@single:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-7/igt@gem_exec_big@single.html" moz-do-not-send="true">ABORT</a> ([i915#11713])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@gem_exec_capture@capture-recoverable.html" moz-do-not-send="true">SKIP</a> ([i915#6344])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@gem_exec_fair@basic-none-rrul@rcs0.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@gem_exec_fair@basic-pace.html" moz-do-not-send="true">SKIP</a> ([i915#3539])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_exec_fair@basic-pace.html" moz-do-not-send="true">SKIP</a> ([i915#4473] /
              [i915#4771]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-1/igt@gem_exec_fair@basic-pace@vcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@gem_exec_fair@basic-pace@vcs0.html" moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-pro-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +2 other tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_exec_flush@basic-uc-pro-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-set-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html" moz-do-not-send="true">SKIP</a> ([i915#5107])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-threaded-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-threaded-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-threaded-none.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@basic:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_lmem_swapping@basic.html" moz-do-not-send="true">SKIP</a> ([i915#4613])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12193]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> ([i915#4565]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@read:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@gem_mmap_wc@read.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@gem_mmap_wc@read.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@gem_mmap_wc@write-wc-read-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@write-display:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@gem_partial_pwrite_pread@write-display.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +2 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-12/igt@gem_partial_pwrite_pread@write-display.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +3 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@gem_partial_pwrite_pread@write-display.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-valid-protected-context:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@gem_pxp@create-valid-protected-context.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 other
              test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> ([i915#4270])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@gem_pxp@reject-modify-context-protection-off-2.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#8428]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8428])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@relocations:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-overlap:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@gem_userptr_blits@unsync-overlap.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@gem_userptr_blits@unsync-overlap.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-secure:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@gen9_exec_parse@bb-start-cmd.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@unaligned-access:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@gen9_exec_parse@unaligned-access.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@gen9_exec_parse@unaligned-access.html" moz-do-not-send="true">SKIP</a> ([i915#2856])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@valid-registers:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> ([i915#2856]) +2 other
              tests skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@load:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-18/igt@i915_module_load@load.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@i915_module_load@load.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@i915_module_load@load.html" moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">SKIP</a> ([i915#6412])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> ([i915#8399]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#12455]) +1
              other test incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html" moz-do-not-send="true">WARN</a> ([i915#2681]) +4 other
              tests warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> ([i915#11681] /
              [i915#6621])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> ([i915#11681] /
              [i915#6621])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> ([i915#6245])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> ([i915#6245])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#10991]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +3 other
              tests skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5286]) +5 other tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +4 other tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#4538]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> +42 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +181 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +133 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +76 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +44 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +64 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#10434] / [i915#6095]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> +38 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> ([i915#3742])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> ([i915#3742])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +3 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#7116] /
              [i915#9424]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html" moz-do-not-send="true">TIMEOUT</a> ([i915#7173]) +1
              other test timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_content_protection@legacy.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#7116] / [i915#7118] / [i915#9424]) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#11453] /
              [i915#3359]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453] /
              [i915#3359])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453] /
              [i915#3359])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453] /
              [i915#3359])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html" moz-do-not-send="true">SKIP</a> ([i915#8814]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +5 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8814])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453] /
              [i915#3359])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#9809]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555] / [i915#3804])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#3804])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_dp_aux_dev.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> ([i915#1257])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840] /
              [i915#9053])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840] /
              [i915#9053])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> +8 other tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +5 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_flip@flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_flip@flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8810])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#8813]) +4 other tests skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#8813]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#5190])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8813]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#8810])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send="true">SKIP</a> ([i915#5274])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">FAIL</a> ([i915#6880])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +23 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> ([i915#5439])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#3023]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-rte.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +83 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-12/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12394])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12388])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> ([i915#4816])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> ([i915#4816])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-8/igt@kms_panel_fitting@legacy.html" moz-do-not-send="true">SKIP</a> ([i915#6301])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@kms_plane@pixel-format.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane@pixel-format.html" moz-do-not-send="true">SKIP</a> ([i915#8825])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html" moz-do-not-send="true">SKIP</a> ([i915#7294])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +7 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_plane_lowres@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8821])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_plane_multiple@tiling-y.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8806])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html" moz-do-not-send="true">FAIL</a> ([i915#8292])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html" moz-do-not-send="true">SKIP</a> ([i915#8152] /
              [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">SKIP</a> ([i915#8152] /
              [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953] / [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555] / [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html" moz-do-not-send="true">SKIP</a> ([i915#9812])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> ([i915#5354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#9812]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9340])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pm-caching:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_pm_rpm@pm-caching.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +13 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_pm_rpm@pm-caching.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524] /
              [i915#6805])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +2 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#9808]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#12316]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_psr@fbc-psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +15 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-render:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_psr@fbc-psr-sprite-render.html" moz-do-not-send="true">SKIP</a> ([i915#9688]) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-render:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-render.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +13 other tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@kms_psr@psr2-cursor-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +17 other tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@kms_psr@psr2-cursor-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html" moz-do-not-send="true">SKIP</a> ([i915#11131] /
              [i915#4235]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> ([i915#11131] /
              [i915#4235]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> ([i915#5289]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_selftest@drm_framebuffer:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html" moz-do-not-send="true">ABORT</a> ([i915#12231]) +1 other
              test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb7/igt@kms_sysfs_edid_timing.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_sysfs_edid_timing.html" moz-do-not-send="true">FAIL</a> ([IGT#2] / [i915#6493])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-sanity:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-1/igt@kms_universal_plane@universal-plane-sanity.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_universal_plane@universal-plane-sanity.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-5/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8808])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> ([i915#11920])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> ([i915#11920])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@mi-rpc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@perf@mi-rpc.html" moz-do-not-send="true">SKIP</a> ([i915#2434])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> ([i915#2433])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@event-wait@rcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@perf_pmu@event-wait@rcs0.html" moz-do-not-send="true">SKIP</a> +10 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-all-gts:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html" moz-do-not-send="true">SKIP</a> ([i915#8516]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@other-idle-gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@perf_pmu@rc6@other-idle-gt0.html" moz-do-not-send="true">SKIP</a> ([i915#8516])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@prime_vgem@basic-write.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@prime_vgem@basic-write.html" moz-do-not-send="true">SKIP</a> ([i915#10216] /
              [i915#3708])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#3708] /
              [i915#4077])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-14/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#3708] /
              [i915#4077])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> ([i915#9917]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> ([i915#9917])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> ([i915#9917])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-19/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> ([i915#9917])</li>
          </ul>
        </li>
        <li>
          <p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-1/igt@syncobj_wait@invalid-wait-zero-handles.html" moz-do-not-send="true">FAIL</a> ([i915#12564] /
              [i915#9781])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-17/igt@syncobj_wait@invalid-wait-zero-handles.html" moz-do-not-send="true">FAIL</a> ([i915#12564] /
              [i915#9781])</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-3/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a> ([i915#5507]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a> ([i915#5507]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-4/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a> ([i915#5507]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-2/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#7297])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#12392] /
              [i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-11/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-6/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">FAIL</a> ([i915#12031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-1/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-14/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-13/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@wait-10ms:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-17/igt@gem_eio@wait-10ms.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@gem_eio@wait-10ms.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@invalid-bsd1-flag-on-vebox:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-4/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#2295])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-3/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html" moz-do-not-send="true">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> ([i915#12451]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_color@ctm-green-to-red.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_color@ctm-green-to-red.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" moz-do-not-send="true">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#9878])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb6/igt@kms_flip@2x-wf_vblank-ts-check.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">FAIL</a> ([i915#11989] /
              [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-tglu-2/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">FAIL</a> ([i915#8292]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@invalid-parameters:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#8152] /
              [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-5/igt@kms_plane_scaling@invalid-parameters.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-atomic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#11521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_properties@plane-properties-atomic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html" moz-do-not-send="true">PASS</a> +14 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@gem_exec_capture@capture:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-mtlp-7/igt@gem_exec_capture@capture.html" moz-do-not-send="true">FAIL</a> ([i915#11965]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-mtlp-4/igt@gem_exec_capture@capture.html" moz-do-not-send="true">FAIL</a> ([i915#11965] /
              [i915#12558]) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html" moz-do-not-send="true">FAIL</a> ([i915#11965]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lmem0.html" moz-do-not-send="true">FAIL</a> ([i915#11965] /
              [i915#12558]) +2 other tests fail</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html" moz-do-not-send="true">FAIL</a> ([i915#11965]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html" moz-do-not-send="true">FAIL</a> ([i915#11965] /
              [i915#12558]) +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#9197]) +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> ([i915#5190]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> ([i915#4423] /
              [i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> ([i915#7828])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-7/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> ([i915#5354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">TIMEOUT</a> ([i915#7173])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-rkl-5/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#8063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-rkl-2/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg1-15/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg1-16/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-10/igt@kms_content_protection@srm.html" moz-do-not-send="true">TIMEOUT</a> ([i915#7173])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-snb4/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-snb4/igt@kms_content_protection@type1.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#8816])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-10/igt@kms_content_protection@uevent.html" moz-do-not-send="true">FAIL</a> ([i915#1339] /
              [i915#7173]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-11/igt@kms_cursor_crc@cursor-random-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_cursor_crc@cursor-random-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#9197])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#11453] /
              [i915#3359]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#5354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9833]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9197])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15594/shard-dg2-7/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11981/shard-dg2-2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#9197])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
          <ul>
            <li>shard-dg2: [SKIP][452] ([i915#2672] / [i915#3555] /
              [i915#5190]) -&gt; [SKIP][453] ([i915#3555] / [i915#5190])<br>
              [452</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
  </body>
</html>

--------------Nti6IWrBYLG3m7fSH3iCNtfR--
