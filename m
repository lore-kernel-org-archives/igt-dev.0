Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8905C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 08:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630C610E2FA;
	Thu, 16 Jul 2026 08:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvfTqDE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EB810E2FA
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784189276; x=1815725276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qY2T1+344UxvGuurA2U2D7GGq/z7frq3WdkaCG3J2mI=;
 b=gvfTqDE4tKsBUJfvn24CKZ0KZg7cj82mVQ0e3uoMbY448I6dBKNEcRZI
 2wivkrAlzmkqfu49cl1PTlHot80h1eeMekA8kYfanRdZcJ6TRyq26rYjt
 fTpxc93EF+1nx+U+1tlM9N2tmfut/o1uJMay5wSx6Wm1xaaCHzQvu1t1e
 7sE4kzGs+ZXp5q6ka9V5IJjgPDuNyZxxW8jJ98q/eBVUyEpiWwl83PeIG
 UaHz3C1R9GSPpOb01H+WE3a6ggMNHkf4G0PylnlxOqzIA8OJ0IfnYwgL4
 cyi5yMnLUxExC6Q1c3SCJGJcgqNk63TB4ahWhQINumdUAwRCjh4mIQgQp w==;
X-CSE-ConnectionGUID: IGjHR2VyRyGwRbse97cJRw==
X-CSE-MsgGUID: y6kNykKdTGO9Oo8Xt8f7Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102392948"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="102392948"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:07:55 -0700
X-CSE-ConnectionGUID: B+NExs3nT12GWbUiZqtRJw==
X-CSE-MsgGUID: Dm6dqgolR9mJE3j4QX4OvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260006384"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:07:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:07:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 01:07:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:07:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBTP1pJn6ZrRZechGTnanuI+551t76DeS+t8O2KZx6OhaSo8Gs3wKZ26GWhrtwdSq0cwOzp8g4l42cImedJaHLWxVSnYIoZ46b1wKu4dxwk87foOJ54qysUgJsvfeNUJsltXOmTs4zkhRXdgvtdeYlPEPF3E/YMv3f43WIs8UiGfPeDCFK+FcGgmSa7y6e5osav2N6P35uIiIwZOWieqDB/VDNigal1LJcf8lApDwdpf9aijKCEFl+NH5MKX3RogohD6TzCl1v8cdj3KUs1MoiW6Ldc5JkYRacacLolvaRJW3l3oSBHSvRMn3waWSOMn1Ujspzmklr4lXlvzGZ7iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjYAPO9p3wmfveetEal8SAIP/W1np5XUCcK2gT5kVXA=;
 b=G+3rg4zWrMNT7V4TXwuN4Yt6uha6i4oedmIXFnmf+O9/0BuuqMeGhp4vduHpwyxsCE4nE8Qv0TWIYN6ZM6QIJeP+qv33IGNhEzw6+T8L7CmDKLg2UaHUTUQYn4tG6F+jg1RI6Pu/PFz8LSEyKDmdCpHPRHV+INmS8W9dkrIvBzF8lmTFRiuONWYAjINjGV1m8isEAUeZCfNBeX/mwgC84BP9W6AmM4O+pVdU8epHtphSxg+dnPdHQ1HuTEXPPdX0jAFjcX0vzQ9XfZflYAUFqdAC3lmTGJ+hy12fUulK4yS+VFyODLbIf1rvlAKYGJ0C9qJzoRQaEhh4cc2oZGCJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 08:07:51 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 08:07:51 +0000
Message-ID: <aed99fe9-9ba6-4143-8b3a-f2ad78b3b28d@intel.com>
Date: Thu, 16 Jul 2026 13:37:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 04/16] tests/kms_async_flips: limit #outputs
 tested during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-5-michal.grzelak@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260713085515.463575-5-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c052f62-f5f5-436b-008c-08dee31154e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|42112799006|4143699003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: ngMxyjWuJCMJvf/R4axmyXFBHhmp9DdOpf/xuv8LS+NZkuv0xjARG8P6jp2PT3IX1BdUbPTeT5p+e+/39HQtRoGUZISIQMNA/iiNRnVnSjGaLmYzcLWLkN9mNM533CCKH0VcaQ6wI9cbhXpz2ZRBrnCJihRn91NqwKf+8hmu34L9MVYo+GEukOFxk/j9aIoKG9XCJz+iGoeWZo3CEPM4DAurRpxlmTIwiym+bRJie/FP/owO4OHqDbgoxJn/6HK80WT47TfET0Q8ZIcuMj77PKt11RSNElKsI08aj0/v8ot+/yVhJevNWgfirwqLaYmM+C8VOKcPLIlBVEEBWmva7Rp9657spjDCRaO7Tzf/YxWB5jeLgGJKIYZfiruMyDAHeUGp3HIH9BRz7jCkLjdl2I3zEIupZOX97pardDbfN5FIV24/I0z+uUIwlT+N0y5iV45ZJgVDRhHdUYNXc06PEmDvFPiiQ6P1jDnmCVP7eEup5Izbt9L8cIJPfrvka1B4oTV020dTOA4v88AhY7SgjaHqY4W9YQn1H2wuXB+MJmxQQTjHUw2CexmozJGsNSaC9cwpnsYqdZaRwENImDwusoxXZcgsm1jvpicwbaPdYuJqy9jYuvkr/Kw/QBy77B+BgrZ6UzW2hyE+sWQujR6oJanv6tvgpCop1w1KBcmwayw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(42112799006)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NktiN3dYWEcydzhJUmN2WWJyM05rRDB5WUQ2Zmw3Q3hJczZNR0JrYlBRcFZZ?=
 =?utf-8?B?K0drT1p0ckl2NGpvcytnbkV0QTZRK2dzZXFmdXpoTDlOdXJ6UzczZTRVcXNT?=
 =?utf-8?B?ZTRPZ1BiaDhyTDJJRzBrdWZYWE9PdnA2L000RERCUW8wWWRsWWJ5bWVxTERH?=
 =?utf-8?B?cENQeFFkaFlOYnQyYTlJWnlCRjZMcTk2STVDQXpmVFZIZCtTenRuNzQxQUYz?=
 =?utf-8?B?SUdhNUNQMnpPQ2g1azBKcUhGSEtPTUF1MHp6QXZ1bGFoVWZ5MUpSYjhuSzUr?=
 =?utf-8?B?a2F2Qjh5dHVTamk0MzBjeDhTVFlzNHE4SE12dE5tdlBPOXp0a1dCUnA3TFZ4?=
 =?utf-8?B?ak55Q25xUlk1TUNheEFXcGVZbEhMUlh4VFFockI5NnNMNHRETitPK2EvLzdD?=
 =?utf-8?B?VWU5ZnBqV3l6ME1iZ29hZUY5a1Azaklld3FvUmlFVDc3MkhpTXg3OWhhT2xH?=
 =?utf-8?B?eG9DeS91akJud1hNdkhzcGZoRzd2dzBZYmFXaVRrOFhoWTBGelJHR21nQzRy?=
 =?utf-8?B?cjltR3RGdnNHVVBhZVJqdUU3eHZMVjdnNzRGTXJYbnlyTkM4djZlR1Q5YmFD?=
 =?utf-8?B?Zk5MTG0wc0pjZk5PTTVaRmpBM1FzM3RJS3pVWGJGSGFnMko5L29RajFDMFp4?=
 =?utf-8?B?ajRLb0kxUXRGaFhZN0IxUllLYWR2cngza3RkZVJWeVg2QnJyWGtDOTlZVTh2?=
 =?utf-8?B?Z3FtVndod25yZGZGYTdPckk5aUFFblk1WGNQaC84bEVURHRWckJWTEliZ3VO?=
 =?utf-8?B?eUtkbmc2MmYxMFJCWTNCVXZGTG5TS0dvZktjVWsyT1NNQlZPcDVxNThCQWk4?=
 =?utf-8?B?R0dCOWRIZzg4SDl5akgzazRUcXRQVHh6RkxYMGQza0VJSGkzellUSFdxbUFa?=
 =?utf-8?B?TUs4aFRtWHU0c2ladUdON1VRUVFucVZGYlkxdFYveE13ZkJwS05ZbVhzcU16?=
 =?utf-8?B?SDlkR3JDY0dqbVhoMGFjblR0MjQzSFhxSERKNXpkVFJUYnN4V0Q3WmYwOWtU?=
 =?utf-8?B?d0xBbHZkcU9SaklabUUvbmdNbUZqc2dXamxtSCt2bnRWVlhJT3BwNTYycUN0?=
 =?utf-8?B?RCtheW1jQTVXUkk1UHExL2ttWGhmMmtReUVmc2hHRFUrQnBXNFpXQnBrTiti?=
 =?utf-8?B?anByeHdIeGt4KytUd2VnbTV0TEZubFJxNDZDek9ycTVnaEFjRkY4SlZNampY?=
 =?utf-8?B?dGE5N3ZHckV2ZnI0Y1cyS2R0bjArNGxMODhMTjVYVktjVTMwNWNLeEFSNUlX?=
 =?utf-8?B?QUNsV0hsNndOQlk0OWNEV1NUckl3NVVnbi9DY21mNWloMklTemREOE9YSFNK?=
 =?utf-8?B?M0F6Z09BcWVCZ0JzaGtzVWYzbHdRSjFhUHVoa2wzbUVQQnJpdVBHSC9TWjRH?=
 =?utf-8?B?TnJXY0xXRU9vS3BTcXN1VDFINUtabmlYN1BrSU9ERjd2cWNoTStwSU5BUDly?=
 =?utf-8?B?WkhNdGRnY3YrN090bEtZdWFaYWQxQjlET09IMEFhRHpRSlI0WFFoQ0ZGQWsx?=
 =?utf-8?B?bk1HT201U09NSzZmdHZoY2k4Y2w0Mm5FVUd2WEY0dm5ocmhZcnZueE9pWW5n?=
 =?utf-8?B?eFRqWDVNZE1SUnc1eG9zR0hUYnoxeFY5S3g0Q2NrYXVNb0cyTkF5K3cyUEtq?=
 =?utf-8?B?TW52b3BlUmsvdlhCYVZuLy9HbFNISTZrWUgzRnNBalVJWERDT0taRDZTei9L?=
 =?utf-8?B?NWh2UmpaWkVadEM2K045R1pvN1hPQmVuUkE1NEhDcXZtRkhGL25OMnYrN2VN?=
 =?utf-8?B?NXp0anhtNlFNV2NQdEZFSWtoRjRNdkduZFpnODAzVmRkaE1BYTVTZjZhNCto?=
 =?utf-8?B?cUVDaG9VMzhOeW1ISTNoRENBclR0SWg1dkpLYWRMeWlLanlMZlU3K0ZUVGJZ?=
 =?utf-8?B?ZGZTVnpWY0RjdlNHdWdsVTVmTW91OWVFWkM2Zk9IVFdrYkROK1lsb2xxVktx?=
 =?utf-8?B?S0o0VlpkWVU0NTlLVFMxcElCWnFRRUJFYnNDaUQxV2xmZXcrMmVlM0c0VXNr?=
 =?utf-8?B?ZzQzbklXR1FkMDV5ZEJoTnpQZzJLNVhoS24rZ2N0K1Q1TnJhVjYyYytsVDg4?=
 =?utf-8?B?UmhWUlByTkorZkRQYWRkREI1MDdHTEp1NVRGTTIxYzVWVmxuVVZlVTNLUkF2?=
 =?utf-8?B?MWpiYXNQemtMNUF6VEtFa3VmWWI2NnI1S20yRE9RSU16U1FxZ1J2VXFPT3N2?=
 =?utf-8?B?dVh1ejU3RWdnS1FTRWVnQnpoREhBZGs0S1Z5SWxINnpzUDhxdGZyTFRjd3k3?=
 =?utf-8?B?L0hhYUZLcU1QNGZHSnB0V1FneU9jRFAwOWE2dnFnTldFaTdBV2w3M2pqTXlQ?=
 =?utf-8?B?UlVOWWZ2TkppQm02ZUxIR2Z1QnllbWpLR0h2RGxYQ0svdGIxemNrdz09?=
X-Exchange-RoutingPolicyChecked: N2EXyeUZ4F0UR3xkLlHiO7vGdIx/6GSo36cxP5Gkc4ezJrR49EWBhjOUuB1KR2SxI8cOlZ+T7JCrcVtaUXkSQQhNkHfNuOkJcXuOgsgjnEikAT52Tzc4JNVqlkB/gNsGFt5CcYNALru5tIApcZd2p7luJAYtRzFy7USTbxfMQDbeqP0cSlmmUyk/25a8CPRo+zQdoLyG0u+lRUWo3Bl8x75LPb7cKdRUDHSc+dh9GzfmyRqU5fsah4vVvL8I7fRs/VEkZFwNHWNy3+RU8BX0wrA8d8qMgVsjooB4Li+Mkql58/HrjfvXOycoAWBQoFsYKZ3FzXloYGBA0G3O/E0RgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c052f62-f5f5-436b-008c-08dee31154e3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:07:51.4976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjLRp6QylbcsQ+vpOkbva8bi8E4wgGEtOF6vZ4EievKBqTrYCQ9cbV7BSMh3ZHEDRDlWlY7nEe+ZBw7bKG7/BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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

Hi Michal,

On 7/13/2026 2:25 PM, Michał Grzelak wrote:
> We are iterating through each output while testing suspend. This results
> in extended execution time. In turn this leads to hitting CI enforced
> timeout.
>
> By default limit number of tested outputs to 2. Test each connected
> output when passing command-line parameter.

IMHO, would be better to restrict to 2 pipes(preferably first and last) 
to help CI run time and still keep it running on all outputs by default 
so that we don't miss coverage on any of the unique outputs connected on 
any given config.

@Uma, @Swati: Any thoughts on this?

Regards,
Karthik.B.S
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_async_flips.c | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 03348d958d..7ef31a8ea5 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -119,6 +119,8 @@
>   #define MIN_FLIPS_PER_FRAME_60HZ 5
>   #define NUM_FBS 4
>   
> +#define OUTPUT_LIMIT 2
> +
>   IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
>   
>   typedef struct {
> @@ -150,6 +152,7 @@ typedef struct {
>   	unsigned int plane_format;
>   	bool async_mod_formats;
>   	bool single_pipe;
> +	bool all_outputs;
>   } data_t;
>   
>   struct format_mod {
> @@ -873,11 +876,16 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_crtc_t *crtc;
>   	igt_display_t *display = &data->display;
> +	int output_count = 0;
>   
>   	if (data->atomic_path)
>   		require_atomic_async_cap(data);
>   
>   	for_each_connected_output(display, data->output) {
> +		if (!data->all_outputs && data->suspend_resume && output_count > OUTPUT_LIMIT)
> +			continue;
> +
> +		output_count++;
>   		for_each_crtc(&data->display, crtc) {
>   			if(!igt_crtc_connector_valid(crtc, data->output))
>   				continue;
> @@ -1039,9 +1047,27 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   	}
>   }
>   
> +static int opt_handler(int opt, int opt_index, void *opt_data)
> +{
> +	data_t *data = opt_data;
> +
> +	switch (opt) {
> +		case 'o':
> +			data->all_outputs = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
>   static data_t data;
>   
> -int igt_main()
> +const char *help_str =
> +	"  -o \tRun on all outputs. (By default subtests will run on two outputs)\n";
> +
> +int igt_main_args("o", NULL, help_str, opt_handler, &data)
>   {
>   	int i;
>   
