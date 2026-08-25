Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57250C5DF9C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 06:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DE110E153;
	Tue, 25 Aug 2026 06:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoFd+hcC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01210E011
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 06:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638441; x=1819174441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r5XU1clwf9uXjYIAYtj5rahCaGt1wlrR83Mi/WNlgtM=;
 b=FoFd+hcCE22X7RPBs90dSJlhofRvpTHwbundredGXtKpCcmvqQm97mFB
 /+blntW8LONd8Jky3dA0Hq6/Y3egV64DlA/zmVye72Mrk9sVT3tDSUE5w
 Z/rz25TkzOIXdGRQchflsHq9CGaZfd6H8gCUUne5AgVCwkdXE/KWH1NAm
 ezsjTDqdEu+MpyulERYlpPff0ZOxY6rUfclIhzrEt49pxMHjfPGZ3LlCY
 pcoqntH6rsf9vtx090rT8BgkYkE2hSA+AW4YZRUe9b1ZXsuSpW3gpnS4z
 VWp7VMOtNx1n8smQEgpLyDtdKDL/enOrB0jk9x2elxGdIx4rQWnZ3aL8E A==;
X-CSE-ConnectionGUID: fS8gztJuRWOGKIrNsQljiQ==
X-CSE-MsgGUID: gHO/uKJ6TbeLiKKBK3L1xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105477198"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="105477198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:14:00 -0700
X-CSE-ConnectionGUID: AVZVbLAySne0AWxhq+sImg==
X-CSE-MsgGUID: 4daVm8WTS3iKmo4u2abHfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263464859"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:14:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 23:13:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 23:13:59 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 23:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fv+w8GzoGBdHoshVtIlEPXFLkZbS9J03jzbJY7ec2hs1IZpvdLgOz3pb29lipibnHTlJhKW65+ngm36aaAd9BnsQeJWgj+bpmklPG7DqlLz0S9Uc2VOukpQrUtaQto5pmAMX+puOAyE/wh4QS6vraa22swH3nFNa7HkBFYdw9/djkdsT72hjblolohR4Ni5OQP6Mw9JmPdwdfuxs/XYE7EGJKatMxQmMykW1Uqq+yJonXPDUCdKT5svDa91ga9Vkr7B3uo+/1D58uiQYo3LUAnC1K82VORT7JhJnQZJACyDF8Wtqe8MACiU4FdZsKC41UEbI/i0Uhaiq/kyEOUg8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8tRmmDnwzAeLfCBjegKbVWmWbV4K7cvbijYhe3UIOc=;
 b=TtZYFCliHxyqxMV5amUf4rulOBEOEfu7Qh6QaruqVkLEgOfCQTJN4QHLwiwMpgbasLR5AAiXVTmSiGlSrES1Bw+WCzEbXhslP6aaVwbydUO1Eo2c0HNDG+ykTtksB75qk4XJTs0rj1cxzDh8c9Iqt75Aivo5KXAUB7Bzwi6v5ZZs/b962Jso+Z+cmvDD1OinqFT9flr29RZy6jnVOwmNUalKQGzIBlazVImxgoUtl63Ow/9991Gc6apeoUngEuL37Yy6Bs3+Nu/Aas0i46BBXD3RcNdzLty/9dVKUk2caAAtP97TeNJjE4LfejXJbPcIMheuRGCjBi93m+mBsK42oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.6; Tue, 25 Aug 2026 06:13:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 06:13:56 +0000
Message-ID: <265dfdba-698b-4442-99ab-26d4fb23228b@intel.com>
Date: Tue, 25 Aug 2026 11:43:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <kamil.konieczny@intel.com>
References: <20260818201148.36020-4-sk.anirban@intel.com>
 <20260818201148.36020-5-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260818201148.36020-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0161.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a74539-f0f0-46d7-4943-08df02700bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: lD995Il/y6aIBNQXj1K+In3f3qVUV16oEwqChalI3NARR2qyo9HwEqTfetJwxYUk9V35wtTWCIsedQRNHvenRN3+91I9Lj+aHtTzrHOXJCBIrzdqhkp0GuFKiggBq3fuzB8LQMm0DS4QLOc0cnF8DNcAnSpsEYFTutWqcLp2fY6JQREHNn9/ZufuZ223fnfqP7Rlq3r+1ieB5I8XR/6ksQLw0Ti2qJAynBjax3kpLBF3vhmb1X/XXKAyrR97QImQog1TmyFRaf1x3poh43pdyFxCdlRJ3EnNEaFaF4odFNw1emavOjzEItJv5bpvaI3vh5c5ehH5D87paM6260mmW5Qv3nqEw8yN+H1qXf9pZI0aLQUB+OGElbL0/KvG4ewCvVupKCBv2T/58moOYqsjQ0QWgk1R65hRRKwubKGT4eK7kRJ9x8OMqlmvQMRX7HJ7Iniq8j5Af8S7kVPfXWTw9O4yXMFm4Y/YIWQNv8IRBrSiYvkKwD6BqpUnqtvUAN7DXa3WJ9BV8p6w+0zYicVAnLeuw/TmQmaEi6jQtnXwSBnPrVdTEPs7vMnkE3bdVevB4/k9y4t9Rzl4u3Bn3BaF5gO+OJGh5z8uCakow2p5djNVCQ2ZjpX7Apc+gZKhYcSA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJUT0J5Zm9ScjFYZWZyVUxUWmROdmRjRjVUWCtLUzdrb0pTNTdqZXExaHV0?=
 =?utf-8?B?SXJUdTFmdkxQU0pFYld4ZkVFSkZYbEQydzRVZzdhVi9lbW9CZTdsQ010TGpN?=
 =?utf-8?B?dlJWV25Dc1Jtc1FkRVNrb2pCd1hSYmlRWlY0QmZ6OXU4cmdVcDZJSktqWXJI?=
 =?utf-8?B?RWhBbkRDWERsaXJwMzQwV016dHJCV1RQUkJMeGU3MkhrWHN4T3NpOTVTektP?=
 =?utf-8?B?bFR6b0hiSEFNeWNxWnJxemVpYm1jaW40UHdEMFh2OTNXRmQxeG4vcThpcDBv?=
 =?utf-8?B?dU53c1hTTVYrbENaMzBMODUybEJkZEFyMU4ydllJSUlBK1Nac2Q2QXhDVkdz?=
 =?utf-8?B?MHJUL0RXTlJFa1piOW9CRUZJbjBpcWpIcHRXN2Y0MDFOUFNNYmdNWFFpM2Zl?=
 =?utf-8?B?cDhuRWRPNTJVU2lNMC9BWDV2M0dkRjkvUndLVDU0S3FXajVHRFVZNStnT3VF?=
 =?utf-8?B?K2VFajJqTWpSOGkraGpTbjJnUkl0ZUpjRDExZjFsY2NtT0FUWXJqcVRUV1ZF?=
 =?utf-8?B?cWtyVi90NlV1S0loeFVEWE9RN1ExZGJUNE1aRzZ3VzdhcXNIZjNZSk55cC9t?=
 =?utf-8?B?ODRRanB2TEY1Z2JRZXl1d1Z3M0FFOWpnVlE4TTh4QmdFUEQyM2c5WXR3c2dP?=
 =?utf-8?B?d0hLVE85TVU2UWVERkJpNWdSNGRWYkpiRWhISUVpWVFjd3MvYUxyNzJ3WHdN?=
 =?utf-8?B?akxRdS81eUs2NTh6SzZyMDFaUllZRGVobkwwT25LY285ZU9OU2JwdGpCeU83?=
 =?utf-8?B?R2hrWHZJMXMzaDNnTWZUVWJvM1JHYmswdkNMVDYyNlEzUUFqcFJoY2NFb21s?=
 =?utf-8?B?MFBzRmVTODNHOExwR3dpQUc2Um9MbU5MNlZ0bHdDajZxT2hOL1B4RmVGL2tm?=
 =?utf-8?B?MFN0ZUVVZlE4WlZYcGZOQ2pCYXlTOUNKdGtaSFQ2MlFQaFRyS2k5ZWsyeWhz?=
 =?utf-8?B?M1JXa2FEWTZXdkdiL1p2N0xyMkcxeU1vc2tsM1BOa0lHQ2E2MEZYV2NXVmxk?=
 =?utf-8?B?clVENEtjOGNtMzkvcklaWmc2Ty96b2tCUnJMNG1KdkJsTGJFRGlIcW9GcnpM?=
 =?utf-8?B?Q3B1dktnanpQZ1JpdS9ieW9oTlVSdCtHUGJ5anluTGw5YmNyVnhBZnlTbEJU?=
 =?utf-8?B?bFF1WE1EY095TXVDcWpCb0ZybU0weTUvOE9WQWMybGtYbFVxQXdxZE1DYmxP?=
 =?utf-8?B?TURHR3RvaHFYRXNFWTlPbWkyd3FMY3RrM1pLWWR0NzdTa2tSTFltYlBMRUpQ?=
 =?utf-8?B?L25Pb29WSmpSTm1rRmVMTDBoTUVGQkY1SVJTVVhFMk4zUlUyVHBCV25rSW5H?=
 =?utf-8?B?dkVLUnRHbG4vWHF4UE4wTnU0N0FXZEUwOUJkOTRMdVo0ODhydUkrRVNJSDhx?=
 =?utf-8?B?RWZ5VnJsL0tXM3FqaEdqWFlxOStrV05rU05rbno2MjBmOGpOeC9ITXhjZTdx?=
 =?utf-8?B?Wm5menBPS1o4b1FQWk54djRxeUxzakw4SW5vNjdQMksva1RNdG9RcXFyNVhz?=
 =?utf-8?B?NG82cERzZ1lWUml1OTJWM0RFdndGUXgwajRvOEdRUDk2VWV3M3VtQVZieGFV?=
 =?utf-8?B?K1ZtZVJVeEM5YXdnNFRWWTJ0VnNhRVREZjJ2aGVTQkFlVWJlMlFPSkRRM2pt?=
 =?utf-8?B?MnFxOGhhMGtaUVVURWVXTGhNZjdON3BsT01nZG9DK2JvUUtSRThXUkRJMVdm?=
 =?utf-8?B?M2F2TWQzNG05UUZGR1REYndXNGUwNzloR21rZDlZWUM0UDlNa3Q5TkhqNWtD?=
 =?utf-8?B?MmpTSG9tTktmUVdVSlN0QWNRWDBDTzhON0JaSXZqYmhnZElPNmVuaWtmNm40?=
 =?utf-8?B?aU9UdjJSMjd4YTBCdFBoVWFjRUxTTjJRclc3WUpJSjJXTk9xT0NsR3YwQStF?=
 =?utf-8?B?K2t6RTlJT3VZKzBWMWRxeFNJK1E3QlVzdGpRVGtiWWQyNXRjZWxjekpjbW9M?=
 =?utf-8?B?WXk2Nm5pNmRNQTA3RGhsT3dxK05pZkNnV2hseXFYeWtkYURvM2RBY2hOYlQ4?=
 =?utf-8?B?ck5qWGdaSjYvdkpsS2lDTTdsOUYwZmM5cFBob3NnaWZjaFl3Q0VpUmZ1eXBD?=
 =?utf-8?B?VjcwRHhNZGN2ZnJ2ek1IOHlnVFJkVDF0dFQ1WmtpZmtnTFlxb0tEdk02b2xr?=
 =?utf-8?B?WUVRZHVuVGZFSjNPZnRYWU9PdXVWemRWTW1UVGVvRXhUQWlUWjJQbE5hZmVz?=
 =?utf-8?B?Y1NPbXQwRlBocU52SkZNQVJZSnNHNXhQSWZ0dVNqTmcyL3d2SGZmS3NWV2NQ?=
 =?utf-8?B?TmltQmd4aGI3b2lRSkJpWlgwSFE2OUFCdW9qTkdueUw0UlFVZ0YrNzU1MWVz?=
 =?utf-8?B?b0NVV0MxZ0ZCTWx0Y1BDa3FNb1lLaUtLb0JyU0NFb0xaMFFPS3Aydz09?=
X-Exchange-RoutingPolicyChecked: Ba8RP5njw539UoqU9EwIgV73GTL/Sc0ai0SABHHOuAFzkwqUM6d/F6rwUx7qD74eXwkpNDOKpnBXftfMfc85BNQR2pZ0aJSujAn/TyTKIhnNDobGArRtgUOeSQMGuGalih3xaNmzB6y+H5iZcUYPcsxx4KfysLhp8ft6VmzFhTRbixOKdaw9ZPSDeX94bsPart1Q/DtYte+j1BNtWw8kNYkTGz0k905Sw7UKrMOkGCbdrAVIA+Le8OX4fD1e658d0sAhIBuJUarCtZeAFI8WQq5ixbtKwwurmPIaFKkQZK/OeTOLnrG+ZQVy04gKBmgLAWoajUZuHZdzw6uuTN50Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a74539-f0f0-46d7-4943-08df02700bcc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:13:56.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DnLBDNEkpfup+m6j1CSeLn/9n+D40y7/o8SzQv7MHU25cKuH96b31FL0hXv1PhwszM2WSM3VFKkeQbXCw+sjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
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

Hi Anirban

On 19-08-2026 01:41, Sk Anirban wrote:
> The kernel now reports -ENOTRECOVERABLE when the device is wedged.
> As runtime-survivability deliberately wedges the device, update
> dmesg regex so igt_runner does not treat the expected error logs
> as failures.
>
> v2: Keep older error codes (Kamil)
>      Modify regex (Kamil)
> v3: Modify regex (Riana)
>
> kernel implementation:
> https://patchwork.freedesktop.org/series/168780/
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Take a look at the latest code post SIG ID merge. Please confirm if 
these messages hold
good even after that change

Thanks
Riana


>
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 74488bbea..e60a11c3a 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -43,9 +43,11 @@ static char bus_addr[NAME_MAX];
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/* this is needed for igt_runner so it will ignore it */
> -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: "
> +				    "(-ECANCELED|-ENOTRECOVERABLE)"
> +				    "|GT[0-9A-Fa-f]*: reset failed .(-ECANCELED|-ENOTRECOVERABLE)"
>   				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|xe [0-9A-Fa-f:.]*:.*-ENOTRECOVERABLE"
>   				    "|GT[0-9A-Fa-f]*: Failed to submit"
>   				    "|Modules linked in:"
>   				    "|__pfx___drm_");
