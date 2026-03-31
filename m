Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1233E109B48D
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 15:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B0910EA67;
	Tue, 31 Mar 2026 15:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frWxT6RP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1910E14B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774970275; x=1806506275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MJnv5rGL3g2snbFew9pbDoqr2xDvhkRRpqLAfxN0v3k=;
 b=frWxT6RPwwQrhfJkgbXlZKW3S5TOw63Lfu0KOXdb4J+DRE4GF+A9peEM
 WbfRnGD/ZfTEBWNj2poBQnVMIx0td9dUTWRt9OdTHInbRo5rWmaMUipoN
 SHh3w9fwaWpL/UU+7gl0QYn/q/D+zXyvE96Y7fqIT+GNWVcPVFBJdm4FP
 1TMNZxuarVF/EhHhuiF6A7cSRnKvnGdfwFJ79S4ir9P03RTJmouCSdsp0
 6OVmFyZZB4tlSqp6upxVs+qmdcK3k9lXkTw0t5+l40gQV71cGYMA4xsWA
 Zk1Wy9OXeujTZm7QG+LZywyVQbY/r/dJ8IdHIcDzap34ISd+nN188C7ee A==;
X-CSE-ConnectionGUID: z3nonXXlS/2iDq/Hlr9Lyg==
X-CSE-MsgGUID: RP9edOFlSpeavmKkz0SxPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75881435"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75881435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:17:47 -0700
X-CSE-ConnectionGUID: 34snekkGQ2uBiO7ZAzMZkA==
X-CSE-MsgGUID: 8ybkc7naQ8OzBT6rzTlwVA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:17:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 08:17:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 08:17:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 08:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6J7q0pr8eUAyxy+/33X0+4Clsv0MFg36Wyj/s1sut7OrDFiL6DFSegklvpgjV+LNmO+aXzfy7l3/WbElBCcNWrplOR2+7Jgc5eGOF4osPTujIwtkaRcXj7nzae2GY3nMJZnt9HoklV2gw2hp3YgNQi4aYUQmymhZsMaTJ6cRgQyrRKYYsXcs1tJ+BEpv4SBVn3Kx1gOrnfdSIdddWo3PCrYYF7mlV8HJb7VQVz95+CoN/VMisWnmJKFvAUNMiXFHVYlc424m9yNtQ+ItWfr88MhlCU1JLp3lt3EnKkbuaRgNKU8hAePCIUpLIAUIcQCN5Zx3uwVenMU117OE9B+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Sy5M8XyJLLQdQCVhTjA819KGBz3/QzOB64l1QRQjgo=;
 b=Sq3QrEUi902w/Bi8geoeXEZgV0XxeRUBrfdmIVh39xsKac9N8LwOTTd42+tX7FS66SS2peBv8YAKfeZUHuwhFR3eRIxhKXIyuZ8KmLKG08x0trk9R7Ix/Lv9lx2gkfCTeq/o5qr3f2xzrUsk/alxNvQc+StN5CYTvK2FE/lh744LaaktbYYkh9Gt1c9pwtwX6s1iJtxSDYrbzUoKL4hUMgkLTOZ+1Tuk2KOw3fVs8Mwy5rxI1bPZb3v2kwxatS1S0x67rZqVrSzgnGuy1fBvugqAVbY+ixcItJgKQMW5uwe9PStMkpTfVlLFSY78FYZYXywWFGClGoFKYNtmEqMOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 15:17:37 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 15:17:36 +0000
Message-ID: <ad876245-f202-4d2e-81a1-b57f6059c2fd@intel.com>
Date: Tue, 31 Mar 2026 20:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] tests/intel/xe_vm: Test
 DRM_IOCTL_XE_VM_GET_PROPERTY fault reporting
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
 <20260325212208.85743-10-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325212208.85743-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: baf2bf6d-37c0-4cd0-1045-08de8f38a3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: dMXK1db7wfTtwhXm6OkWIfun8hu4rBJB1lvsV3U3lAsVoNAFiTwVxLuxwLtKUCBpc9RIFWp8o5bRZ0uwDRbxpwSC4GjwuljV8LWWC1MdenGeyaUUVfLkD3Sg+qwcmUQwQXrPZ4ZpOl/hDH863WMazDavxC8E9T2RL1+pf5OFj4WomZe05d/akYieZKxPc6kCKhpVYzOv846tJzVC5gHG+AzmrMHelKzjLjW3CvcJz+ZO26F8YAZsNDPUuHnRO/60xpLA6t4sHEdCfO2GoHebZwI48g2UTgnkAlGDWsqMdcAVUqFO2y9dbpWVpf63t8GSys/SXxMVOV27a1W4/e8ppNW7/2TjsE5/SSkD/3dxaNEb8EH7LMJxgGSmiG68fzc3Hotd/6YC9CZGIMlwTXKpjRHvrbrO2aZTKlDalYAuAO3CswqlajSV2vtYD47Icb+/nWou0WNBpLqrkvfe67bwIuT/A60EiCA6eZ6ANg2FJQZxKuKiVvw9qSqorvnKU0wDJlgMFw461ruMPhNuEaadAqHZZKq/aAlM8Qz1WlklfHgHtSJqirHh2j2jw0Ci1obOHErDyfRHVzC2zDTY0g9EL2gS7Jx5J+94TVucAcu/Dhe4NQCWMdi38Acg7O/0Mf/V+jMxy1kLt8D+g4D1CyOqQuDILRM9Sx00UI6vJCfn5dxIvkkz/xfNDDw+aBvkd0p3evp4jyqfv8Zw/xSp3v/09t3tSH/KSDizVFf16Z3d4JA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHVBdHhMN2lkZEc1bVQxaUd5UlczUGZYczB3UHh3UUFScTFxL0p3R0YxT0lB?=
 =?utf-8?B?SUljeG5VbnJobzFCeGxMY3RnNmZWNFozSFJUdjBEUEcxRVBNNnhVU3E3M2kv?=
 =?utf-8?B?OU5QRFNZSUExTEV5dTQ2UUpxcllyQUtuVm1PcVdsMlBWZWdZQUdFQVZ2cXZa?=
 =?utf-8?B?cWsyOW0vSWFZV0tnVzJ4SmFybDhYbDlRcmk1YmR1RUFnWVR4TWhKd21YSGk5?=
 =?utf-8?B?OUNVbHdJWS8rb0FKUkF5QVozK0dBbU1yODV3VmwxWW9UWEFrSUVUU2o4NnMy?=
 =?utf-8?B?NXRpQzB3MENVK21TazJHd1dISU96VFNPNmx3dHdVbWZ3UGx5bENMT2wveDRD?=
 =?utf-8?B?ZTdZWXFGbDE3bzNtY1RGVE1BMTlBZzlZVzdsZERDVFhsUk9YVHNQQXkvTG9O?=
 =?utf-8?B?TmNmMEZEUnBjcWg0OUwvMEpsRTVGelQwWkVoMmJYQThxN2FvWG9FdUZ0clNX?=
 =?utf-8?B?R1NWQk5lZDB3cm5sbmczeFpaSDh4ZmdzVDNkV01aZk1rMVpyQjdtUThDN1Br?=
 =?utf-8?B?SmJ6VEFWT2VlUTZFeXFuNFdIVHVrQWtIRElSSy9qd3E2UWdLVUJJYkhEOUVX?=
 =?utf-8?B?cGcrV2M2TkxWQWZXZEV1VmVXaHdWNnhIWEdqSzFTdER6WHBGRmxDUVhKV21O?=
 =?utf-8?B?dTlIbHJ4aUlOcnlSbkNyZTEyS0pjalZyblJ5aXNZRStrRGhybHlLQVlQNU0x?=
 =?utf-8?B?L1N0dnZ6Sk5MNjJ0L05Md2pXdndVREhOaTFnaEpYQTZkdStvMUdUTzJLT043?=
 =?utf-8?B?QlVGVWZiMmt0bktUSFFacHlxbEhnT2h3eTFoYnF4OWtLNGRGWkUvb25rdjF2?=
 =?utf-8?B?NDFlZWdJd1oydDlHNmRDWlo1and5Z093YkRWQVlZeFlEcTR5NU9qNitZcU5t?=
 =?utf-8?B?bUxKclIxKzE5MUlsKzYrNFJFSHpxVVl2cUVJQ1B1Vk45THljYi82ZjJsb1l2?=
 =?utf-8?B?TTM1Z3pFWmhiYjU1dnVGWFpIOGJoVDF5ZXZzYzdBVTVxbXFvYmF1dTd4Y2pV?=
 =?utf-8?B?RU55bmJJMUxoTWY5MEgwVW9Sb05GYkxDUjdUVFBoenhxYkt5bUF4clkxbUxG?=
 =?utf-8?B?QWUwemZER3JzRndUK0svajNCNVRkS0dzQ1hnVkQyb1pacFdNRXk0dWJaSlZH?=
 =?utf-8?B?bllvdW1QWWFHQzJzdDEyTXlzbi9UbHkvQUFTZGdmNndSZEhyOExDdnp3SDI4?=
 =?utf-8?B?NFFlcEtxQ0FVcjlyYXEzQ0wzWVZRM0thRzRGWFBUcHZwejZPa0tidzlHdWQ3?=
 =?utf-8?B?RzNFOFZiNklaOXQrSDJ2bFBmK2JXa2s2aDI4cHZ1RTBDNUZUOVd6ZjZFSHBk?=
 =?utf-8?B?UzNkUVNuUVpPMCtHVldZNE5DNWRkSXBXZVVPWlpDUk5ZREVrYXV5K2xCS3pL?=
 =?utf-8?B?VDVHYUNyQlJudDBHQ1JwTy9qUEpBRElJQURyRFdDb21nQ3pHRTBldEkrN1Bx?=
 =?utf-8?B?UEZibDFJaXpzYnloTGZ3M2VXZ0lJRVZ6RDlESndzeXgzK08wMjZBdGFmdUh1?=
 =?utf-8?B?empVYzV5QmcxWmVLeU5XQ2NEb0QzNG9Bb3JZd2NWcGFTaG5RQ0V4YUV5Q0Ey?=
 =?utf-8?B?SUFUYURPTDM0T0Jyajl6M2cwLzhJMm04MHZEcCt5YVR4c2tabzZoTEdaU1l2?=
 =?utf-8?B?OEtPcFRabnJRVnZuSzFMRTdnb1JhZFA5eEVXZXI1VC9XWjRXMVpvVnJtZkxB?=
 =?utf-8?B?RGZwWi94Y2FKTy85KzFvMXBtbGdGZU9rczJwUE5UcU5BWW5KZHB0MlBlYjF6?=
 =?utf-8?B?ZGZKKzZ6ZVRLYnZUYVRuVks4ZXhTK0oyeEFoRWNGWGl6cTFvcVl0N2pHUUJ6?=
 =?utf-8?B?dlF0QS9PQ2wydkY1cmx3MVk1WEFYRkpyZmNjWHhhY044VXA3dE5LZXNtN3Jm?=
 =?utf-8?B?VlhaTnVpeWFqMjQyZzk2VGJvdVhuNElueHVIbGdqbyt1ZVJxUnkvYStZYzBU?=
 =?utf-8?B?eWRRQUt0OWEwU3lyQjEzejc4RmhsVXVIN0lhR1JlZDhNZytiWG9uVkNoUjNZ?=
 =?utf-8?B?SEgzL29oSExWaHQyRWg3bnZLUW40VE1zdGZQYjJ5STJuQis3TXVXcXd0YnNr?=
 =?utf-8?B?NU1tM2RLRDA1Yjg5NjFockxrNDVjMEh6OFFiMndySC9vRmxjM2hUS2tMc1ZM?=
 =?utf-8?B?RTVZR2hFeEtWRWhHeXpSUUozTThKWFJBUHQvem5RdVMvR2xveGNtaVZWTDl3?=
 =?utf-8?B?M1FKekJDWEpnTm90SGk1WWxTblVmc2wxS0N1OFhFVjNic1Q1RjhoN0xrU1Ev?=
 =?utf-8?B?ZHo2alNNTVJPZVA1UkpsQnVYN3VDajBwdEthb2Q5Q1Y2bU9FeHYzU0xUbnJ6?=
 =?utf-8?B?UnZoS1oydm0xYVo5ZCtZbytUVFV4MnU5YzlqOGNXMkVLYVdTZlF6Zz09?=
X-Exchange-RoutingPolicyChecked: ELQ3bLlUlh9Im03ZsSSHBEPE1TO190RTFH6HK8CWt4ddXePRwxGrJ8UfEN/KhGoGkRnGh6PwK9arpCo6TCGvtucSRChSufBCTqnws9iWYEOqEXDh2gUApyHWupVIQQKSpu7Q36Q7GLvfyzXe6bv1L9AGVcvYDMc35eGzZAOkkNYQnHib5E+0B7kgb01QpeqmW9FHeS3SK4GWUqQVNFUKqEz/iOpHqdtnKwIL1VPGJhVsNwIGDre9rLrrKC7OB5njaGjHY8CHHSK1UJKsJVH/fx+5/QGEr6ssOMaW+18bfbIH5vqWDB7cHDbpxgXW2H1wPSBNMjQz2EBay+xYLud2sA==
X-MS-Exchange-CrossTenant-Network-Message-Id: baf2bf6d-37c0-4cd0-1045-08de8f38a3b4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:17:36.6145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elfmBf9btTd9loruAGs6uoyo6jtZrqRv2CAVjLna8K8pZUF/+4yxgge2wuuR320J1I41VD0Yf+yqfv18YRldKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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


On 3/26/2026 2:52 AM, Jonathan Cavitt wrote:
> Add a test to xe_vm that determines if pagefaults are correctly tracked
> and reported by the DRM_IOCTL_XE_VM_GET_PROPERTY.
>
> v2:
> - s/pageproperty/pagefaults
>
> v3:
> - Use xe_vm_get_property
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Jianxun Zhang <jianxun.zhang@intel.com>
> Suggested-by: Stuart Summers <stuart.summers@intel.com>
> ---
>   tests/intel/xe_vm.c | 156 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 156 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 778d9ac86d..997c9971db 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2466,6 +2466,10 @@ static void test_oom(int fd)
>    * SUBTEST: vm-get-property-invalid-property
>    * Functionality: ioctl_input_validation
>    * Description: Check query with invalid property returns expected error code
> + *
> + * SUBTEST: vm-get-property-exercise
> + * Functionality: drm_xe_vm_get_property
> + * Description: Check query correctly reports pagefaults on vm
>    */
>   static void get_property_invalid_reserved(int fd, uint32_t vm)
>   {
> @@ -2506,6 +2510,157 @@ static void get_property_invalid_property(int fd, uint32_t vm)
>   	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, &query, EINVAL);
>   }
>   
> +static void
> +gen_pf(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
> +{
> +	int n_exec_queues = 2;
> +	int n_execs = 2;
> +	uint64_t addr = 0x1a0000;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint32_t exec_queues[2];
> +	uint32_t syncobjs[2];
> +	size_t bo_size;
> +	uint32_t bo = 0;
> +	struct {
> +		struct xe_spin spin;
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	struct xe_spin_opts spin_opts = { .preempt = false };
> +	int i, b;
> +
> +	bo_size = sizeof(*data) * n_execs;
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +
> +	for (i = 0; i < n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		syncobjs[i] = syncobj_create(fd, 0);
> +	};
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +
> +	for (i = 0; i < n_execs; i++) {
> +		uint64_t base_addr = !i ? addr + bo_size * 128 : addr;
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = base_addr + batch_offset;
> +		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr = base_addr + sdi_offset;
> +		uint64_t exec_addr;
> +		int e = i % n_exec_queues;
> +
> +		if (!i) {
> +			spin_opts.addr = base_addr + spin_offset;
> +			xe_spin_init(&data[i].spin, &spin_opts);
> +			exec_addr = spin_opts.addr;
> +		} else {
> +			b = 0;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +			data[i].batch[b++] = sdi_addr;
> +			data[i].batch[b++] = sdi_addr >> 32;
> +			data[i].batch[b++] = 0xc0ffee;
> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +			exec_addr = batch_addr;
> +		}
> +
> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle = syncobjs[e];
> +
> +		exec.exec_queue_id = exec_queues[e];
> +		exec.address = exec_addr;
> +		if (e != i)
> +			 syncobj_reset(fd, &syncobjs[e], 1);
Small nit: Indentation, One extra space left before syncobj_reset.
> +		xe_exec(fd, &exec);
> +	}
> +
> +	for (i = 0; i < n_exec_queues && n_execs; i++)
> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> +					NULL));
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	for (i = 0; i < n_exec_queues; i++) {
> +		syncobj_destroy(fd, syncobjs[i]);
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +	}
> +
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +}
> +
> +static void print_pf(struct xe_vm_fault *fault)
> +{
> +	igt_debug("FAULT:\n");
> +	igt_debug("address = 0x%08x%08x\n",
> +		  upper_32_bits(fault->address),
> +		  lower_32_bits(fault->address));
> +	igt_debug("address precision = %u\n", fault->address_precision);
> +	igt_debug("access type = %u\n", fault->access_type);
> +	igt_debug("fault type = %u\n", fault->fault_type);
> +	igt_debug("fault level = %u\n", fault->fault_level);
> +	igt_debug("\n");
> +}
> +
> +static void get_property_exercise(int fd, uint32_t vm)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct xe_vm_fault *faults, f0, f;
> +	struct drm_xe_vm_get_property query = {
> +		.vm_id = vm,
> +		.property = DRM_XE_VM_GET_PROPERTY_FAULTS
> +	};
> +	int i, fault_count;
> +
> +	xe_vm_get_property(fd, vm, &query);
> +
> +	igt_assert_eq(query.size, 0);
> +
> +	xe_for_each_engine(fd, hwe)
> +		gen_pf(fd, vm, hwe);
> +
> +	xe_vm_get_property(fd, vm, &query);
> +	igt_assert_lt(0, query.size);
> +
> +	faults = malloc(query.size);
> +	igt_assert(faults);
> +
> +	query.data = to_user_pointer(faults);
> +	xe_vm_get_property(fd, vm, &query);
> +
> +	fault_count = query.size / sizeof(struct xe_vm_fault);
> +	f0 = faults[0];
> +	for (i = 0; i < fault_count; i++) {
> +		f = faults[i];
> +		print_pf(&f);
> +		igt_assert_eq(f.address, f0.address);
> +		igt_assert_eq(f.access_type, f0.access_type);
> +		igt_assert_eq(f.fault_type, f0.fault_type);
> +	}
> +	free(faults);
> +}
> +
>   static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
>   {
>   	uint32_t vm;
> @@ -2635,6 +2790,7 @@ int igt_main()
>   		{ "invalid-vm-id", get_property_invalid_vm_id },
>   		{ "invalid-size", get_property_invalid_size },
>   		{ "invalid-property", get_property_invalid_property },
> +		{ "exercise", get_property_exercise },
>   		{ }
>   	};
>   

Otherwise LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

