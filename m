Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34351C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 07:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD62910E6E6;
	Tue, 21 Jul 2026 07:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3Ldu5M+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EC210E6E6
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784618901; x=1816154901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=joGwhjqR1wTGFlJ4dVxZKvtZid7jfKqwTzimKol2BjU=;
 b=P3Ldu5M+jUAXO1ULSqQrBIrZzzl/jum1SfiHXNPuOxn2swe70XQJ2Km+
 Kv2sZPv/IZBJq1gTnEJv1/mTQBOF3y9stT8M/gznXSrp7dN5DXUe+ri9M
 I1Rvnq7UT7wLqJzigEXFJQufyKGDtUDGZqeFZJ+qfZuFiUym9rH8kZXqR
 WHfCFWAiUjKStYYbIoXCh1S29Rma8mLMdLiUscJ6VFtnekavFDl8NHQo2
 KR2D071WI8qQrIe30UrA9wO51SpQwzO67ZFc3UqgQV/85eHspQZ14048R
 8qJksBJCi2Yk2VyBBeFDqZ8NJusyIYThm+ObJjYgJdS7b4I+ZmtPnXmk3 w==;
X-CSE-ConnectionGUID: SDQpQyFcQBWv4TFkq066TA==
X-CSE-MsgGUID: CORfqIIHSVqMuDer+HYZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85086141"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85086141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:28:20 -0700
X-CSE-ConnectionGUID: d1WoptA/TPOAPzf94wXXiw==
X-CSE-MsgGUID: 61hwY8utQv2SgvbXA4CCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="261235189"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:28:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:28:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 00:28:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTjXimzAqBV1qxX2FPasRy5O6SPVoGT5EjJE8UfwNu1nUyviNNKfKcWxr1AI+BdwEI9Eeh0jdiL82YmFuClOPfpQM4M+T2c5wgAuMtOkmsFdpYWqHmS4ZsP5ZsP5a1GLubnNBvmoRW6bEleQuM8ed/0xhj1vhT9yMZsWq6uQzsMDO9F1Md5KW/0K7mneagrmthFCaK9uvCKshHkuT23U5PvyDWGZbDrcbNmp5+8wxIcB0GgSG2kE4J4XJTPA3nk1dQtlpToSeJMPVQqXJHY+4AClemAZ4kSQfdsRSUcw5lNSDuO5Mi+t2XxPw6bJ6Z3VgxKUWZ/oxF7K6sJdjHPDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+x53ndV5l+O18xRMgWiP2Ym/kHBcyh/r5eAuBT9Znw=;
 b=bz65mSd11gTxed2Gggll/KyJRwbxCVxZFpuOTa+IdejW3zaLVTLkuOCaD5P7M+Z03P9KO4uyksg3edbWuBnwyPPW0nKoUkKDKZ8341t0a/fpjHI8geb5vv6Mjohqo2RSPtpcS+fsIEF4OqRIDdVICz7okV8aDRIK3Ql3278da9e7qCBzg5R8lLZEeBNb/3s/fndra4K96J++bIKpad3tKU/JUr1p995Fw7PijHGGkwWkvsFBlvsxnAqQy/15WWGbrQp41npdvw11gXPN7mPOpRfEKYeKJqg9M8AXwz/POGwAewhLU+VI/l+BfJ88p6u9LvHSvp/vTyr0woVY9v+DEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 07:28:10 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 07:28:10 +0000
Date: Tue, 21 Jul 2026 07:27:55 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 27/31] tools/intel_watermark: link with minimal
 sub-libraries
Message-ID: <65zatbzyfzqok2pjnfovouvrajl6fmmgby2hjgguj4suzssckn@6avtl2yyucld>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <9c33105d2649741614e121177cf1a11d1f74e7a8.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9c33105d2649741614e121177cf1a11d1f74e7a8.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb17bdb-efbf-403f-9655-08dee6f99dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tOGKIMR9fYiXLkYTpVnLj/7/adspJj32EX0yXJRaD6Ay+ox9dDjP9d1v5TrSk+fVyG1avRR67BkHS09UbSSRKB0sgvRr3FT8BQm+6qR1x5vwe41zrAs9yH2ASR5OPrZPJGug7zfdr24PrRrSEAYmSSnUswcqsZs9tGlpjoDUT8oX+k5fgk8+mnPzNMuwRAG2LICjoaSFCPP7bEbBxffqEDCA82BxLYDjqwcMPXiwAiKrmV3wIb/F6oK9aXJOy5IM1Hc5JMZoQKvoQPAZvVRx6CbBHZbiellPv0DBlqTjXT2tyxeDrwBLv0BHeQblhoyFJBPT4BiUgq3w+q1TEPZ5ZJVmTPnSm/6bmTrKqXPZ9FrUYmea2G8R5hgscrKJCMN/pEHkvl8LZibtrhfdbTZkmoG+RNgwJjgwesrzC4Io4HfEpng8C88tZHtSRtwRpn0KGdsgBg3ahvbgXN8n370/rvdjbRwrYlUEdBM5i65tx35BZ3s2lKNS//ncurEa6A6W6rc4XcuNPyPa5ug/uhCCDrmWjjoI+lRBvcHiTVV5YjfZH7RTl9S3Qkog0Re5AU1hPRP2pK9mIYdYGaPcsQcewXLqdLrx7WTpZ2WPR0YAGaXjiHiKL6HjajWbVw4BEPccHBsj27nAfZAOegCLhtJh6G3Tadyc3v1N0YQelKiaBLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3BWcXpyS0JvNzNYYmNDVXFpaHNheldYNHhUa01OYjhJVGdzYlZrTG0xMGJa?=
 =?utf-8?B?Wmx1UXFidmFiOW5HNTlGNkxaVUorM2pPY1ZRWFVsdG1zUG9nVjlzR0w5R2Jh?=
 =?utf-8?B?LzhkWnBUNmlnVDRXY1ZmbFhtL2RRZmFiQ1BtZktoK2JCcDVJRGdnSjFDTE1L?=
 =?utf-8?B?ZTB1VU5BZnRPN2JHMFd1bnZRM2RZUFNUR0xJRHVkUVZhWDlaK3JnQzZSM0VV?=
 =?utf-8?B?S0c2VXduSWJzMWZ0YmRYN003Y3lLdGVBL1Z2ZkVSdFNSSG9sSmh2WmJST0c3?=
 =?utf-8?B?N2dHT2lOVEU5Z3psd0QwQis4UjRyQ2h1dXpGQVdpdFJ1UjVPV3NoMHlnL0pr?=
 =?utf-8?B?dmM5aExVdDdxVVRZWTdmaEZmaUt6WitXMnhmbFU5enRkaXUzQ0RyTUZUc0Zk?=
 =?utf-8?B?WnlDSks3aTE4emdhYTdUdlI5TjJNTkxLVEwzTXI4elJ4TGJpTFYvSUJXS3Fk?=
 =?utf-8?B?WUxiTXQxemdFcnA1ZmN5bkVhb1BZemRuUnE4NlpXM1YrdUpON0t5Ni9ZZUF2?=
 =?utf-8?B?UHlieDF4anc3VFdqWUR1RjhJdk9ZczBWZFdsV3ZSazBjTkd5bGo0QmxuTWpi?=
 =?utf-8?B?TmlraWZIaXk1RjZHTDFPQWpJMkNMVHZUZHNKTHErZjVNc05TU25GbXIzRjJM?=
 =?utf-8?B?NkpKbUhwNWpFM1h0SEtuUG5kQmZmdmYvS0JIQ1ZYRTU4MGp6V3RWUXRJQy9n?=
 =?utf-8?B?ZjZsTEJuSGJqdzBHeFhza0h4OTBWdGd6c3cvNExZME8wT29QaEtKbWlMdThn?=
 =?utf-8?B?a0xaVkNYMnRpUndLSjR1c2N5WXJmQlJ4NFFTTHVzcUNQdHFQY09QY1IyNjZj?=
 =?utf-8?B?MmowSUxTRzgySlZ1eFJQRkZpbUc3RDF0Z252SExJZlRHMHpHQUVVTDlvbWRQ?=
 =?utf-8?B?cncvL0xvYTJsb3BQdUhGcW85aldpYmNLMlFGZTd6dXdSSUtWRC82am5xWGhT?=
 =?utf-8?B?cXhYdUJWL1JIODFDSDFraGNiUW9lTnlSVTArQlI4RCtzelVwdlpkdFBZdlVo?=
 =?utf-8?B?YXpuR2hDdXJuR1RTVUdSblJqVVVoR2V5NW9lWnZYYmlZRHZmcFBwUnY0VjJO?=
 =?utf-8?B?RGtzQ2FrakFlYndlVkh6ZDU2azFyWS9DSXNSQkFOLythQ2FWeEg4R0ljL1RN?=
 =?utf-8?B?U3RYZzErYlptUmVCVzdXYnYwd2RsMnp6WHJjRmRmRUtJWm9qRDI5aU1CVEhK?=
 =?utf-8?B?UldvVXZvVVBlQnltNm93YzJ2NWtOY1VWS3Y5bjRFRXFJTHdNVzh5VjdOMFFK?=
 =?utf-8?B?R2NBdDBreGpYcUhKbzg1UWp3eWtvd1hLd2RzUG16SW9qR09zYTFjZnY2di9T?=
 =?utf-8?B?VEpmL2NtenVPUVovNktyUXdWMitYeFA4LzBPODVGYUtYTEFpYnpvM1dyUFhq?=
 =?utf-8?B?L2ZKNThFckJQd2k4SEZZR2NXOUZJNm0weFh4Y2doNWp5YXg5bTI5ZjlOLzdy?=
 =?utf-8?B?R0NoZDNsMkVkR0lSb2x6TUVoZWhnTXNaQlEvcHNWZi9kcXFpd2V0aVZZNzRw?=
 =?utf-8?B?Q1hxeW10d05YTkVoOEt5cm9CcTVtUkVxb3l1czNvdGg0WG1UQU81eWNBeGQy?=
 =?utf-8?B?VVJ0bVhBakFKc3A2S0FmQVd1THZkRkszRlJ0Y21ENkFIS2lPdTIrcVQrN2pv?=
 =?utf-8?B?b2xmSmtHTzdDaDh5MGZtZXBrU1V0ODQwSWxmUjg3SFB1YUIzcEFaUjZENzhW?=
 =?utf-8?B?TExwdU4raHFqVDJITHd1TmZLL29HMFQrV1MvNTdTVnZwTUxzTWVmSWUwOEhJ?=
 =?utf-8?B?a3pucC9GeDB0Z0FnWFFycENLbGFUNmh0NGtjcTlqQ0l0K3BTWWdNWENUYktM?=
 =?utf-8?B?eXJzTFpPUUJjL1I4UWZ3UGJ5cjV6Z1dVVHBFVm5TWjdZWmdtRkt2VG4vbnVD?=
 =?utf-8?B?b1VxK3NPdldGc1VuK1Q1alBQcFdaNWtib2Q3TFZQVFpPTlFIVS9nd1dOMVd2?=
 =?utf-8?B?YjM3b3JOdTljdjAyRWJScVVESHFPR3VxaDdjcFZVVE1rTjFmeGJQNXFHK0kr?=
 =?utf-8?B?ZU9wbWFnUHluc29UajRIK2ErY3ZreXRSNE1kZjFpWnBlYzdXRXB6QjIxSHRR?=
 =?utf-8?B?OHRVdXJzT2FCanhVeWYyRElRTDg1L2ZtV1hEZU9wMm1GNlFqN1U0ZXNPSFQv?=
 =?utf-8?B?THNxMm0vNWJVRHp0YnFVZkpnaGRqbjBXc0dZK0t1aGd1TktnOU1qZTB2RHZ4?=
 =?utf-8?B?NXVNNDRTT0wvelRkQnZTRkxiTzkyWURsMjhzeE1JUnVkZVRLV2ordHZ6alhH?=
 =?utf-8?B?aUZ4STkycGNjaWFhbFlTaC80WjkzcmlndTduOWxDcGs0NXlqVkc0V3pXV1Fh?=
 =?utf-8?B?Yyt0elFuUFJZcDRCQ3hCc1gvRUtWZ1lxU0JDdGpidlIzUFNZTDFJVVYwbWhF?=
 =?utf-8?Q?+O9lAKkmtw+5Ml+U=3D?=
X-Exchange-RoutingPolicyChecked: JnlV8/NnO2Rs+MC2pAkF5vHIals3zkSo+at2yi5Kv0KDJtSuUgQDke5dL+y64DCKzW9L3EgPcvW6os5V2wUfUOszqdqlgW+vbUtjc/ln3ttKqo87uhtaCLYwV1GS7LWnex6cwTaDrUCRwNdV3cMBLGzBkreSIRozyYqVWrJtmn0kadN0M/tayYgM8IDIOndYbGMKJURCTdc+56KZzMPrRKinWjYoIZ4F1nczkaeEkMiVv7IN87qepmpsAJuCP/GqHrHAXYIji9zfvvzuOXtJNN5ksreaB6Ah02nDv/O5TziW5e/4ejnXzN0MA7iz8sdHp1O/mrQ7mYY0EHHqInnkuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb17bdb-efbf-403f-9655-08dee6f99dd9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:28:10.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lGukYT0FlFrTxfDNskRlQgVp+QlMLWSJdziNMDmhYmreUEvng9l1I2aOBZiuj/fnKi32wgdPkrLaoHtLfoClRWE5ggbevETXlRRt3Bs+VQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
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

Hi Sebastian,

On 2026-07-15 at 14:15:37 +0200, Sebastian Brzezinka wrote:
> intel_watermark only needs the register/MMIO helper subset, not the full
> libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 1a4e14ed3..0cc62b54d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -26,7 +26,6 @@ tools_progs = [
>  	'intel_reg_checker',
>  	'intel_residency',
>  	'intel_tiling_detect',
> -	'intel_watermark',
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> @@ -124,6 +123,11 @@ executable('intel_panel_fitter', 'intel_panel_fitter.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_watermark', 'intel_watermark.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
