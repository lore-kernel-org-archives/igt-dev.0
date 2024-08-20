Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45694C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 04:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0510E4A4;
	Tue, 20 Aug 2024 04:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgEI3CdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878510E4A4
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 04:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724129081; x=1755665081;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9WzaQMjQT89bFxwaUYSfCRN0OtRdWUwehcevfMXdyRE=;
 b=PgEI3CdSijArJEFaerLgleaavfMsxiCdr+4sBGPQvN9LSD1RJOsnXdnx
 BeTkYxPWGyJNVWWCq1VLjTjZL6QMtIjliq+izJ7XXIus+4Z/AgOp73ec7
 pe/j92pQHUeXk6OpcSB1uH/dlWWBRIsttrNunh7DGYKrZOxeMoBbRGXoH
 wWhkBv05qL1CdkVn4+Pn3QoQfasuaiJ1YSK4Uf5vdCmyJkfP900kdgxJz
 zzv4r2q+bjuQXsM9UP3QAlgHoNOKO/FiZF642QpAYnz911V4/66DnGH/O
 0vrloEGp+q1cpIGBtb7anjUu+1bPgRBdp5msiT9JyVe+SOWIYrHu9luWB A==;
X-CSE-ConnectionGUID: k+lhKPBGT3+/D5n5HCW9bQ==
X-CSE-MsgGUID: e4l76n+tTkCRkRC4eMyW9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22548872"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22548872"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 21:44:33 -0700
X-CSE-ConnectionGUID: Ckx9cTCjSTawdszvGONY5g==
X-CSE-MsgGUID: rIsRQS21TpyJJL20RC36dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="64969663"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 21:44:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 21:44:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 21:44:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 21:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaAHVqou52me0xGXTDNTAUoHrxSC0d8HgRBc3isv5t9sXDePCBv1IZ+qzCYeNytgz6I5Ol5fezEHla+zIKl17nXmxLJtxCdoZFGCWKq+xEdo8V1xHfAHkWkR987C313VpVFC+BO5IQipmWssPgQt4lhXtTu6KAWD1Z75TMVaMTYGB3PYgdGJUVh1MJLl/13GKetHHAAIMlaG6oweFZqVUXcvlXHFG5zq2al82uZ9dEEWsbFSSxOjoIVGE8XF0fL1u8BOk3WHOFH7IirRupgfBR2dyMUsJthYQDcAAIIZq5kJYPl4HUcHEb7jL+i0+ojgIe6cbNcVMVq+o3xD9jc0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3He70ImSdHsYe9b9Pfl9t7xvGY4T3qmp1lXpcwulzPk=;
 b=DdcLeTB942rsMqbH5BmiDR4qLlmCf6UCPfa3vI73Zko6zCGKRBKnzLzMjW0vWYXo8KeUyoBJ8+VFr/l6bwMAXYiRO6WChKv/opVL5ciwH7tfbSvVlelEmJF8gFlKLBUIfBBg+jzdEff8EMJwduZZuNXZubVYbKgZRRMxGCNRpQWDaxWhuKiYsnSY7aBUbbRASuFwdZBmxLTxDwtLDYlc01KZ/uSwn95kswN2dz063cAk47m2KdN51D/Xo8SknK5DBWyLkykIPyaC1mnX8mmiBuO5hGTWkBef7qraaeqqSeT508W+9WBYa+t16T1GQVFe3NmkTZTPt3yW903bzC/wQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 04:44:26 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 04:44:26 +0000
Message-ID: <27ed63e0-7265-482e-b16b-b02428dee72f@intel.com>
Date: Tue, 20 Aug 2024 10:14:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 11/12] tests/intel/kms_dp_fallback: add test for
 validating fallback
To: <igt-dev@lists.freedesktop.org>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
 <20240819092615.3669803-12-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240819092615.3669803-12-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 91557bab-f238-4d04-c4b3-08dcc0d2c4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0RINWJKQ3hiQTV4TjZ1UWErYjJTNEFibjg0UXJQRlpLdDFhTUtWTFRhN0hP?=
 =?utf-8?B?RlRZUFJoc1lkdFZjRHhKT2U1MTdlZEs2KzlPb0V2dTNNSm9hQUJ0cFhoUWFW?=
 =?utf-8?B?ekpiVnZpK0g3d1JkUVZtdFozSXFuVEJxVGZRc09maDZFMnhtTFBxNUtOSWdE?=
 =?utf-8?B?bmNxMDBFSUQyR09IejA1SjVqOTFyQm9PTGg4TFhtand6R2Exd2o1SWoyWlRP?=
 =?utf-8?B?ZUlIY09rcFN5ZVhVOURWeDNXQnNZWk9ZZ1htWS95RzBGWGcwN1l0cE13dFlt?=
 =?utf-8?B?S2VnYkFrOEQ3OVhKcjcvNTFkOTE2bnIvN3NvemJIQ0xOWWJJak9UcUtsVzlh?=
 =?utf-8?B?ejNvb2NvSDU3QldGVHdGMDM5N0Jla1JmZTZ3VytIbTU1U2NYOEZKV04rY002?=
 =?utf-8?B?bkVZbzBKekFmOEp3cTc1NGZvdUhDM2Z6T2pvQWhtM1h4ZktiZmdiSXNiSDdO?=
 =?utf-8?B?UXN4bmEwaVJFMzUxOVY1b25ja2QwcS8vUDhCYWpWaUNKWXBVaTJVcHg5NzZq?=
 =?utf-8?B?bDA1dHBZVEtNQytTNnNGYTcxbTZFTVZOOG1MN3FmVUhEQVEzOHpFREorTnFv?=
 =?utf-8?B?SEhDUVkvZEkzT0IyTHRvM2ZFSUlTT0VLYjhaRzh0UjJWazNydExnRGdHaVdt?=
 =?utf-8?B?WVJIVjVBdmhXeWU2WmRRNUJQZUc3YW4zbFFFazg4cElBK2JPbDFCSUlRZmlr?=
 =?utf-8?B?bDAxQTRuVmlMcGg3anJwWFk4cTJPb3BNd2JDd010VUxWSnZBZ2lxRWtKczZU?=
 =?utf-8?B?TGRyb3kzcFVVdDg5RGZidWZzUUVqMURPWlBBeWFrbk80V2JtQk5tM1hUdlRU?=
 =?utf-8?B?dDhQd1B6OFc3dm9WSWVINjc0djRnSkc0TW9CdzF0N3hDMU8xR3dweHp1Ylhl?=
 =?utf-8?B?d0tWVzI0RGxSOXR0dGhCYkRTYXBkMS9WakIzNVkwWElGR2FXNzZXVzJZOWRW?=
 =?utf-8?B?YUVaWitTa0EwcUdDam1DSkFKN244MXBwTTVMb0FDZGpxakNNRUlveU9CKzYx?=
 =?utf-8?B?NEVLbGs5ZTk3MklydmFqa0VncWdFeis2QkNsNW1Ndk1veFRXUUF6VmhLWEVN?=
 =?utf-8?B?TW1jMlZPMEMyVkYyS2NyMk5GVTlYL2hkYnZ2c0VEMk1iV3FaVGhnaEY5OXpG?=
 =?utf-8?B?SDhtK2ZGK2RRSnA5emIxNVJ0enJ0Qy84eVcyZ2FoZUVCdjRNM2F6N0lYRE1O?=
 =?utf-8?B?elpxSnVlZXRVamhETDVybXI4SVBxdExrTUdhWXhlS2lsVHhTcXdMVEJ4Vlky?=
 =?utf-8?B?dGdEdVJ1dGwvMUtZUURqMENUZGtpM2JrWER6WDA2TWZERW5BdUF1UnRYaEtM?=
 =?utf-8?B?dWFCZzRnUHRmRFdFMVg1TWNMV3BpOVlpVFVvQk8vU0MrcnJRcWFOVnJaRVlL?=
 =?utf-8?B?blEvcmZ5SnRxcFliVnl5Y1RBdUo4U0EyOWtmYTJkRDJ1TlFKblgwdlpZMnQ4?=
 =?utf-8?B?RC9oNHE4OENkQWtXcElqYTNDTVZPcUJuYjFRcS9HS282THF6Rmxxa1RuUEVz?=
 =?utf-8?B?Q3VMWFQ0b05wc3dMVXg3eTRCNHpxR1BodzVSUXovRFlyT0FPTGVuRVlSWlY3?=
 =?utf-8?B?YXhsT3JoVHp4NHBpa0pOVkNDODZZcEFnTmNBYTVlQTF0R1dueWdrYmowc0I2?=
 =?utf-8?B?b3FFMytNSVVHdHRPSWdpSHZZOGxrblF2SnliVzJJN2NMYlVleXpkWU55NnA0?=
 =?utf-8?B?Ly9UbHp5VUNCaDM2WDBQVUliWjZ6QmZIVHVFK2tqcldQU1U1eXViNkthV25K?=
 =?utf-8?B?SEZiMHh6ckc0Y1JwTEYvcmZEV3JvY3NnSWFGSFB6U3ZBRnFXcnE5bHBIVmFs?=
 =?utf-8?B?RmxPRUVqcEdmcGwzR2FvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpqQVZ2T1V1Nm90UldTMmlIQ3J4Vk16MXV2SXlMZTV6R2NHQmVjR3JISVlX?=
 =?utf-8?B?aEVzV2FCeU9IaVB1NTc4c21zQmNqWjlyMGJIYjFTRDRLVmJibXlHY3ZhUmRI?=
 =?utf-8?B?THhLSjViakdFaHVkSW9pM2NNVXlReGJHRTJaemhUeEREZFZGeDE3alVsRHBJ?=
 =?utf-8?B?S0FrOUswMExrV2w1eU9sOXQydk1xSzVCTnBORHRpRUlnc1kzVkhPbGlNaUdP?=
 =?utf-8?B?MXEyK1oxUGlqVFEzYXNIRWdjZzBJUGNaeUVSOC8zZnNTK0dUdHBSK2xJUWs0?=
 =?utf-8?B?NGE5VjZQSUlac2lzTUZmOXRabW9MOU9jelZ5RjR4UWtlTUY0SkhsSUgwbmZ4?=
 =?utf-8?B?NjdhVm96WHpOSmowM2t3cmNublhuVG5ZV0hVN3dXSHk2aytIUUFvcmIyUWFB?=
 =?utf-8?B?dTlXUHFNemc3UVluSFhhZWIvVjZMNFNoMWNsU3djajFYbTRlY29BbzVsQ1RH?=
 =?utf-8?B?eG9EZnRQeFpBS0hqQjBmUThybzhFeG5NdG5nZVlIait0WThSeE9RdllIOWJ1?=
 =?utf-8?B?UzVER1prZkxxVitwblVlUkVEVGF4ZVpCUWVuZS9LWkRHY0tBNEJNcmR2Zm8y?=
 =?utf-8?B?M1ZlOHhLRi9BNzdINkJRb0NGeTFMakQ3Z2QxNmUrbHQ5enovdGphZ1FOdnVJ?=
 =?utf-8?B?MW05Tkhrakx0eUtiamUzb05OcEQ2bFRaZDBvc2R1QlZwczVEaDdWL0ZUWEky?=
 =?utf-8?B?amxLaVdNZzNPTHYyR2Z1c0YvYmRiZjdDUkJ3Y3RjRGNRM0RrOU9TKzV1NWFM?=
 =?utf-8?B?SHU1ZmZkU2wxQk0wQlVYa3RVc2wyQUNrVndJK09kT3RkWXQ2VFcwQ1NORFc0?=
 =?utf-8?B?bHVUWUxqTTJKeGppcjVNT0luR1ZYb1hoN1dpZ0Fpb1lmZVNjSGxZbm92Wllm?=
 =?utf-8?B?L01zODdycGtSeUZyZE1qY3h6cjYydkVmZk12MkJDZGZYOE1EWWoyN2hMYnJj?=
 =?utf-8?B?YUQyQU8wRFBtRXZkQjFMZ1AwblNmMDJmSlB0dDBNSGtMU08rbWZpTkNFSlB1?=
 =?utf-8?B?a1o2Z0xESUIzQmV2SU41M05yTVlWaGVGYkkrRG5zd0FiV0hIUW45RkVWdXZs?=
 =?utf-8?B?bnFRNmxwOGU1aHI3bHVWU1NlL1lKMmdMSnphVDdYenkxYlREdDNib0JQLzBl?=
 =?utf-8?B?N1ZBYnA0N1M2THNuczlYZktYRlVUT1M2MHJneFRvVlpoc1dwWmhTTGNTQ1da?=
 =?utf-8?B?dmY4RUZEbVlGQklGSU02RjFVaXY0ZGk1OStNblFGR3NBSU1IU0k5Tmt6a2JW?=
 =?utf-8?B?dEdCU3lHMTVTTG9ERVQ4VUE0V3RYZHB2UnBkUnpPVzFLMnBhN0MvRnFhTnhP?=
 =?utf-8?B?U2xRQXNveXBoNHAzVEsvSS9rbXFzeVE1TTczaG5TVzhEQlVnbWdlV25LeElC?=
 =?utf-8?B?bzI5WXM2S0YwaGZ4ZTJNc2lkSEdQbERoMENyWm5qYWpoNlBQQXhNY2tSQ3N4?=
 =?utf-8?B?NzFkUmdTWG05M1BNRTNMbFVIVFlHNFVJR0hFSUN1OUJSQnhLM2Y4Y1YzaEVy?=
 =?utf-8?B?L0ZQN3czWWUwelFwMHVCajFhNmtyaCtiSnkySmhrdlF2Z2xjSUxoQVlwWjFx?=
 =?utf-8?B?TXJPRXg0elRVNFQvcElCc2cvaXkwcjJNNU8xblg5L3NUWmdMaWR1bis2Mjlp?=
 =?utf-8?B?OVg2eVNKRjkyb1ovL2owdjBJV1ZLcTNGL0JnWVhnUk16bURnN0drOGFGRWtB?=
 =?utf-8?B?dEUzQmQ2dEZoWm1lN1VqdjhwNjUxdnhVb21odzVuRHpLazMyUndoVWo4UUdT?=
 =?utf-8?B?TlByZWVCT3lmc1J2MVpCK3V0RHkybWtIZEpVOUVvYmVvd0liaHNGYlB2MkQw?=
 =?utf-8?B?MnBRdklreFQ5UTUzTS9Ya0F3amJ1T0ErK0ZpWkg4WG9LOXlBRjFGZUFBUDhF?=
 =?utf-8?B?MldLSFdoZjVzb0xPaEt1aStmdlg3eUJuNmIwL08yUDhwb0k4bFd0dVlQYkVC?=
 =?utf-8?B?RzZId1VzYVdlZWEvZW1tNUc3SGZDSWFNTUNOcEJxRldLWGdwQUNHR1p5aGdl?=
 =?utf-8?B?Rm1Nd3RMVmFFc3JwbnF4dWRpV0ZuNHV0Rm5aQ0lzNFVUelIrQU0rUUp3Y2JT?=
 =?utf-8?B?VzczVitSU21mSjEvNEd6KzNVWDIzQ2gzSzlNbDhlM1dTUHRLVU5lbGZWOTg3?=
 =?utf-8?B?c3c4QlpnbG9aZlU5RTRwVk5rcHdBNll4MHRMeTc2ckcyWkJ0TEE4QWp0Ykx0?=
 =?utf-8?Q?341+DgqI5sbiSYpkdjc18H4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91557bab-f238-4d04-c4b3-08dcc0d2c4e4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 04:44:26.2738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XovUE6wPiZRbZtBfFpCRlC0dsYr6jdVdu8Jf+DVmtScBpIXJKNdPPU7vj7C5JkbYDhdEVC5dyiHdIpP5GeIbFj6EL6qOIwv+0yM3tDZk8Hwpgfc7Nt3AmXyjubKGc31e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

Hi Kunal,

Dp we need to call check_fn(); here.

Thanks,
Santhosh

On 19-08-2024 14:56, Kunal Joshi wrote:
> +		if (igt_get_dp_pending_retrain(drm_fd, output) == 0) {
> +			return 0;
> +		}
