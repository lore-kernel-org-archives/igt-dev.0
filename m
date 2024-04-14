Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED35C4345F
	for <igt-dev@archiver.kernel.org>; Sun, 14 Apr 2024 05:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913CC10E9E8;
	Sun, 14 Apr 2024 05:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIY0bJqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B3E10E9E8
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Apr 2024 05:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713074349; x=1744610349;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zCM6z2ZPrttK+gjsoLN6dxPxaUGNSRhWB/f1liwD4lc=;
 b=ZIY0bJqkQWSZA8kcfZ7kkZ6Z2uUqUl07CmmwJUu5oW16ZCi8ZvY6Lekq
 plmJrMeNwfhXOU0nrGRUF+Mfdyf0mykFWENPgAhcvESVQRgd/j/yzInSJ
 Dtl0IV+iIGwPRPnn3xi9BNaT/1Hjdgm0quYPleMHtL297pTNKG4K5JSY8
 2mUA7BqjUnUdH4HHC4gbyn8W1jsPJ9Tg6tlzR2f6sjrPzFJLmJtuoBuWe
 laI6/brIqciVGVcxYmEZdrJvCMUDfg1tWlZqqf4mGSQDD9tndcGKOR0RV
 C25sBnxTfjGYdjPj5lQXkbfyeExRSgewbvpH1gi1vcfEyIbDXTC/YWx98 A==;
X-CSE-ConnectionGUID: 9iF8iJ8ATJ6geMl98eEqYA==
X-CSE-MsgGUID: 7IDcmwzWQ9aoRcyXoErcKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="30960910"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="30960910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2024 22:59:08 -0700
X-CSE-ConnectionGUID: HH6GUwrWRg+wFZbaafpK8A==
X-CSE-MsgGUID: h9f2VHj+TSyFV+hFu+mRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="26248794"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Apr 2024 22:59:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:59:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:59:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 13 Apr 2024 22:59:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 13 Apr 2024 22:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeVcI2idZk75HSI8w1dCLyQN5TQqJ5LAFJ6q27hLAECL1Qzz6Cn1L9xvSPV0lQym4aA3o8++LjtPgnTZJ+YEtJqXpz0t6USU05sOEbu2PALcw+jkbjhI6PqqfwwBScW8GXhSPd9GjI0AzEwB0B1fRQ/Psyc+M39IBp7vgYijBLZnQ4dFceoT6ZjqZjf9wd/ViimyopZ+xc5wAkrjVoUiH4yTNQaypXfkDqh9msYW3xGd1vPsis7DI82XerM4ynZ91XQTh2Zg5/24+Mqb0NHIkDyzgGwaOFnR1ptAPCHq6I3PnkDGN9PUg1ph33kfUbmXwdVg0J7WYFEJ4HIpDZwbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cih0txZK66fo/yqVC0ECR+nlk3Qam5FjYUx/UqdJaQ=;
 b=lIAHj9ghpNKqzxmK9MO5gppON3LeRNFNtAvY+L9QdGuyLBuOoI4sT/h/RRZFueSnrnQZ1vN8yJP6DKvuIleQ6rVzvAi8kQwa7IybiWVIgzPzFadxPxe3G7rSozSiJQqROL9be85/T5pa+wdKgszK5crMeC11EVloM2J9z/3gcUcqAP9/RCeVsJxNHgFrymoPfg5J2HCUh+LiT3U+/R8GAyW6rwFOpdFC2XMxWWd/mTTnxLTroG1RxYhoJ7oTfIXCu87ke5WIF1kNM0G2/+bk5408abrwqXzZaVdpeycNkuWDTD421dznA23nkerm5S3gmp3hPXkKkdEAJa9YGYwXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Sun, 14 Apr
 2024 05:59:05 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Sun, 14 Apr 2024
 05:59:05 +0000
Content-Type: multipart/alternative;
 boundary="------------gq38jygzklxLrahZcm0Yx5vE"
Message-ID: <6b70a933-9baa-4a5d-83e9-90ec02670538@intel.com>
Date: Sun, 14 Apr 2024 11:29:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] lib/kms: Clear connector_attrs[] upon
 setting the reset value
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
 <20240411183450.6417-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240411183450.6417-4-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: BM1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::26) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: d372c67a-b5ce-4dac-1f8e-08dc5c47fdf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tsRdEsxmPL1zTbiNOurG94QLCX/NN7kVsL7owgcCljZlVarSLwLQEzfJGnlnRkrtW1jXPfICL4/ABOHqGf71SQg/TA9Nu/ZXmsVD5/RET59yq1VUyNJ2A7CBha6mfOMhIKrQroxV+ym5OWZGIDel+f5lQx7CMAdTNiSKMZ3yt4crzu4209ecOWq7/WmmOM8gKK4Bc5tlhBXsJvRvncCSe1hh7oPaQ72pLE9oyNgzAx1eAK4e3PKzv3UnbY+ywjSVI9R3OqXNo461heKTbjgVyBrHAwLqejH7dPwKJwB8PSLpServHFkO2RNsoZjqhwvGw6mrWVOGesnpjXHDsw7x54gFwutakdr6oc7Ovc8F2XN4T9ulBGDJnQNGus6QGfyaP9+UMTH8q8Q5e7DmFET4dNN3CKqka9hKsY7G2hV5Ef06qGnM3MaXdCKXwUbmuzAROdTZ6JujZHZbaAeJsOJ8WAf6WAr4uh2JrEeY66MZ+/dr7q7PCRxuDd6uaCGnqlePlRE2moy1Bj7ljYa7QTQhVauW/3rj33q8P8n1sLKrOu19Iz79Okmq4c7Umjti/FFfO/lnQZhL22Gb5N4AE3+tkTtV3tePVGqJ6scmuaIh0ED1RdW1D97aNbSQuck1tcgEl+ZP0u7mmWiji9VDDXdBwfQzO/AEN2kFg75t9sKy7nQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0lUUGN0VjJWRnBHSkQ5bEYrdFl3a2xXQldkZmc2QkZtZzFsN1ltekZvTmkr?=
 =?utf-8?B?eXI2cmhJK2t5RktOK3B0emFlck4zUDNtMGRwd3pCUUNRbEdJSlk0endDejFh?=
 =?utf-8?B?YmFXVXdPcWVPaCs4SCtiLzJ4VG9TK2hLKzRFalBBV0lrdm9IVTBrQitNZGFx?=
 =?utf-8?B?aDREdUt3WlVkcWpaOGd0eXVFc2JSUXZSejdrMjNXWm5SMHRjbVMrQU9QWXN3?=
 =?utf-8?B?ZU5Pei9xWGZnV0pLQ1Nsb0thZWd3UU5udXlKUFZQQkVJcHZDL0lxR2d0YXdw?=
 =?utf-8?B?TjU0RGVocjJDTUlndUFxbDV3a2FFa0xoV2JSaERJRnFIOE9mbnl6SzFSVjNR?=
 =?utf-8?B?SGtaTU1uNGdlTWw0QTJDc1h0V1A5bWs2M3kvK2RZazhFaG5NdGM1Y2l3dXds?=
 =?utf-8?B?Rk1zNFNtbllqT3duQTM2endDR01mUWFhNlRaTnUyWGZCZE44NnRKaWFCRVps?=
 =?utf-8?B?Vjg4SzBYR1ZDYXA2Z2dRdjAzSE9YTVZCUXBML096dlNKUjVuR3hRVjRhR3Bl?=
 =?utf-8?B?eUlwTnJ4M1ZJZUl4R0FxNTJZajkzMENXYXpKZ1hRMWczZ0tXYVBQVWV2U2F3?=
 =?utf-8?B?dzhxWHptZHNrZG1hZ2gyUjlHV2dJNStIa2ZDL3NLU2lOcXZUU2t5TUF2YkhL?=
 =?utf-8?B?VFpCcmhUM29xSTJKQnFGV1J4YVdFNnEwS3NBamozQnpKWEFrTWRNemZpMXdE?=
 =?utf-8?B?VW1xeTMzV2k2UnEwL09lL05DQkVmc1BacHduRnJORXFUU09VUVdmWDdhQWN2?=
 =?utf-8?B?NTJkM0RQOTY1M3J3RFJycnVEdVgvZGtLazMxUS9xYUFNSW1zWTF4S0pBV055?=
 =?utf-8?B?RWEzdDBoYXVOMkJYMW04Q3JWbTZxUDd6cEtIekFwWXY1WWRNeTlIUWZNbGVX?=
 =?utf-8?B?b3R0a2RkVFBFTC9mdmJyVTNmdm5lUmlOWnRBYkt2ZUNWY0lnbE41cjFubmEr?=
 =?utf-8?B?b29McGVOd0RrSzhURVhTclBFOTkrSTV3V3JoaVo5bDBadElvMnBPaUwvS2Z3?=
 =?utf-8?B?eVNWNk9DMzhEcXhGeUhtWlgrVVJOajY5c0ZhNGh6MEN5cnVqMGQrK3poQndR?=
 =?utf-8?B?ZnB6OG5RcmxJVUV3SS9uZUVQc1VnTzBnWk1VMHY2UldPUTFxS0VzUmtNRnEv?=
 =?utf-8?B?cjNIQTdRRUM5TDdwR0pKSWtzVnp1eFo1MjlhWkV2bS9lQkJTTzgvN091aGZC?=
 =?utf-8?B?N2N0VVdZRWxhdU5VZnJLRFVoTEMvN2s5Q0hVSWFOODJtWEhFQWFQZmhFR3R2?=
 =?utf-8?B?UlozRjJEWTBOZklwWXB4clkxV0FkK3RqWmhsK1ppNWxYU1lFN0hnZW9LTjIy?=
 =?utf-8?B?UmFHMGZKeFc3aU0yQnV2ZEVYQUtLTk1obGplbGdOeXF6WE00OHhPdFI1WGVY?=
 =?utf-8?B?Q3FVSTU1VW1SVjBRM2pOSnBlKzhCSEhtVi9McTE4eEY3eEZtNGR3akhMOEJl?=
 =?utf-8?B?clUzbDU5Ni9PeUdYY1Bud3o0NDhQQUxVNEJpT1V6Mm9OU2l3aEEvWWQzVjl4?=
 =?utf-8?B?WTR3Ky8yT1lBYkZoT0tHYVp5VnQrMmxYMFpId2dEMnNMVUpYSStFYUgraE9s?=
 =?utf-8?B?Ujgvd2ZaWlJ3R3J2Y25vMlJ3bDZDenJManREVjA2U0g2Q21nRzZVSy9yMmlC?=
 =?utf-8?B?VCttWGJMWkVSbUxHWlFVTm9uNUd1RlRSZ1BjcE9ZNVdDNFg1UW9QYk1iZXNy?=
 =?utf-8?B?TmM4WjVGUjFmM1AwbUhLSUl6ZFBqbnN4bXp3aXhhTU1vNkErcFZja1VqTUxT?=
 =?utf-8?B?TnovV0k2cU15VTZIcjdBb2NBeEcrUGJPRCtjNkM3STBJSGFzdVBobENXNE9Z?=
 =?utf-8?B?SE52OFp4U3hWdldzZ0NPd1RZNmRTMldqWnpKdnhQbDRkV2NPbWpDRFdOd2RF?=
 =?utf-8?B?NGZqM2dUNEc3YnQyeVUxUW5adEVnRnVVbXV6Sis2QzRzMTh0ZHRjQm1VT1ho?=
 =?utf-8?B?djl5VUVOWUhyUTA0MTBGeTZkc3Z0YlJ3dDdRMkZxSkNFbWtuZm1NSjNrU1BK?=
 =?utf-8?B?U0FYa01SaHlBcmxCOTg4OUtwdlUvNFN3VjBRUEdDNFRzUlVXQ0pNQ0x5Wkg5?=
 =?utf-8?B?Z0k1dStNNDYrbjZORGttczN4bUoyQUFMbUl4d3g2SGpNbE1iNHdmNVZXckYw?=
 =?utf-8?B?N3VPK1E5b1FNUVU4SDN4RVV2YXVOdzJRNjQwbmNvZUFrRHRFRXBzM2RYbnRm?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d372c67a-b5ce-4dac-1f8e-08dc5c47fdf5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 05:59:05.6318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfJensCBRJ2klBpaiIwPc2UEGRTuKoA0tEkVXdimOQ5qStdoIK7rDCtXaUB6zHndT9y1t5KvoLGgg2HulFv4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

--------------gq38jygzklxLrahZcm0Yx5vE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/12/2024 12:04 AM, Ville Syrjala wrote:
> From: Ville Syrjälä<ville.syrjala@linux.intel.com>
>
> When anyone manually sets the connector attr to the reset value
> we can stop tracking said attr.
>
> Cc: Kunal Joshi<kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä<ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------gq38jygzklxLrahZcm0Yx5vE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/12/2024 12:04 AM, Ville Syrjala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240411183450.6417-4-ville.syrjala@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">From: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>

When anyone manually sets the connector attr to the reset value
we can stop tracking said attr.

Cc: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Signed-off-by: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
</pre>
    </blockquote>
    LGTM<br>
    Reviewed-by: <span style="white-space: pre-wrap">Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
  </body>
</html>

--------------gq38jygzklxLrahZcm0Yx5vE--
