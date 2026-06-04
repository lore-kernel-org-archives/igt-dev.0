Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B7ECD6E57
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 09:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60705113E1A;
	Thu,  4 Jun 2026 09:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPgWRch4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8F610E5E0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780564190; x=1812100190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=z8VAzavTO+G3j5G+fX0GpId6Mc7FIGbMcAyGLXsvjG4=;
 b=JPgWRch4/dIy2V2bBZv7QWC0q+79T1C80nEDytB32jgPhqlSUa4zrS0N
 05tROBt7lYJE5aiXXgQBFsad6YRW906Pl150t9/efuiAGYlFgMFWXqFNG
 P3LzMAOAhR/xpy6gO45DE7c7Kur2zci6QLi6gKO8t8fUKxKm5Qed89SG7
 dgWzJwqE5JGjMzcs/C40mgERv51Gv+rQ9/7lJg8vv6zhifignEO33hrEk
 4Sd6xHN0vPY7/imfFpIIg0n8S7R7p3efWrmRq7x7ydRLXqb0npVeloIRJ
 xQyxTg94iXxVVw2YAgDnGUlD2uJaEE8+G9QYbaIb/s7kM0nSz5a6nxhAc w==;
X-CSE-ConnectionGUID: CpiWD2juQLeWuzU6rsLKvQ==
X-CSE-MsgGUID: ORnmfukuRIGPUpM5kDyGpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="68926449"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208,217";a="68926449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:09:50 -0700
X-CSE-ConnectionGUID: IcXRTLL1SZGRQ9g2NYUpDg==
X-CSE-MsgGUID: GW7Mz0CkTimflililnaFoA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:09:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:09:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 02:09:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVXwxHGbC8QT02sQcDPqzOnz2bOrCY0Jpq2TNpelt9Fe+wivnO1O3px0A4gJhcN7qQxquPwCj77T7QtaACgZrosO4OP9F/blAeAreExXsQS/AoGF58VFkHsLuil1Ff1uRfr36ZgFgkMaBaGPrEOs1fEx5FLwb4MU/jG3hXNMYWTbvZehaupTrmuAFAexCeIT7ehWaejeJsNyKjMYPuQV/zHgo5dgGLm56Xflbj8RDn9bwunuBUETM8DHgy/uRs+/ANQTYNuUM1XWroBCF2rRoFyp5qDZnliJSxNzSGYyfNOog6MF7+XsdscmUFDFm1vZqI38lXtD44ja7t9phkE+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QTJbuMX7m09Qwox4U4TNGDADgT9v40v89zWMaDNkXE=;
 b=TClVn8OanX5XDhHKnOI8SAzOBxX52367KbNixwL7MAPpqM8DIdb9qB+6ee4Pj9FlaY701IvvhQfhLREAp9moDiydpb/bWSo+Q7nLSLezI0W37NT+A0ZuE4q34kIvKjJDf+aGRpBFuF+218GxYdZOxNSzIfTMSOiMBLqRvG0o7OIvfuhNPswgAJihHA91l0JtnV4zM0ANaWXjnvJNzu4Ek/tihxeE9yKV4/U91basDg1GuF3C6frY6nXMw4bpcDWf24sL41WsG8/DIqzt/ITukZLf2DrC9SxG0ZOQ7E5AH/ieWoWwQxUVJb9ldT6t+jkmfYA8hoy3MgABBwrM50TEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:09:47 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%7]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 09:09:47 +0000
Content-Type: multipart/alternative;
 boundary="------------jGEZM4ArpQj53Dyv5AAcBzeG"
Message-ID: <401a1dfa-1a53-4aba-a1d8-4ee7cf7914a3@intel.com>
Date: Thu, 4 Jun 2026 14:39:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 5/7] tests/intel/kms_pm_dc: Add dc3co framedrop
 validation test
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260527084915.1916365-1-jeevan.b@intel.com>
 <20260527084915.1916365-6-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260527084915.1916365-6-jeevan.b@intel.com>
X-ClientProxiedBy: MA5P287CA0216.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::12) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdb21ff-37ad-4e4d-7203-08dec219065e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|3023799007|22082099003|6133799003|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Di0vaPetoy1Cdo6c+E9anM+OZEah9E5fCbPHKtvnHlriDJulusqJJxTl96Bpkz/GlrMuNFYOXjFNIXpmuVdSn4l9rJXrpI2BqCtD21/eBp4O+LBKIxKuGMRup44VlQjRd6efyR1QD+zflDfUsYfUEQ6A+Ggy/UUDICex2rjaAVOvavsrxK4fGvwWTI7DVdRYGZxhNdJe0lJbKqz44gU8IvFwOOrZKOzsX7KgIiVcg/h+BZQqgygs5Xl0cGBOUCKrUyGrJgQP32OcjxAw1PkZrvCTXlcD1wRmJoiYLB1rNIAIJKsY+RrraP+GlhN4B0ynDsgfwviQQRunT2R3upB1vpbXCRfbTVqfRHzegJ03H/q5XXJZRAnDrrvCGU4njkA8lTSOq0Z3PGDhDlR/5FisluamXddN1cLCiJOEnw6T5Rtpk03HIId5Qu/+ttkJ+dLJQ5X1L/JiDnK8Uj2CqyBxqkCuPygWS1JjJAPN9XCcYODn1QesrCQGL5Q64idVpuqj6kGwjW7hGfBI9NULdUXduJr5hg0HR1VuY6s1V/n4XYqIzEEPUqbSR4SvPWwExPizUFy2Ylnb/viO4Ibwe2yE/5lFxJKDZzcCAk9gpGXiVwJeygWcjNahYwCCr6iIoKN/HwhcGTu8wRT+YRVgxCFSOwYydT0LzNULRbLmM8YVuP7eNXXYK4nRNjNpP6OJohSs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(3023799007)(22082099003)(6133799003)(4143699003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VlcTgxNUQxcC9kVUYzYm8xTEcxM2hBRXlSK21qZHl6SUEvMjNtWEdQRlFF?=
 =?utf-8?B?cW1YYXpOYklETm03OUptUVZCTmNacnVnTEpiUTB4L0lNTFJQMTZnSEIvT3Rl?=
 =?utf-8?B?S3QrVVlQeXBsS21mN2tUcE1WLzY2aFVjbWltWGZzU1ZMSG1jSXpJdDQ3c3NV?=
 =?utf-8?B?bVlYYUpaWWxhV0FNQWc2anpReGtmVnp1cFc2bHhBRFhoOGtUZytISHhTOHVX?=
 =?utf-8?B?S2JLQm0wVnZRb3liNm9hcDVaK1FHK1BoTHA3QkM1YUU3QVNEYW94cmRtUURm?=
 =?utf-8?B?bHRMV0VoT1FoYStYRnFjQWtGMmlPeWFNV2hmeTh3MzgwVksrTzJrZ1VWRUZX?=
 =?utf-8?B?V2dqS252Zk91NWxyVWtLVkc4dmFmbmFEb1V0QVNDZ0MwdVlCeEdBUXlpcVdr?=
 =?utf-8?B?SDRJKzJsSnpNOSsvd09PSW02WU44UDdqN0lpME5oaDFFK01pUnkvcUpGMkVk?=
 =?utf-8?B?VEhrQzZSWjQwaGJQRkZMbjJENWo2RXdRT3QvY1dFc3Z4K0NRTVFWNENPMTJm?=
 =?utf-8?B?bXdPQXl1ZU9PWjZvS2xXSTRXdDBpaEdzYnRtWWJMbUQxM2V3bndIMktVUFFM?=
 =?utf-8?B?ZlN4ZFNwU2I0SThKLzJKRkRtRytCWjdWbmgvZkg4TWRZZ050VS9pVkpkZGd3?=
 =?utf-8?B?SHVNYnk1dHArb1NGdUJhSXdtOEltODE3cHZOWDQ5OUovTzZiRzFjWFNmeUR1?=
 =?utf-8?B?RE8xbnBmUzBTMlhYV1dvMlJJMFdRNlpzVUUwZjIrK3BvVWNDc1VQYXRuY0pi?=
 =?utf-8?B?dXdqRTRtTmFTZXNrRlpxUWVnWTBzOU0zTU45elNCVWMyWFNZZDdhZmVZTDhX?=
 =?utf-8?B?YnVzSktCdENGMkJJenV1azlIamZHdVM4UjRqYURqZUN5dWpGamhlcEFTVGs2?=
 =?utf-8?B?UTZEamgyNEN1R2xIOGVmeTBPYVBpZDh3R1NFdmdOeTlySjFFMWx3NWlUZlov?=
 =?utf-8?B?OEs4WTZsOXIrcHpvTlhZNVRsQ21FQmVPRWtMd2t5VGhUQlVuMXg1UEFVV1h5?=
 =?utf-8?B?anJYNzR3VVkrdHl6TkNCWEVvL3padUJpNEVPcXY4R0wxeXh1MVRZTXplRDZ1?=
 =?utf-8?B?SzQ3cWlMR1d6L05YKy9PbzZvdXU0OTZIUWxkRW03eEo0b3ZkVW5VSUFKcjgr?=
 =?utf-8?B?Sm9DUllBaGlsOFVXUkswbVlaTk5lNDM1Z21xREtvaUd6cWlJblNHMmlZdWVF?=
 =?utf-8?B?QlA1aGRSTFZEZW5CQmtHK1FqUXpBa1lSeFY3Q2wrWmRRY0Jldis0QXJkdm1F?=
 =?utf-8?B?STJMdHRxaWxVZ3FzTWdtUzJGOE50dTNxRFdpcnZ3QlFkZDRLYU84UXo4Z0pn?=
 =?utf-8?B?SCsvQ1RFeFFsN2toZklxeVhzV2VKcTFSUjJPSTY5UGF1V3BpTzFQZnF3T0xY?=
 =?utf-8?B?MjAyTmNRdkJROUxKYm94R08xeFd5aTZiQ1JyV1BObHFyQmRoSWFjYXRNdW1E?=
 =?utf-8?B?aGlyRjE0WmtIaTkzTk93QklaUXI3N2dnR1I5dTRGUWhwSTQzU0pKWUxIV0M5?=
 =?utf-8?B?Z3dUdzA1ei9BTENJclg3WnpnZFZFd0pnNG9ienBzcTkzVWRaRGxydUNpOVZK?=
 =?utf-8?B?dmhFcnpUNWx0eG51Y281dUFGNWZmWENZVzFqSjUzK1RBRXFqWjJuKzdzZU1L?=
 =?utf-8?B?VEFnSFNoMzhKTHVQZEs1YkNURUU1VndhZ1kvR1BZRE9GL3NjY3h6RmRVcGRZ?=
 =?utf-8?B?ZjlzWFA2bFVGUXBqcENkb1RpbGtUZVRuQTRXaDI0b2hseC9Ma0hKMExNRkpY?=
 =?utf-8?B?ZDZpUWlNQWpQbW1zMndyazQ1bzJOTWlkZzZaU2U2SnVKdi9FT1pkZGJmRUEw?=
 =?utf-8?B?eWlraUJ1c3JNV2x1QVZzMnBlUDQ5VGM3aExNM1c5eXd1eWZrMVlldWN5VC9R?=
 =?utf-8?B?WWV1Rzh2cVBBaEY4VWZCcittTUZkYkhuQVduWlFNUG1BSXZZcWs4VkhaZlU1?=
 =?utf-8?B?MjVtaFVWeUdTckwzUFpDWXJNWURLYkV0NFdjbGNiUmpINHBYakhLQVF3TUox?=
 =?utf-8?B?Tis5L0dsL2dqeTFLZzJEMVFmaEd0YUF4ckdWUWFubVZ4Q2ZUbW9aTWJBN0hi?=
 =?utf-8?B?WEw0Q3dRTGhqREpWRmhrWHVRSmJHTlQyMnFUOUR0MW1Gd1BaNU1sbFova2dE?=
 =?utf-8?B?a0FCZ0lsOTBjNlcxMTJCUVo0SEhHalFOM2ZrRmk0R1hmajY2RElHa1BJNGZG?=
 =?utf-8?B?WVZLS3ZmNjhMMGc1dHA3SU9ycitlVFZkVGdIbSs0WllIMEhidWZvVTVGWHNB?=
 =?utf-8?B?OXJBWTJocncra0M2YUVyZ21XbHBhZ3J1WXF1ZndkSzdrdlExL0w5UHpXbnJP?=
 =?utf-8?B?ZDI5Wk84eDNlZk0xSWVSdmhrZnUrWkdGbjJiSWU5a0R4RnUrd2ZRSnlNOG9j?=
 =?utf-8?Q?3cL0TeSTHGpcWMdQ=3D?=
X-Exchange-RoutingPolicyChecked: hKZtBZfdA7Ql/h+opM0VqV1Vq4nmRToiznkdEZKNe6IDKhi5XB9+3sj2aRYvW/ZEU2zDWDqvkiSf+/MecnNaiZVZiz3rTVmXDgamYQmq2gkm+MxyukwGTI0dtmBR5PMaFJNOu5vNmgNJg68Gq3qp/5X2RD/pBu4lEMQgxj0bhaGlnwpWdBrrn54zZfKQO7DK3ru7Tctxrp8r1TocYAWyUhZzmXE4lqRo5HdBZmdpMK7xaSpLudQxurg/xPCwWp4NsVQM9A4FIc0JBRuyxINSoAXS5lqGaas6XW0wL7u6oQkh/WoyC016RAEv8IrIG05UXdDVIeZUZ/nbkDW44jlFkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdb21ff-37ad-4e4d-7203-08dec219065e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:09:47.1969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXfZ/312McFwvhDCPbH4OW0s2PrJeN4JHjwtbUg2v/nG19TkUjvulS00EvHZTMnT6dq1NNgfwfX1qEUX2b9l6tusOh9bej8w9P760tEcJs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
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

--------------jGEZM4ArpQj53Dyv5AAcBzeG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 27-05-2026 02:19 pm, Jeevan B wrote:
> Add a subtest to verify that DC3CO entry does not introduce frame
> drops. The test alternates commits and waits for a kernel vblank
> after each commit, ensuring the vblank sequence continues to
> advance without stalls or dropped frames. Also verify that the
> DC3CO counter increments, confirming that DC3CO is entered
> successfully during the test.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 110 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 110 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 57dade47d..620ba9329 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -51,6 +51,10 @@
>    * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
>    *              system is in SLEEP state
>    *
> + * SUBTEST: dc3co-framedrop-check
> + * Description: Verify that DC3CO entry does not cause frame drops and successfully
> + *              enters the power state
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -342,6 +346,82 @@ static void test_dc3co_vpb_simulation(data_t *data)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static uint32_t wait_for_next_vblank_seq(data_t *data)
> +{
> +	drmVBlank wait = {};
> +	igt_crtc_t *crtc = data->output->pending_crtc;
> +
> +	igt_assert_f(crtc, "No CRTC bound to output for vblank wait\n");
> +
> +	wait.request.type = kmstest_get_vbl_flag(crtc->crtc_index) |
> +						 DRM_VBLANK_RELATIVE |
> +						 DRM_VBLANK_NEXTONMISS;
> +	wait.request.sequence = 1;
> +	igt_assert_eq(drmWaitVBlank(data->drm_fd, &wait), 0);
> +
> +	return wait.reply.sequence;
> +}
> +
> +static void detect_dc3co_framedrop(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_prev_cnt;
> +	uint32_t dc3co_cur_cnt;
> +	uint32_t prev_vblank_seq = 0;
> +	uint32_t vblank_seq;
> +	int delay;
> +	int dc3co_target_flips = 200;
> +	int verify_commits = 300;

-->Any specific reason having above magic numbers?

-->Define them globally instead hard coding..

> +	int committed = 0;
> +	bool dc3co_after_target = false;
> +	bool front = false;
> +
> +	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit(&data->display);
> +
> +	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +
> +	delay = (int)(1.5 * (1000000 / data->mode->vrefresh));
> +
> +	while (committed < verify_commits) {
> +		front = !front;
> +		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +
> +		vblank_seq = wait_for_next_vblank_seq(data);
> +		if (prev_vblank_seq)

-->From above delay, (Say for 60hz =16.67ms) but current delay its 
around 25ms there migh be chance of getting 2nd commit could be expected 
2nd vblank
IMO, gap of 1 or 2 would be fine,  becuase of 1.5x sleep time crossing 
vblank time boundary.
-->read,  gab =  vblank seq -preve vblank seq;

-->and assert it like-->igt_assert_f(gab <=2 or gab>0 && gab<=2,
			     "Vblank sequence did not advance after commit %d: vblank gap=%u\n",
			     committed + 1, gab);

> +			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq),
> +				     "Vblank sequence did not advance after commit %d\n",
> +				     committed + 1);
> +		prev_vblank_seq = vblank_seq;
> +		committed++;
> +		usleep(delay);
> +
> +		dc3co_cur_cnt = igt_read_dc_counter(data->debugfs_fd,
> +						    IGT_INTEL_CHECK_DC3CO);
> +		if (committed >= dc3co_target_flips && dc3co_cur_cnt > dc3co_prev_cnt)
IMO: better to avoaid un-conditional read of debugfs --> 
igt_read_dc_counter only if (committed >= dc3co_target_flips)
like:         if (committed >= dc3co_target_flips) {
dc3co_cur_cnt = igt_read_dc_counter(data->debugfs_fd, 
IGT_INTEL_CHECK_DC3CO);

		if (c3co_cur_cnt > dc3co_prev_cnt)

			dc3co_after_target = true;
	}

> +			dc3co_after_target = true;
> +	}
> +
> +	igt_assert_eq(committed, verify_commits);
> +	igt_assert_f(dc3co_after_target,
> +		     "DC3CO did not increment after %d flips while validating %d commits\n",
> +		     dc3co_target_flips, verify_commits);
> +}
> +
> +static void test_dc3co_framedrop(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data);
> +	setup_videoplayback(data);
> +	detect_dc3co_framedrop(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -693,6 +773,36 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Validate that no frame drops occur during DC3CO entry "
> +			     "while alternating framebuffers with PSR2 or Panel Replay active");
> +	igt_subtest_with_dynamic("dc3co-framedrop-check") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			const char *name = dc3co_modes[i].name;
> +			data.op_psr_mode = dc3co_modes[i].mode;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +						     data.debugfs_fd,
> +						     data.op_psr_mode, NULL));
> +
> +				if (data.op_psr_mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_framedrop(&data);
> +			}
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
--------------jGEZM4ArpQj53Dyv5AAcBzeG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27-05-2026 02:19 pm, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260527084915.1916365-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a subtest to verify that DC3CO entry does not introduce frame
drops. The test alternates commits and waits for a kernel vblank
after each commit, ensuring the vblank sequence continues to
advance without stalls or dropped frames. Also verify that the
DC3CO counter increments, confirming that DC3CO is entered
successfully during the test.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 110 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 57dade47d..620ba9329 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -51,6 +51,10 @@
  * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
  *              system is in SLEEP state
  *
+ * SUBTEST: dc3co-framedrop-check
+ * Description: Verify that DC3CO entry does not cause frame drops and successfully
+ *              enters the power state
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -342,6 +346,82 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	cleanup_dc3co_fbs(data);
 }
 
+static uint32_t wait_for_next_vblank_seq(data_t *data)
+{
+	drmVBlank wait = {};
+	igt_crtc_t *crtc = data-&gt;output-&gt;pending_crtc;
+
+	igt_assert_f(crtc, &quot;No CRTC bound to output for vblank wait\n&quot;);
+
+	wait.request.type = kmstest_get_vbl_flag(crtc-&gt;crtc_index) |
+						 DRM_VBLANK_RELATIVE |
+						 DRM_VBLANK_NEXTONMISS;
+	wait.request.sequence = 1;
+	igt_assert_eq(drmWaitVBlank(data-&gt;drm_fd, &amp;wait), 0);
+
+	return wait.reply.sequence;
+}
+
+static void detect_dc3co_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt;
+	uint32_t dc3co_cur_cnt;
+	uint32_t prev_vblank_seq = 0;
+	uint32_t vblank_seq;
+	int delay;
+	int dc3co_target_flips = 200;
+	int verify_commits = 300;</pre>
    </blockquote>
    <p>--&gt;Any specific reason having above magic numbers?</p>
    <p>--&gt;Define them globally instead hard coding..</p>
    <blockquote type="cite" cite="mid:20260527084915.1916365-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	int committed = 0;
+	bool dc3co_after_target = false;
+	bool front = false;
+
+	igt_require_f(data-&gt;mode-&gt;vrefresh != 0, &quot;Invalid vrefresh rate of 0\n&quot;);
+
+	primary = igt_output_get_plane_type(data-&gt;output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit(&amp;data-&gt;display);
+
+	dc3co_prev_cnt = igt_read_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+	delay = (int)(1.5 * (1000000 / data-&gt;mode-&gt;vrefresh));
+
+	while (committed &lt; verify_commits) {
+		front = !front;
+		igt_plane_set_fb(primary, front ? &amp;data-&gt;fb_rgr : &amp;data-&gt;fb_rgb);
+		igt_display_commit(&amp;data-&gt;display);
+
+		vblank_seq = wait_for_next_vblank_seq(data);
+		if (prev_vblank_seq)</pre>
    </blockquote>
    <p>--&gt;From above delay, (Say for 60hz =16.67ms) but current delay
      its around 25ms there migh be chance of getting 2nd commit could
      be expected 2nd vblank<br>
      IMO, gap of 1 or 2 would be fine,&nbsp; becuase of 1.5x sleep time
      crossing vblank time boundary.<br>
      --&gt;read,&nbsp; gab =&nbsp; vblank seq -preve vblank seq;<br>
    </p>
    <pre wrap="" class="moz-quote-pre">--&gt;and assert it like--&gt;igt_assert_f(gab &lt;=2 or gab&gt;0 &amp;&amp; gab&lt;=2,
			     &quot;Vblank sequence did not advance after commit %d: vblank gap=%u\n&quot;,
			     committed + 1, gab);</pre>
    <blockquote type="cite" cite="mid:20260527084915.1916365-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq),
+				     &quot;Vblank sequence did not advance after commit %d\n&quot;,
+				     committed + 1);
+		prev_vblank_seq = vblank_seq;
+		committed++;
+		usleep(delay);
+
+		dc3co_cur_cnt = igt_read_dc_counter(data-&gt;debugfs_fd,
+						    IGT_INTEL_CHECK_DC3CO);
+		if (committed &gt;= dc3co_target_flips &amp;&amp; dc3co_cur_cnt &gt; dc3co_prev_cnt)</pre>
    </blockquote>
    IMO: better to avoaid un-conditional read of debugfs --&gt;&nbsp;<span style="white-space: pre-wrap">igt_read_dc_counter only if (</span><span style="white-space: pre-wrap">committed &gt;= dc3co_target_flips</span>)&nbsp;<br>
    like:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if&nbsp;<span style="white-space: pre-wrap"> (</span><span style="white-space: pre-wrap">committed &gt;= dc3co_target_flips</span>)
    {&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
    <span style="white-space: pre-wrap">				dc3co_cur_cnt = igt_read_dc_counter(data-&gt;debugfs_fd, </span><span style="white-space: pre-wrap">IGT_INTEL_CHECK_DC3CO);</span>
    <pre wrap="" class="moz-quote-pre">		if (c3co_cur_cnt &gt; dc3co_prev_cnt)</pre>
    <pre wrap="" class="moz-quote-pre">			dc3co_after_target = true; 
	}</pre>
    <blockquote type="cite" cite="mid:20260527084915.1916365-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			dc3co_after_target = true;
+	}
+
+	igt_assert_eq(committed, verify_commits);
+	igt_assert_f(dc3co_after_target,
+		     &quot;DC3CO did not increment after %d flips while validating %d commits\n&quot;,
+		     dc3co_target_flips, verify_commits);
+}
+
+static void test_dc3co_framedrop(data_t *data)
+{
+	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data);
+	setup_videoplayback(data);
+	detect_dc3co_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -693,6 +773,36 @@ int igt_main()
 		}
 	}
 
+	igt_describe(&quot;Validate that no frame drops occur during DC3CO entry &quot;
+			     &quot;while alternating framebuffers with PSR2 or Panel Replay active&quot;);
+	igt_subtest_with_dynamic(&quot;dc3co-framedrop-check&quot;) {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, &quot;psr2&quot; },
+			{ PR_MODE,    &quot;pr&quot;   },
+		};
+
+		for (int i = 0; i &lt; ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f(&quot;%s&quot;, name) {
+				igt_require(psr_sink_support(data.drm_fd,
+						     data.debugfs_fd,
+						     data.op_psr_mode, NULL));
+
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) &gt;= 35,
+						      &quot;Platform does not support DC3CO with PSR2\n&quot;);
+				else
+					igt_require_f(intel_display_ver(data.devid) &gt;= 35,
+						      &quot;Platform does not support DC3CO with Panel Replay\n&quot;);
+
+				test_dc3co_framedrop(&amp;data);
+			}
+		}
+	}
+
 	igt_describe(&quot;This test validates display engine entry to DC5 state &quot;
 		     &quot;while PSR is active&quot;);
 	igt_subtest(&quot;dc5-psr&quot;) {
</pre>
    </blockquote>
  </body>
</html>

--------------jGEZM4ArpQj53Dyv5AAcBzeG--
