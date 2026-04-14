Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD8FF9D0F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 21:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FB010E05C;
	Tue, 14 Apr 2026 21:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7CsVl4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCF010E05C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 21:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776202781; x=1807738781;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=EZIsNMuIrmA7rG0ado9Du4pQscciwGBddfR3AgttP2E=;
 b=K7CsVl4euma7MU9j96Ts9FKQ8OxKptc5QctE0imnYTZfdmlMWHR4UHoj
 p9JgYZNfb3yi70/yo+qTM+dxSg249uTqDdSZG9UAAsi7LwrMR4uRymXPo
 HT6t43847ihuLNx/IGT/2jg9hTxMBOL3y5n7IpCLn5RJc0zW6FRDoDRNP
 jzVmLxKLmSLI/cPaSsM+IV1xycg5eozkjdWtDyq6SLUfDfqrz857p3ijG
 3A8VJmKZInCyJjkH854VHVEhRS8O5gwu1sjFFzrCpkbLYEKUPTEY5c15V
 94IFgb0Zv+X6pU/p1o1K+aXsDlBECPMARoLl9DY3K4kQcG2cPE7kLfWB0 g==;
X-CSE-ConnectionGUID: EGwb7ID6STCjYpQcGGhh1w==
X-CSE-MsgGUID: 4b+h5mXHReGTCdj08NfrAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79760531"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="79760531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 14:39:41 -0700
X-CSE-ConnectionGUID: rQB4lq2tRMWZ4vIL0WPUug==
X-CSE-MsgGUID: Ez2q0605TcmYwG5ce0ebcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229350701"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 14:39:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 14:39:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 14:39:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 14:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH89vxVfh76fWjilIiajqbD7rPfOyeqlhfdW9tGH5ZL4GADTitUM8sqlA1uV97Quw9JKZ/mjc2vsTLKGieL4tUR0+zgmFfmzBcsIE0Z6zPH9bpDBRY+6U8FqInXErisFNbpHSB9Ggv5qzFp532jAWZVPfecq+Hu7w3lsbKTw1HtuZrOHMFiUZM3PZ57b7/m5p4aodhR+OIHGyA1sWMx/vL7a7qzK/KKKzRspIcNz/vn/BUO9fZYfA5iIzb+uvxRz4yIDQFOTeP4qefmvJf3+kMmeAlpSa3fE5G+szHU7rbWabswlN4PGhvCqmURSptXZZn7KfdhNOp4+bTYB8ov3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q0UMSQtVLBeWI4Q5AH+rbMN4OKHe7rpomlGXkJUgqA=;
 b=gvzqhGxEejYEqR4B5DDJBakYZmPZprZx6Xrh+NYeMH+UOfVvQOFM2YLV0GPXeUjzicnf7adAfGcDFeHv8UqOtElr3QTkF4g4sbTp2dTz6N85t7VnKW3NMkfg60y2d9O+Wwl4GUMAXu/T6D86qSxCgwbWyZeh9H8Q7NSz2MX1uoiZLTga2tdxD63AsoLm5SaWOO/8Bhc2y03BbTk1fqINzPgNyNN93vpTn00dAujXbM8YaU+MzOAmBFqPwZ2hb++JzDzdtw0xTqbOWhrqEWGx1V0BAfxF8rVnqTPQ/cV2Y92B6rnGUyVVA834z13z+//0jfbqgz4bb0dF5WJZpmXqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Tue, 14 Apr
 2026 21:39:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:39:32 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
In-Reply-To: <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
Date: Tue, 14 Apr 2026 18:39:28 -0300
Message-ID: <87eckhw7an.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2e35cc-7485-48ff-9c02-08de9a6e508e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: UMpVUCpdC0YGgaMwl1dxbDvVXca95rZhy9hqNvPNXjKcnD6mLh243QNZFCMOnRuhiS7IDOY97t2WKFZrpPQpyxQDHaSMxaqrJdRAizLerTnJ49Wm72UQefz+1fThEPuYyIdr2+JG5AxGyE/tci73iHrr3Kq06DuuZmUQ0w1a0zRt170RiF9mpbZh+ZdEouSo49pDMAhorPd673pPSKBr8JyXUIj0ohKm64NwmOjNgxJy1mzsvljVyio74iwIXgTsQ7RYTVMCOJ04EnSr0CLSZWtE09h8FN+tQwqcKiyksljejQMrXhhjR+nYq9wWAI9cQ/4TQYpnbAYPaZCLyvvezugPqlmZrFLpc8Xllb1We1zvpYR3F5c8HVzDk+HXnt4p7z6xSefz8MS9+NWZaaL92U1bgRWanKnkDw8d+PacVjoTQY3WMPfNWZM7XENDKvugfIHLHlcOsnQq5iLuMnovT62Qvcdj3BXGgVlhNInZgBLa6Bnq6BJYPfKbDXBVSw9OSonD6xGjYzyeq6JxnHI6d6zn7WbwGbbNML6oxcN9l3AFr604zMqI5FGG4OLg9U2+TUtxjlx3VnYFXoVuTMS8VUepCsjb0iFdIcEbwK3RNHYADQso80L8NLgOy60VB9CCMBpoafKABe5oDx/CsPxK4DuP0sAPJx/Iz0DY4Ntw1N8vt9VdvELuuq74AssH/3oqcb5xoV7u4SvNRBMbb2voSPLlnP8041nv6THQo0Xc2qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUhnTlNrL09QamxrcmxGczlBaWJGeGNkaTFBVVlIQXJsdTNaS2E4RStoa3Rk?=
 =?utf-8?B?TDd0SE1QRXEwVVhwa1A2ZzU0TmkzZTBUU2g1Vnd2KytrQmYrU0l3RmFFRVpC?=
 =?utf-8?B?OHMwUGxZNUNSU0xHeXJmeXJNb3VmM0JpQVJVZ0NxRmlNVUkwU1hIb2lyaFd2?=
 =?utf-8?B?MjkvdG14T1FTVURHMk5KR1FtTDViQjNObWo1VHJEN2FsUmNVSG1ISnFGWDJO?=
 =?utf-8?B?bnVyVW0zNXV0QUs1R2EvT2ZqemlWd0p3ZURqcUdPcExVaTM1NS9LeDBtNEgv?=
 =?utf-8?B?ekcwc2tZanR3anE5QlFhbWZuRkF0RVQ1Z09LN0hieC9yOWNqWElVSWU5eHh5?=
 =?utf-8?B?cm5vSTN4VnZndE5yNXdLYWxvRnJEdjNCcWRzOHJFWmhSV0srY3dEbnRsQmor?=
 =?utf-8?B?aEozajlIM2t4WlBwaVludHpjNWxRNTBjM1ZkVXRaems5ZFZOdGlyR2hzWlUw?=
 =?utf-8?B?S2xZclRKUTk2S2NrYTBNcHpNaWErV3JFM1FDNCtSR09Sd2h6OFFyV1lleXJE?=
 =?utf-8?B?V0RBRjB5U3BTYmdTeTMxMHpZZ3RybnJjZG9qQVlzanpkdm9pWXpDWU50cjEy?=
 =?utf-8?B?bGJyL05FWC91bS9hMHdaWTd0MWVXVUFmVnhCc2ZRL1JRN0hCdHhXd1E2WXZB?=
 =?utf-8?B?Qi9IbCtsWGZGakhVTmsrT0lNVFlZYnIrYlNUSHd6NWxMY3RxT3M0QUtUTHFJ?=
 =?utf-8?B?UzJ4YUR5azJ5Q3BmUW51eGkvVDVGc1o5KzRjNDFrWDg2UTV4YkFLeVk5MGM3?=
 =?utf-8?B?aFBWa1owdDYySnlCa2l5dStrQkFwS2hQN2NXVzBlL3gxK25DcEZ5R252b3ky?=
 =?utf-8?B?RUN1NnJYOExsdHJ6a2oyWlA1R2doNUpSd1BvTW5MbTZTY3pZWlZnSGUvdnBi?=
 =?utf-8?B?SDBFbnlZRkwwMEFCZGVDVHAvdmVvZkpGSHV0NzJpRjdaMTh3OEMyc3FLTWVV?=
 =?utf-8?B?NWRubUdXUm9pS3NTdDlub0VhMEFEd2ExTG1EakRiQWlzR205Z09oZ2NRVVlq?=
 =?utf-8?B?ZWVPRXZiYml0b21NN3VOR0pOVmtuOVVlTGFYMXlYWE1taG4rUllGOFpJQWFP?=
 =?utf-8?B?S2orY2dHY2k0NUhFQndTUVRzV2xqNWFhbmxtMnR3clgvanMxaTJrRmFiODJp?=
 =?utf-8?B?R3FXS3RSVzg1V0xaWm9oNmFDK1d2MXFnOEZhUU1UNjVMN2ZOdGtRRmc3bTJS?=
 =?utf-8?B?cXJqbkVtZmtWb3ppbkVpZ0ZlY056Y0RLNk1SN2dOUGJrWmtKSWlBbjhJS1l0?=
 =?utf-8?B?SW81ank0V0xxMjVDbW11SzFIejM1cFVTaXM1aXFwMVE4NU5kbjA1OEdmYkhH?=
 =?utf-8?B?dk80dFdBNlpTd1J1OTdXVjUvTnhScTFFSUNtNmdUZ2F6M1VZTWtzTlRJR1dL?=
 =?utf-8?B?Ny9YcUxjZlkvbC80NU5DejluMStxVmYrZHN6WG9xNzVTMVVLbEhFdUozLzJu?=
 =?utf-8?B?SUErQnhRVExHa0l5cGVrcDRWS1UrdGJoUVlFZlhRbTQ4blh1Z0lnVk9ybzZI?=
 =?utf-8?B?S0VEMFRSTURzQUhCRE9Uei9ZQTh2eVlhNjlVV0l4c2lPVHhSNU5PTjEyVFZm?=
 =?utf-8?B?N3EvMHI1c3hVSnkzUWx5dll0NXk2a0JhNEtTWEYxbkNUOXlvRTdFd0RSK0Yz?=
 =?utf-8?B?WTZpczFyblhUZ3JZZWVYSk9MYjFnNHpuOUwxY0dkNmF4OTBMdHFPWXJqY0ZK?=
 =?utf-8?B?M3hxZG1NYUUzZ0x4MkwxRTZIcE11NHVqWElXLzNMb0VWRGFRbWpoWDRTR01S?=
 =?utf-8?B?YzUvZ3gwNGZaUzRFbDg4SE5ubFBEWmtacGtpS1Z5MFRaeUxYbkpmcFdzTFEz?=
 =?utf-8?B?NjdGUG1pdHk2di9KSlJKVVpVV3FKRy9xOEJYTytaVVJ2OVdCdE4vR2RVOFBU?=
 =?utf-8?B?RVMwa3JBMC8ycU9EUEpvS1ZiWWlsWndydklOQlR5T2hLM1NBVUlMNjFDWkdC?=
 =?utf-8?B?VmdaQS9scXIxWWNsbnp6MDZOa0RTOG80bktONXJWMDVvMjhXTVNGQ3FDVjhv?=
 =?utf-8?B?VGV6NXRybmd0TzFzZ09mMHJyT2lHTW1JOFhYRDU1dWJjbG5sOUhSeDBrOXow?=
 =?utf-8?B?ZkpRNUprR1Zyb09MWlFEcysyUmpndTlXMFlFSnpOYUpKRVpSVjYvVzZRU2RS?=
 =?utf-8?B?UGVTYldGQjAvZ2UvR1NpdlpHNlE1Q1ZxM3haam5iSEljcFhyWHdDN2dhaFVW?=
 =?utf-8?B?VTdyWm9KWTc3T2piTHdCTXp4L202TmdkRnFJYVBYOHpRcld0SkMvVG5UcHpl?=
 =?utf-8?B?MXI0bHlRdkZHMmtXVFJBRDhUUDRwT3lSdTBjcnd6L0tCTWh3dnlBZnhUVmVw?=
 =?utf-8?B?OUZicjNjWExGSnZGS21SRG1BVHVZbVoySHI3UnJOT3ZMMmJMcm5ndz09?=
X-Exchange-RoutingPolicyChecked: GjH05hcYGFu5UmvJH0zn+X8I5W+hexMG7tlMdOlbti0NFt4BxUk88zKofvdi84gDqRZWKQ6cZtenE/RRauR3mdCFSHjDE2h1cf6on7d0K7ylY7fVkAYfMVpUsb1uNY2M2NBRXjdEi0V1HlvgYsPqjdW1nnJ0NRpqllUgiiNWEpPUkjO7HnzUHrSuGnzIBrMNpuq6s47Katfg09r+9duOMGwS1ihPFkk9/9aHgKoNsFBKoEf8e+bgncnkj/N5Ki13UlrRKWCMYmF5kAL/WTfiOBf5WiPgR3CswN7kDsaYaEcrzjLLKg7xUHLz9Elpx8R/9r5AZ77KWj3Bg4ZSgy5POg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2e35cc-7485-48ff-9c02-08de9a6e508e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:39:32.2910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wqNPPtqCwcYxUdTvuOYxbc2aTx4yhYAcUae+lA7L6Uc4JtJ0mVC6CsTv+4AwZgOC2yNKRsMVi0AKlcyXH7FSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> Add list of filenames which were created by hooks in attachments director=
y
> (like GuC log copy) to results.json for allow presenting it in CI.
>
> Due to lack of userdata pointer in nftw() implementation main json
> object is passed via temporary static variable. It shouldn't be the
> problem because results.json is created in single thread. This change
> is not too elegant but allows to minimize the code change and is
> much easier to read comparing to recursive readdir().
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  runner/resultgen.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index f8459385c3..d37f01a433 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1,11 +1,14 @@
>  #include <assert.h>
>  #include <ctype.h>
> +#include <dirent.h>
>  #include <fcntl.h>
> +#include <ftw.h>
>  #include <inttypes.h>
>  #include <stdio.h>
>  #include <string.h>
>  #include <sys/mman.h>
>  #include <sys/stat.h>
> +#include <sys/types.h>
>  #include <unistd.h>
> =20
>  #include <jansson.h>
> @@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
>  	return true;
>  }
> =20
> +struct json_t *tmp_tests;
> +static int ftw_attachments_list(const char *fpath, const struct stat *sb=
,
> +				int typeflag, struct FTW *ftwbuf)
> +{
> +	struct json_t *obj =3D NULL, *attobj =3D NULL;
> +	(void)sb;
> +	(void)ftwbuf;
> +
> +	if (typeflag =3D=3D FTW_F) {
> +		char *p;
> +
> +		p =3D strstr(fpath + 2, "/");
> +		if (!p)
> +			return -1;
> +		*p =3D '\0'; /* temporary for acquiring the piglit name */
> +		obj =3D get_or_create_json_object(tmp_tests, fpath + 2);

For this to be trully recursive, I think we should create the JSON
object in the FTW_DP case.

> +		attobj =3D get_or_create_json_array(obj, "attachments");
> +		*p =3D '/'; /* bring '/' back */
> +		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, strlen(f=
path + 2)));
> +	} else if (typeflag =3D=3D FTW_DP) {
> +		;
> +	} else {
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool fill_from_attachments(int idirfd, struct json_t *tests)
> +{
> +	char attname[32];
> +	int attdirfd;
> +	DIR *currdir;
> +	int ret;
> +
> +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
> +	if ((attdirfd =3D openat(idirfd, attname, O_DIRECTORY | O_RDONLY | O_CL=
OEXEC)) < 0) {
> +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
> +		return false;
> +	}
> +
> +	currdir =3D opendir(".");
> +	fchdir(attdirfd);
> +
> +	/*
> +	 * ftw doesn't support passing user data so *tests has to be
> +	 * set to some global for being visible in callback function.
> +	 * As results.json is not processed in multiple threads it is
> +	 * not a big problem.
> +	 */
> +	tmp_tests =3D tests;
> +	ret =3D nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);

I think another option is to use fts(3)? Since it is a streaming API,
you can keep the state (i.e. the current json object) as a local
variable and update as you walk the tree.

It seems it is not POSIX though.  Not sure if that's a real issue for
IGT, since stuff in IGT are supposed to run on Linux, right?

Thinking back, I guess it could fts(3) could even be used for the
recursive removal.

--
Gustavo Sousa

> +	fchdir(dirfd(currdir));
> +
> +	return ret ? false : true;
> +}
> +
>  static const char *result_from_exitcode(int exitcode)
>  {
>  	switch (exitcode) {
> @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
>  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>  	}
> =20
> +	if (!fill_from_attachments(dirfd, results->tests))
> +		fprintf(stderr, "Error parsing attachments directory\n");
> +
>  	override_results(entry->binary, &subtests, results->tests);
>  	prune_subtests(settings, entry, &subtests, results->tests);
> =20
> --=20
> 2.43.0
