Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C94FEA808
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 10:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2744810E1F0;
	Wed, 25 Mar 2026 10:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkQUFDXK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B0710E7D5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774434654; x=1805970654;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=NsNB+zSAm7oDihsmrt9SfWVJ0wKh6CSbsWELjsH4+7I=;
 b=LkQUFDXK1/j2fPW0WbMqC1xXj5seYLlAqMm/VMTV3LkwiCKTjAo7tKcb
 xe7B09T8bQ4oiQn8JeHjJoD1NSGEhJqdOKuIPTWtlOLKRpyJJcPh9RSfo
 ov5UZbyEYUUiXZt0LlfruWYe5L2+s61kUbhs9P+O8355hJAAwrVl30qPQ
 N3s0F35ymqn4F1Q1xznAX7KzaY7jx/nEtQGp7Qxop3SDDUBqq28iZlN7e
 dZgLjJOemM99CNcO0GNJXIh3FPr/2SDqjJW7HNNxZ+mso01Pdbvh2GQaQ
 O53sWzCmFN28dB/ZA1PVf3lINvAuO0cJT576uj3XvnpohAfqEHffHMztt w==;
X-CSE-ConnectionGUID: swR1php0SUWJpH8E+ilHKw==
X-CSE-MsgGUID: Rda3JwF6T3Cgxi45MXnCNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93044911"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208,217";a="93044911"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:30:54 -0700
X-CSE-ConnectionGUID: wUzubZb7S8iX6aKJibhbmg==
X-CSE-MsgGUID: 4SD9j2cRSe2RNoxCtUKU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
 d="scan'208,217";a="220236504"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:30:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:30:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 03:30:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfSJ+Q/o9+GDdVwuG0AK/cdZPcxQMcsWZiPCAgsnXioOrkwdr6jmAhqG1WjcQGGl+zdNvCAVNRzonJk82zBgvPhKmdkt1LSDskPYpjzt3TUDnkKcYX3JMAME+AVLTf7/6oEJfn8Kwnfwp/js6o4anoJdJqdnz/IHAruHMwhrcWJzZ7jMVbVh/+N/eIvESXGzOyxQYaB4r+KisgsnLNRYHKBAnhTQnPd9j/Ucog8zmXXgMFS6Z0am+SHzI1EypcboTaS3I0BmKL44jWYm57FD7RDH8z/XILZu27/FltzW5FekCFY6ALhw+urk85+yxqnrDzO5xkiV7a9yIr/BkFabpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNnxYAH+3ufuFVMOAeQRgN6TpOTV5lEB24zPnjC/b+Q=;
 b=Ref+olUc2+0tOyQJIYZUooOtm/48Lg9gs2MiGW0ZHKMMI9cvqH5OIrVtxlA2t2EeBgfYBDlRe8oscfPaouSGpZzdWScuIJDMFUruU5/S4HporkZSi0+t4sjpACYUP+eBD6RcB9miCD6iffft+e9AIfd98MycP612+quLVuPR9QC/OK7PfXEWLjSCb+eWBE6+w8E4T7DO4rxxyTCRqjrNNanIVyyyNwY6p80I+TnLoJrdygbcLno53T9N0Lh5EqZTCgBMx79mcJ5PJ9ys+CTQLsSvGfWa+b/JM7pV2SvllULqFzJWzPjDNN/+ftoe32PvadL/hhLpl6GbRDoRvDfn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:30:46 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9745.007; Wed, 25 Mar 2026
 10:30:46 +0000
Content-Type: multipart/alternative;
 boundary="------------WjICGSgLmzkO2l5xobXseHJp"
Message-ID: <a9ecfa3b-5ae3-40c1-9a5f-04c598386fdc@intel.com>
Date: Wed, 25 Mar 2026 16:00:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 6/6] tests/kms_flip: test suspend at most twice
 on SNB && BMG
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-7-michal.grzelak@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260309092528.3336467-7-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d0fd39-3247-497f-2ab5-08de8a5992d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: fjIusosck+6Lzfqrx/fydq2fkUQ1qyJqlZvMaXRS3alIjQ2n9m8soNWrZkJxApLgjW57XC/fme0kYYmBieTfGwGKrDXGAQf/xe26+s/MRcRO/OEXy4QiIacdfiUI5C4Wl4DkpL9vsErL4Q1l7yHbxyGbmLfbu2/Z4uyFRmweTmvYQ5oXadszYEBP41DVJEofVJs/JEv4KbK8SJNcRM7CCBv7AIaSb5t1Asl74e5TOOgTVRO/xj811TBS0lK5bDnaWemon6zVPFIurcbflOwp1ilNlwlbElwkdybhlS63LjXyh/SJa9E3zRdaanDBoazzVK3dmTgl/jZbuuKJgNtnTqDOh3Z55wPT10pU/Ln8puoKZOrG7XTI2zSSyHrjH0L7wm04HirvPzCQVkqCay7eg3svWjEPVZwP3As1kcPRJljepPjnQ3h6JGoXomRTHo80/mMajvZT3N83U8+JeoAnABQA8pp81R3mw00LU/JXlrzKlL7ooorNoKDcSAkzni1z5u8MlEkCiEKtNyIGSNZL2me3ilDSWfTP/LVrxz0g8XxIIXvuJlFyb466D41PlEG97+YTxQuvcNM4ouaEFPgyh89WWIpRihdCrmuxL5FfkHsiYa6jOHW/FA5E++jSkL756NgP6Tx6o7J0kLrRlpvqLhBChsWct0BeRxZkLEpazAUNOtQxyfMBON5Egb7OdzjPHCNOO4hAwqueX0C6EXW2SQ6svFF4jJxGLM2N92cU1jw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJqcG81UVcyN20veVl4MDYrVFdYbmJpZHZnVG5yQXVUYko5ZExKYzQzOXFN?=
 =?utf-8?B?MFU5QnZmd3JRclliWU1aTUllU252ZjNBNzVFY2UvNHhuY01ZYU1lMEIvVkho?=
 =?utf-8?B?ekZRTi9xRURYYW9DamsybW8vZVB4eWdPOFVXY2dJL0g4V3V6WGFZV2E3dWds?=
 =?utf-8?B?U1poQVFuQmZOY1ZXdmc5NmVidlJ6WTg5S1BuUkhDa1E1bWJuNVpBSm9oWERJ?=
 =?utf-8?B?cTB4Y05yMWpmbWFtMzJzZTZ2M3htQkRyZ3h1enYyWCtrQ29OTG9KdU1Eb1Nn?=
 =?utf-8?B?NVRnMGYvcDlQM00yeXBaaVVXajdnMU1Vd1UyMHgydTB4M3o5NU5YYkpGeU5V?=
 =?utf-8?B?OXZMbEp6cFdXTUNKTmMxd1A4WUF5WFllMVJyU1NYaVNTdFo2Ulh1V2tOVkl0?=
 =?utf-8?B?UEVXbVBaMGhicW11Y0JwRnp1MFV6cUxHRk5tc2o5OFZwb1VJY3Q1bjhKelVu?=
 =?utf-8?B?S1V1VWU2OEdGbklpRW0rN2xkc3pJdHB4ZnFNU3Z1MW55ZStMSkd2MmlMbmsz?=
 =?utf-8?B?RjVzMitJbXJoUTNBYWIvSWJoNG5VeFdYQmJmNHB0NzJtZWVobGdRb1BzTTE3?=
 =?utf-8?B?Q2l2NW5oUnJwUVpMVlEvMFpHMExSVEJmV3ZJRlAwekhmMTYvUEZIYkRNc1Ur?=
 =?utf-8?B?NXhPekpVVmpFZGdHTVUvOHplS0ViVndzdlk5OTBkK2NnaTMvcHdiQndURVJ5?=
 =?utf-8?B?T3ZQQ01Qd3cwY3ZuZXF5UUhuV2JkVzB3a3hIdnNjaEg2ZjY2YmdPbGJISXNE?=
 =?utf-8?B?NVBFWnN2VGp2M3JwYm1MRFc4M3JyNld4VlJwdUsweUVGNTRWUXZLdXROcjYz?=
 =?utf-8?B?RVA5ODBUdUdPUmVRL1Q2SlFaaUJteUF6M1F4aFRPbTBvYWFQZFJEMWJTWENv?=
 =?utf-8?B?Y3h6QXk0bzc5bFExK1NIYytlRnZ0NjNXTElGaUZFUkNSNnUyYXJXSHNHVjZm?=
 =?utf-8?B?NnVuQ0duaGtFaVV1b1QwRzlFalR1eDdYVDBCRExzRWlDd2xBOFBGc1BjSXZ6?=
 =?utf-8?B?TktaQ2dIZGZUSHBhK2wrZExlTFJ3N1JDM2QrOHNYaFFyeFRocjJVMzllNzZ2?=
 =?utf-8?B?ajZvTWlqODJoeldDWmFsV3Vxa1VWZ3lCYWxPWkNLYWRKc0xGWmUxb1E2SFh3?=
 =?utf-8?B?akU4R3lkVytWRUJzNHcyWkt0Yjh6cmtIcnFHMjZWc2hBTEE4OXRqclhHVGNr?=
 =?utf-8?B?a3dmc3NQZ2FlNk9HRUxwNEhiUFZwREdSK1h6RGY0YTR2b1YvRDhzWlV5Rkh1?=
 =?utf-8?B?aTJiVm16NTliTy9Scll5QWZsMU5uMzN3ZGo0OFBidWk1Ylc5NzRqcXJLcXBI?=
 =?utf-8?B?OWExOTV2NWEzU1hSaG12TEhWaWVVSHVFT2FCOVpsa2FFdnRMb3ZVZ1RSK1po?=
 =?utf-8?B?cCs5cjNuRGRIZ0Y1d2dvMWxnZjQ3QkhyanBQTWR6L1NSUUdEdDhpaWxya1Bu?=
 =?utf-8?B?Qm1ETXVPK1kvdTVKMEorSkw0OWJEWTNDMHMrYVVleDFaM21LQlpvSXVOTTJp?=
 =?utf-8?B?Rnc1N3FzK21Gb2RaMFo5bWQxUlA3M2x1MGlRN2FFc3o1YWluU3k3MEFqZVhL?=
 =?utf-8?B?TFJNNmdzQWhMVEh4RlVTVngwNzdOd3VZcEs0eWVJTEM2OFVGMTk4dUJLYmlY?=
 =?utf-8?B?bXNuaTgvRW9weVlOWWFpaGJINmZwaEUzTktNbk1NQnVjSmdoTEV6K0xiRGlI?=
 =?utf-8?B?b09sNkFHMFdnTDU4RHlHTzRjVjFoV2VIMFdXQ0YzbU05a0NjQ3BFNCtQR2Z1?=
 =?utf-8?B?eFBXRzBYSEQrODhEcHQ5RU5Cb296ME92ZG1Ud09zbHFldDV1VktsdUxrMkZh?=
 =?utf-8?B?Z25XSW10TEJ6c3BleFdwdHJxcmp5Y0RTY2t1VzZOcndxNnc2VFdjRndzMkx2?=
 =?utf-8?B?TkNrd0FhSjlKQkFxUEZtSjBTbDUrNDgvcDRNSUwzejdVN2V2dWJkS2ZHZWp3?=
 =?utf-8?B?cTBFazAvQ1o4QVZKQU0zaU1FMXdaZ3kxNG9CK3JVdW9CVXRySm1UWGFmVEtw?=
 =?utf-8?B?cGxCYjczUlNDa3QxTkgzTnhZNkFwR3R1UCtLd3Y0V3VRN3VSc2Y2cklEUnNM?=
 =?utf-8?B?eG1qMm1reGsrbGJaallReC84UEp3U3ZnOVBHZTZsUjBwekZxcUFkTHpLSUlW?=
 =?utf-8?B?cmZCcGQ5bE9FaFdoNEpLazRzcmtvV0J5YmRmaXR4UmhWd09CMnFLaVpQODl0?=
 =?utf-8?B?UEZ5M2l0VEVKbmdERUloRjBCUWxMMXIycmtNZFVEK2VmbTRlSWppNnc0ZEpK?=
 =?utf-8?B?MGlsSEtYd2NIcFJoMk9kQ3g2cVd5T0FzblAwSmRSTnpvNzE1UUZKMHNNUEFG?=
 =?utf-8?B?bmY2SENZZnpZUzNlN1dGZXhWL0prWU10aG1oa0lWVVRvd0ttaTB0bmZmYzB0?=
 =?utf-8?Q?vDkfRdy03eUrcd10=3D?=
X-Exchange-RoutingPolicyChecked: HAuwH02KmcAHbbUcOWscNcsPgO/2cG7gyvr983AEjG21Fe8p1BihzVk3Xb8GFleo5hpr6K3bTLbdGw0Vq5UeW5UBuLB76k41bnFZXqVnVzTxZ+gREWcWzJ4tXK1erC6GbaaVavRo2c/vlrA6rlemBAvmPZhJo7JSiEa3Dwvmd3kVQf1Eg+GZXG7ojAZvxu2E6F3+HrGWSHMf0pSbuLAa3n9E3iX80QPxUqNfUfJf6dfPm5Z4XUnDfdd6poYWMlAK6s9blAzJMupVVvckkTRj1jl/Yn6qeNHNZ2zWRn9hgyEgMVgZ/X2ZO0PFy0pn9ztLqM85FHnKzocm6owvnjFcjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d0fd39-3247-497f-2ab5-08de8a5992d0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:30:45.4743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA7iPDcL5WoQFyM9H/+PpDEdQEjBUuSQUsvK+9HcQt88JJ6QqRrXNboSSbW7YJbr2NjNP0jijJw31WNUi2685mtNvQofIhEBTzD5buSPWX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
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

--------------WjICGSgLmzkO2l5xobXseHJp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-03-2026 02:55 pm, Michał Grzelak wrote:
> gettime_us() on SNB and BMG does not return proper time after starting
> suspend tests. This results in too many suspends issued before we hit
> the duration_ms. Break the loop on second execution.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/kms_flip.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index f17d027cc..3c5428ff0 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1322,6 +1322,12 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
>   {
>   	unsigned long start, end;
>   	int count = 0;
> +	int devid;
> +	bool wa;
> +
> +	devid = intel_get_drm_devid(drm_fd);
> +
> +	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
Why only two specific platforms?
I think, platform specific wa not needed here, instead we can have 
generic execution for all,
which can work on all platforms.plz check.
>   
>   	start = gettime_us();
>   
> @@ -1342,6 +1348,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
>   		if (count && (gettime_us() - start) / 1000 >= duration_ms)
>   			break;
>   
> +		if (count && wa && o->flags & TEST_SUSPEND)

if (count && wa && o->flags & TEST_SUSPEND) --> if (count && o->flags & TEST_SUSPEND)

> +			break;
> +
>   		count++;
>   	}
>   
--------------WjICGSgLmzkO2l5xobXseHJp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-03-2026 02:55 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260309092528.3336467-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">gettime_us() on SNB and BMG does not return proper time after starting
suspend tests. This results in too many suspends issued before we hit
the duration_ms. Break the loop on second execution.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/kms_flip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f17d027cc..3c5428ff0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1322,6 +1322,12 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 {
 	unsigned long start, end;
 	int count = 0;
+	int devid;
+	bool wa;
+
+	devid = intel_get_drm_devid(drm_fd);
+
+	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);</pre>
    </blockquote>
    Why only two specific platforms?<br>
    I think, platform specific wa not needed here, instead we can have
    generic execution for all,<br>
    which can work on all platforms.<span style="white-space: pre-wrap"> plz check.
</span><br>
    <blockquote type="cite" cite="mid:20260309092528.3336467-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	start = gettime_us();
 
@@ -1342,6 +1348,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		if (count &amp;&amp; (gettime_us() - start) / 1000 &gt;= duration_ms)
 			break;
 
+		if (count &amp;&amp; wa &amp;&amp; o-&gt;flags &amp; TEST_SUSPEND)</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">if (count &amp;&amp; wa &amp;&amp; o-&gt;flags &amp; TEST_SUSPEND) --&gt; if (count &amp;&amp; o-&gt;flags &amp; TEST_SUSPEND)</pre>
    <blockquote type="cite" cite="mid:20260309092528.3336467-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			break;
+
 		count++;
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------WjICGSgLmzkO2l5xobXseHJp--
