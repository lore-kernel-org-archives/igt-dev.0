Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110B9CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 09:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D0410E503;
	Mon, 11 May 2026 09:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaOJ26uJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D832F10E503
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778490547; x=1810026547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/p/E++pOx8aMCAuM/mr8cWEO/05NtrFYMfKD8yKQo3U=;
 b=YaOJ26uJEnb7prIv00pxO/bCnPkWivzsK4mp0bfp5u+HPRLxZPlc0tlW
 bP4zwxOSWQwD7wHLNdrueFhrpexueS15gsO3koeE6OnzqcLg3QoMeJ+z5
 5ZZLRs/+pRpsvPtF+AvkDA5GVpZhRIurgyHNfuyDMS+mv211GdB2W0FHY
 JU+xxrNZQkHfLW7rENAlj95Fh04j8Ysa1wmu208h7AoyLP9ZSynKP479w
 QzEv1n6Thd2xsTjXMJU0ftAGsVA0CRRRsYauzgmTsaoLWs7AyPiIzohmK
 f1T1c4W+roHeb5kvQYFTZdCmI/93ZGdfbkxiB5c+Nzk25CRJbuswCeVr+ Q==;
X-CSE-ConnectionGUID: 6EoGJWsYRJmXGBqwFtHGlQ==
X-CSE-MsgGUID: Kjn8UTV2TN6zRhS+HwaHNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90837535"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90837535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:09:06 -0700
X-CSE-ConnectionGUID: ZbgyoolTSdakihoAj6rj7Q==
X-CSE-MsgGUID: +AFOBrUIQ0qNQ8uzpjU1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237628559"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:09:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 02:09:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 02:09:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 02:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Trj2wvoIdfjCEjDkeJSbQU0QuGbGIGUQrnCmniT1JH4buLd+Eedav6rFXHL7ZirHVGdC5P8HDEcYdKo5OBG/gu/zjRCVrNb9h3ogLyefDtP17sjrwKQmS++tg1iinw+R2UMC4up+MBBAmX/LWx5A1rSv9GAC4BiyNpz3rmr6NwwxdYOz299VhiUJAUQyeucNM5DViwqeri1muas8UtIiIGE8BXQ/fDTfMweQ4HcwEbI5KgGGZgwdTkkr1vtoT/XJeygnmNuj16vzJ85ND1tz4xf9l5jhI2zk5tlsMIKgUkv8d5SdALrli572SJtjUsWb/cDM8aBllR4BO8waYlnWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aC/Pp82UBfHEADaf0bDhJYwi1Cw70HCRdHe5ggydbY=;
 b=j6B80xUHGl8CZDcrRaG/T+0pYPFVTvUoTvWJ3dqIXAuBlrmmfkQkywNHycblgakGJTLt6vEsPtL4QXr5DVV9ZI226w2lOSyVuzO73SwFbjI6TkUV4M9WDcbxhNLlrI+UPwH7x3wc4wUGEm2fxPtm1CYU93Yebo1E9+SqB6VpXAN2i/ofBCXH/bT+pwTtkK7xgRcac3JPUfpTCCI3icLTG9hm+PUWySHEwuhK0PfNld0SjdUfUGQwg8YQJLJRlTdM4GjmkTmnY1kpJhLLeBlo42cQewH/xBkJsM08y+UvQjetxtkP09+q88ENiUaRno2P1KumFPX/A0W2R2LlSwbl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by MW4PR11MB8266.namprd11.prod.outlook.com
 (2603:10b6:303:1e3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:09:00 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:08:59 +0000
Message-ID: <13a1a79c-16ce-4974-ad6b-cb03b5c5550a@intel.com>
Date: Mon, 11 May 2026 11:08:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] lib/igt_core: add timestamps to error logs
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Stuart Summers <stuart.summers@intel.com>, "Jari
 Tahvanainen" <jari.tahvanainen@intel.com>, Mateusz Grabski
 <mateusz.grabski@intel.com>
References: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::12)
 To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|MW4PR11MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 35de3be0-bf1c-40f9-0b48-08deaf3cf03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: n0ELIJ7MB3aV1UGKNUsRf51AQQp/jjaPxz07kXmHxjVjYaV5nkOvFXaspdpiAsBjBexDSUM0sB18V82cXEcqUTtZvrwDpClzbrXTUkOV7SK512t/Xa9vBsxuEqkhOF9/WIwtK/pHekWdirPM+iP1cZQsLWgcoeEYMFem+ihwFSez6uUAEXTsZ/Dkewi6KKbXqno5LAfeyOp7B0j3yDXoN6h6XQeaoVxooCVbHqmWZ2tyZhRJPefCEqlNts0brXxhos9Wuz1ph4rw0ZNI7J8cRYSHl97w/4NdlBNBWsE3y+WNKA7ghSsb23jsjonYKEjK7KW4cfDDDZv2piOtP2YMcsPBQzJ30+Lyc+vMYWl7jkYtncWslC9EGVAb04RzZMHICUwlVkvT5kmiVWmWZixmhbbuLTQUq1HUui96Ti79Zen1iCxzRJaH9iM9Sl8H1qbWB9qv5OjAnMFX3ykquS2mvQ9NHXPnAC6SJdt/x4aR8Q9i1os1BnzvwM3UTEqDCdI0A4ksHTvifz3q2nez6U8PPksT/PP9QNs3uc6UitZsoFxbqt9v0wMFwh+o/0pL6uTiLw83S9Xp0IcJYUd9r0iNNk2JwfKa7v/j8NC+rxZwcaim2jSMiSSrjOrihruWWOsiZ9oxv4ETxeIJpdjzozoznA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?disxV2JtWlc3Z2xiSERKTDloOHBBMmFINGordEdFQ3hzZ05hUWdxcVdTNXVU?=
 =?utf-8?B?NUZBWW9BdVhnUzhxdGtVQUNrNDRQSEdFNy8vV1l5Y29GYVFBSG0wZ0ZyejRC?=
 =?utf-8?B?Yy94RGNlV0l2U3UxV0JSaEZFd002MW9wclJYS1Z1ZXBGZmF2VzdUUng5TkxW?=
 =?utf-8?B?c29XMW42TzdWQkp0c0gxbm8wUWlpd1lZQkpyM2Zick1lSXNsNW54TkFqQmky?=
 =?utf-8?B?dHZUK1ZMb051RExhejI4SGZZTjRXU29aY3hIcXZ4Y3MrOUtlQlU3QUZDOEJn?=
 =?utf-8?B?YkR4RWhJbHhNS1A0TFhGaWp5REl3NlozQVFmdm1ldWV3RXZOMko0T2ZvaW12?=
 =?utf-8?B?ejRObUgrc3JyWmtIMkR3ZGdLOUtJKytwS1JLNUcrQS9BWGh2akdsazVweVhP?=
 =?utf-8?B?RjhvUWFVNW10S2k3UUVmamtncVI3Y0xnOTkwUDBDTUU5OXc2U0RkUHdKUTMx?=
 =?utf-8?B?aCtQekVaTmk5Tm44M1Rha1d0QlZUdXlSU0YrcE80S0RHOWp4RU9GNnNhcEN6?=
 =?utf-8?B?RmMwRW1xYituZFBCTUVFLzdMNWlkbmtmNEJtUjZiazA3TlMyTEZ4eS81ZTJQ?=
 =?utf-8?B?VEJhMVBXZGNYVFcvWEtNNXpjazdTUWVTUjl5UnMzaDU5d2YvNEVYUzVLV3pR?=
 =?utf-8?B?WXVkSVBWUHE5eVZ2RytRcnRPUGF2UVBnK1FEcWRTUHZOanp6Vm92Q3dyN0R0?=
 =?utf-8?B?UXEwcC81QmRraHdTMzFLTVI2ZjAzY2FCSURtbUJFR0FQNXE5MW9mOC8wMldI?=
 =?utf-8?B?K3laSUlKTzJpS3ZwZitpMTczYWF5WGF6SjR0NUoxZVdhQ0k1MmRwUzQ3SEcw?=
 =?utf-8?B?RVhPNXJSbU5RT3E4bHZ1NGxvMW43MVo2TEd4dnlERjdSeExWU0lXcm5XaXY4?=
 =?utf-8?B?aFI4WDF6cE0yWWlvNDVjNy9xZUlRUWJBcDlPTzMvWldtSklldmNSUVkyV3Zz?=
 =?utf-8?B?TXp0MFFPc2o1MjNtYVZyOTVNY0FPcGsxUm9OanltZmMyUWs3WlMrSXFIcHBF?=
 =?utf-8?B?YjE4d0VCa2lSdFZpejdwN0JzR1pSOVdxUVl6WG5JODNZenBxSVhpOTFQdUhU?=
 =?utf-8?B?T2dwckJlUmh1L3k2Mkk2SG1zVDZjQkFhQmNSc3JhR2pOQ2YzaTlFbjBuMERL?=
 =?utf-8?B?MXR5dTF1TXZ2OGxsY21QTUh6ZGVYS2h4VVh3UnN5UVc4MncyTTdUQXJUVXN4?=
 =?utf-8?B?bzRUT3pBNWdSelZ1Z3lPRVVYcHhWUFlhRnphV2FXalJHbjI3Y3RGL2Q1UG9T?=
 =?utf-8?B?cHp1azVieHM2RmFIYXVTaFhCMUdlcVZJQlpuODJ1RG92bExhS1oveUNWWHVi?=
 =?utf-8?B?MnppWFk0bnZvdkxiUkVGNFlYazFEbTl6QkFOcTBwQjlFK2dHcUVaTVRacnJY?=
 =?utf-8?B?VGVkUnpWS0g2ZFQ3QThuNEVKUmhJcnJqWmlXeFM1SmZDNTVEbm9CQzJWL0Yy?=
 =?utf-8?B?RFJhditlMzRub2xvZktnajA5QUV0Y2tIM0hxVUpIY200cFBPQUdaRlpCcE1N?=
 =?utf-8?B?M2VCaEo5U2Y0dDlIay9haXc2VENvQStrTE9pVUZvYk1tNUN4VmVrZnRNTkQr?=
 =?utf-8?B?aEVSKzc1SmorYkZBeXhRQmdUWWFuMGVQSERXWXgveERPR2NxeTdITXhuRFVr?=
 =?utf-8?B?RXIwVjBvVjRMTW5lYldNS0tvQ3VOb3cweFlWY0NrN2hNVURMaDBoMTZ2QTA4?=
 =?utf-8?B?L3Uva3o1Z0p2OTY1WXJySlpLamk1SDVHWVNSa015bmRvTnArUTJGZk5aV1Bl?=
 =?utf-8?B?NUo1QmFqRjNndW0wVlVlNktzVnNTcEwxRDR0K2szWnNrNFlOdTRUZEdJOVds?=
 =?utf-8?B?amtxSVJLK2tGRFBJMXVGclJvaVI2Sy85TUVaRTJZOVBMeDVORjZsMEFQdE00?=
 =?utf-8?B?L3FzcEMyM3hxdGpHRThUSXNxK3I1dmdCSHVONEhhMjVkM0dCOStHTTB0ekFT?=
 =?utf-8?B?OFBlTVNaY1hGemdRdG9VOWc1SjJYMi9HNE5WMUw3dktEVDhyTlBGSVNqek1P?=
 =?utf-8?B?N3hkdUEzL2JuaXk2em1yWjNObnJEb3k1ajZEamJYN1lBRnRuMHRpWmFUdSti?=
 =?utf-8?B?cVBQY3p0Snp6Qmxqd3J1QmRRU3gwWnZ5Y2lGOGQwVEJtQU8vdEc0aEl2MUpB?=
 =?utf-8?B?RkVxcFJRWlNzSHF6YmFFK2wzWk5rSzZxQkZXU2VPckgzSWtvVWlZRUdKOE1B?=
 =?utf-8?B?aGFFN2w3dmxPNUtjUUlVZzd5RkpMNkpRa1VIcFFSNVBUTWJqS0Y3N3lIU1dm?=
 =?utf-8?B?a2xJWnd2RlU3VllSSUdjSHk2N2dxTDF0bFN0OTgzZTVtRStvbmc1RmxDMDlO?=
 =?utf-8?B?K09wY3B2YjhwU0JYWUMvTDFiL1VPNTFJUmtLTFVoRUFIWHlRNTA0UT09?=
X-Exchange-RoutingPolicyChecked: KBpiE7RPuTM7x2pHytXrgqUhQLr6L4yX1tXFJ/VsNrzNuQQVxlmYk8BSuSPOgWdFp1NK42RdWmb1K2h8edTCSj77+ME3dUWa4hzCKd2z5J7VOwM0bSnxn5ef0AM+R9WzfyMuzZhkkWUWRSGxi9uODp8dI9hxNyXGPFUGj8P7U7eVFUwZBavQCFqaH/gg9nPqu2LEkY6XmOOrH0/aZfhF4x0WJFocZ6rS6yHEEntD7jqvfix13EY9qtpfVocUDchvu2Tbi9ccUxErdT2ErJRYANQGKVCyF2Ts10t0QIE5+DQK6hkXWHDuweoDRfIEcJHC6hM/uuv8Eqxmf4utrb8SZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35de3be0-bf1c-40f9-0b48-08deaf3cf03f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:08:59.8372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7ATmyPUmAzKSLPAS1cX7Q7pbHcJ3a2qEOHBldEheZO6IMSajPD/W9x6CL9JgTy9UX0LSizfw0SOjoA8VDGH0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8266
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

W dniu 7.05.2026 o 14:34, Andrzej Hajda pisze:
> This patchset add timestamps to error logs in IGT.
> One of side effects of adding timestamps is detection by CI of previously
> hidden errors in errno handling.
> According to manual errno should be read immediately AFTER library function
> returns an error, otherwise errno can be overwriten by subsequent calls.
> First patches fixes these errors.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>


Apparently the errno is handled non-safely in so many places, that 
fixing this will take some time. I will try to detach timestamps from 
errno fixes in next iteration.

Regards
Andrzej


> ---
> Changes in v2:
> - added fixes to errno handling
> - adjusted format string to be the same as in dmesg
> - Link to v1: https://patch.msgid.link/20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com
> 
> ---
> Andrzej Hajda (3):
>        tests/core_auth: do not call any function before errno check
>        lib/igt_sysfs: protect errno from being overwritten in igt_debug_on
>        lib/igt_core: add timestamps to error logs
> 
>   lib/igt_core.c    | 13 +++++++++----
>   lib/igt_sysfs.c   | 17 +++++++++++------
>   tests/core_auth.c |  2 +-
>   3 files changed, 21 insertions(+), 11 deletions(-)
> ---
> base-commit: 3e5747e536f148bf232049e49a00e2b683f91a83
> change-id: 20260430-add_timestamps_to_logs-d84fdfd7ef4c
> 
> Best regards,
> --
> Andrzej Hajda <andrzej.hajda@intel.com>
> 

