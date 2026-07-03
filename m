Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C43C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E78A10F93F;
	Fri,  3 Jul 2026 21:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQQbA2U+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476DD10F93D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783113053; x=1814649053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ptMM45irB59id1mEJa5ZZ4h4ex2PcDS0Iegg2VJDRqs=;
 b=hQQbA2U+Ua9DSkw8xSP58+bLYlakXj9bmSZOeQmQKBmNI+ursBqV/TMd
 Dxw7dKosEVgCIrnmBT3swPKZi76ku+03kEJfV0AV/g4/xInjQ/Tyn+SYN
 gQg1zTDUe9K4/K9VM/8FcOkpAAeBWkkKTVqXuN2xvJgPcWtvdlQ2y+QNW
 xLgmtV1CIkWABKK1LWZu6+U1nWSY6GZdT6xL58Pq5KQ1ZoFUEAKNcN0/z
 c7m3WAyx6kY+vfprM/KzI07wmnzJR4I9fozqLH2NTYHUddDe2Jto8NuHH
 gI2/ki/0i7sQYbm5Yepcg2p1PGylB8OvJCI2Vd9VkxaEeDjEBGAa/QOjp g==;
X-CSE-ConnectionGUID: Hk2pvVw7SlKKnQpW64oRJw==
X-CSE-MsgGUID: Q+UP7a2UT76lq9CNKmyt1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94508252"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="94508252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:10:53 -0700
X-CSE-ConnectionGUID: iJ5eCj6zS5iVDGhOFN85Tw==
X-CSE-MsgGUID: 1nW3Mf1LRxGbAjhuhs/4uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255105022"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:10:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:10:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:10:52 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoJDG8ZGqphP98Exz14Fta7aOBiTfDPF6Qd6OlW2YaCAtPeFiakHUTeLigiWL5wOTkWN/Hs3lXIii5qXC+oDRFa6BhSdNkxeqQ5OyG/9PFefTKbE+JY/RwBnQONcyl4IdGeLHeRRXXfHkjqbHPgQcXIU42KjA21Ezq7LE3npDUupO0vBUyNUMw0CRFbtjB+5VydfcIDPulweF8Fro92ERsj7Vtwh3Mjzk7pLh8sbhYnxT+e5UkIBIxZhZnekVAu3rvMuCiV2ngTh0Hfli82oxN0IUhJZp+F1Uz9aBZ+WhGx8dBUc0ivTlEMFWCuZU9uPIuNAa/c2Q5qjeC+L+gAA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bZoZGA5oxMA8boBmDKJ1Dv5i74uvxTnCpm5Z/ZF/jk=;
 b=JZncD63Fgwogq54ePZ99pL43bGR3s94Eggwg5YAqpf/xSduNYL3E58tFwZKk3393qYZabL4W8XnNFko6XHVOgjbBvv3TA0IjgPe7w4XL6QayDxD/XuVAVVvyUzCFN6dnniniBiDIe5qGK3olwsx+0wEs97hqfq5sqZ6wGiicQfYDR78r0mSmuRfzwyjRIB27hPFsTCZ+yTiuXEFYTD9aYQ0AENjezs7qtBLQWNkoIurpVV6KN8c1RLEbCqPWS5qFwNXYDkQOIUas7KVtLFwqrhvApbUv07mgbg9A4lG2jaA2Mh3iulbmWCVxq5EYKKQZFGXsXpZrH0kyNkPpFD9YIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA3PR11MB9327.namprd11.prod.outlook.com (2603:10b6:208:57a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 21:10:49 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:10:49 +0000
Date: Fri, 3 Jul 2026 23:10:43 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 29/31] tools/intel_gvtg_test: link with minimal
 sub-libraries
Message-ID: <bps3as6q73dp4ii5u524dpm3yeq3gdypdw5iawhk3ptvndv65n@ejnggdzant7z>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <39e8a0f1183e5c158dded3b37f7b24f0c44e8bb0.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <39e8a0f1183e5c158dded3b37f7b24f0c44e8bb0.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0276.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::25) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA3PR11MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: 515755da-ec4d-4dde-eef2-08ded9478e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10070799003|6133799003|18002099003|4143699003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: VhK9emIyhJzfbN3+Xj5PlTbH9UiMyQEXWcxvC5i5GLLdmyPIrzb1ysDwrFEas07MHIMJSUP9XhmYF5W/sGW9P2qSHOM4331v7fRbU+YB940On/YUYHrTZjUSNsH7V6mn7RwZXcWqGiVbYwaQQzWaT4tcRLy13DNJ9gx1lAjSyO2ciMc5DiKPvX3N5MdezIz/PE4EtutOs530HZHTK83cDSaZoH7cdl3LUrDxpOpgy5UFxJ6Ejinmj964Wsp41gBiBVufsV+oumFgL9hd6fnafvwKrufkXb+ZO3RBQitB9/5zeV9rOU+8yYhRxAlbUw/OSlzL9SKA3rJ7mXxm1wApP5vrezuhCSiJSn9hKgVvx8H0kR6pi8igaYdXJPCm0shIbd1exieB1Xsrs0grv4T6l35Ks5lImb3t/HKDf1dy6hHq2kSvngX3obPViYSkb1pU62PSLazVR04YJ3C2ej8lhWpfj0hMvjyYzPiGTZPkfzWD0G23bgQSgr0Ef7VRcKASYC2fmiJAtgMivuATUryhQeEKqTPWUeATUQwxION2O48JjYKPTNuJ15aOHvkh7mrrOcUgYC9nAa9sTjCL2XV50hOY84MZIpc+hbGJFGpUeo0H832oyDRqkofy6jFHIGetYYlny831s6WKDhucrI/udVA947ijVU8Y5HqCXqXCrdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(6133799003)(18002099003)(4143699003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hvNmd0UWM0YkF5b1RqcDFoOVRlOVlJOWgxa3ZNandDY2NWNzA1WkRlQVpr?=
 =?utf-8?B?ZHJoVlloUDVkeUxwajV1TDNpQTN0dC9EQjZ6Sk5uV1RHZ1haQkVoaVBLL3hL?=
 =?utf-8?B?dXB3dWNFNHBNMWNzamw3VWt5V2lXL3Q2N1p5ZTNNc29hdHJqTlF0ZjFmWitH?=
 =?utf-8?B?VG1aMkg0L1lDbU5WQ3FrTlhVQnZLV2lFV2gwQ3ptWjc5d3QvYUJ1TDJkanJD?=
 =?utf-8?B?Yk90SlczL2FsWTVManY5MVF0clpVT25rVHFKSi8xWWJ2UStTWkduN2pjaS8r?=
 =?utf-8?B?eEs4KzlTZy9vWTQyNnh3YVByTm5VeUgveTljQ0M5dVFuN3RZYXNJbFFyekoz?=
 =?utf-8?B?WkhVS0ZONnNsZkFPSFZURGNWc0tjOVFkTE9MMXVvZ0tZY2g4SDlpL0Z3RFp6?=
 =?utf-8?B?MkdhcGVRQmNHYkNtajhoTEtnK0dWMjQ4OTEvNkJwWTgrYWU5QWc3d0xnYS82?=
 =?utf-8?B?MlJ5RVFUN2M2cEp2ektNWVpSbEs2eW9NNWluN055LzZGTDdhN1pwbWduemhP?=
 =?utf-8?B?RVcrbDJncWg0djd3ckpjVFNiVmVQNWc1WFVkT1JMTFFseVd5OFhZbW40N0xh?=
 =?utf-8?B?OE1SUU9pSGF2amRkWTNPVXBaazM3aTZTc2NuU0hTZWxEbGNyM0hLVnNlejVy?=
 =?utf-8?B?QndLYVZhWXFkQitOaE8yVmxQQlhjZ2ZJNEE0R20wS0RQenM5aGYwUiszZG9J?=
 =?utf-8?B?akFaNXIxSkJLZ2UxOWszbnByTXhhNUJVSmpyWDFRMWp0OFF5VCtsRFJqKzVI?=
 =?utf-8?B?UTByQjNnZ1hJZzgvZXhuNGR4MWEzd25CT1ROc01RWGlxbFVMMzB6RmVYN3hu?=
 =?utf-8?B?WjJDQW9RRE1hMmxFc3lzZzJsZmZ3b2d4ZGp4ZnRHRkRVQW83Smk2WVV1dGxP?=
 =?utf-8?B?Uy9hMGlkL0U3R3pweGpKU0x3dDN1ZUwzc3FuSWtXNmt6RG0zQ0Q0OGVmQkxU?=
 =?utf-8?B?VERZQWs5SGpNRm15aVNOeTI2QktQK2g5QjJBL0wyd2dvMWdEWHhqMFRTZjZw?=
 =?utf-8?B?aXZMRWR3SGVjdHlubktOZFljNjRYQ1J0ZWREQUJsOG5lS25Mek1WYmczNWVn?=
 =?utf-8?B?TVRxbjdRSHZvcUxtSm9oNDNWTDRqdk1qUC9jQ2ZoSVB4bHVranVuU01vUnNG?=
 =?utf-8?B?Wkd6MnU3MkJKS0NTT1Zhek85MDRtZG1vQlYwV0c5a25GcWVmRWxiYVBGWlRu?=
 =?utf-8?B?dkJWSkR6dVpUMmFvQjAzYlA4QVd5NUdTcE4zQ0NjVjAxM0xFcmxVNUZFWWJ0?=
 =?utf-8?B?T21kbzlzc2JyWnpoM0pldzdDUXVTWTA0cE9HVzNJNEJweUZlRFZWZjd6d0R4?=
 =?utf-8?B?eFhXTFRRQ1NUSGVVZ0hvSGV6Tkl0TGFkR3hPMTJGN2ZSTE5Kd2UwbXV5QjN2?=
 =?utf-8?B?RkJOdVFqWVRBYVk5d2NJQXNheisrOHlTQldRbEJ0R1ZnNjdtRS9rTHo5THdm?=
 =?utf-8?B?RjFNNnRhVmVsSzdtc2JuRTl3NzY0T2hLSkVWYzl4ZTVTK3g0ZTA2amxrNmw4?=
 =?utf-8?B?aUkwM3EwamFJR1JveWt2VGJCUU5ZUUdKTjFFa3hOT2JNL3U4b01UdklROFYv?=
 =?utf-8?B?MmlycXljL203U1I3dWtWRzMzVHJnZFE4VXFmWlhrb1pRQU5tQjVWRUYxcWZS?=
 =?utf-8?B?RkhyWFppQ1hHVklIc0JaZklVbDliMkZFSC8wTTljbE9pQXV6N1FTS3RLOTJv?=
 =?utf-8?B?c294RWY4eXdrUnk1d01yRURFclUyTURFelVFY1RCaVVSemtUd0FLWngrd0RL?=
 =?utf-8?B?YmZxcjRoejVYM1JjRTFPK3pxUmFWYStEMU5Cb3Q5VXpVd3djWDJKN2JIdUtZ?=
 =?utf-8?B?anJkNTI4WDYzb1FZcFJwczhJUEZXU01qMWZYM3dxZE1JWDdoeHFLR2U2WnlX?=
 =?utf-8?B?bmZsbGtXR2NCOWJqS1MyMldNc0NObjI5ZTFoK3R4ZFBnY2ZvNTVDSTVlbDVJ?=
 =?utf-8?B?U01QbDNYR0djN3VaN0IwVzFUWWd6TzlEZGtUcWQwU0NMMEs1NXg3TmRSQTBo?=
 =?utf-8?B?TVdVKzlaU2ZPcHpqZXhSaDl1TUswSURPRXFUQmtpYTdhS1pxc1pMT3FIM1g3?=
 =?utf-8?B?RW1YdDFEZE9ZeDB3STJvU1RUM1BwcktJcDZYaHlmZDRzSkFxUnR0M012eHNX?=
 =?utf-8?B?ZHVuNHJWS3JJdmNaTFZSdnA1dGdCTCsxT3owZDVBbkw5VUtoRnREZzBIdFRZ?=
 =?utf-8?B?M25IUlFRZjhFUGtyK0JLYW9DTkFXcWttd0lnSE0zVFZTdjhlNzFIRVN5RVc1?=
 =?utf-8?B?N29GOFFYeTBTMVVJaXdxZk1WT1JzdjhOSU5FNi9kZmtSbVJXeS95K0l2NjJ3?=
 =?utf-8?B?UFdjNWF3L1lpQVlRNE94a0VQVU15QmRIZWNWWjVpaElqd29TTUh0V0ZzL1V2?=
 =?utf-8?Q?nDIVGzBDhgsWWK6yi1O5fHRV/COCxWEQZjOz2JpqN048T?=
X-MS-Exchange-AntiSpam-MessageData-1: PAqPysM6g9KMGATgYc+0ZGCG4i5+lQ9SsJs=
X-Exchange-RoutingPolicyChecked: m11kzIuCXzPgrF2HZBsubnaZAxMChnDWzGR4ONicT7y2AD/E5tNEQvp639dIJMiOifOgGuq2/A1WFq3bU+Dphi64QslcS1qDmNPukgjWe+Rcskh5xyJwaQ2Y73cM+Mnf1+M+PszGvcX1RRxd44UzS5EtYxcY41jkwMPxlRl4F6qyuwZV4EdY2VcZ83sDCtTGZsoNyJsSHlBfJAVjF9j0YaPHLOuMIMya4mbx6B+73yBtKYc/TUgoPKdqIj+XyvPlLQH7Oq9EJ8jWyJGFz5E3MsGgxNi7HaH6+gdwjGYMHjJs5mm88GJbmV1MtibuCZBJHnh66qjAulLeHSj0yUhwlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 515755da-ec4d-4dde-eef2-08ded9478e7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:10:49.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urrX5lZFvLA4YPF8kkhJ7i9Bo2tRXrp1IxbCc/PRkW6vqNbzqKgXukatcaWc0OS2r1HCmGxOnYFCU9CvFdOBLO4alyFdgdn9w11kESt5Ys4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9327
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

On 2026-07-03 at 16:29:03 GMT, Sebastian Brzezinka wrote:
> intel_gvtg_test only needs the core assert/log/skip helpers provided by
> igt_core plus the lightweight tool stubs. Replace the monolithic include
> with the minimal header set and stop linking against libigt.so.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/intel_gvtg_test.c | 2 +-
>  tools/meson.build       | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
> index 408e703bf..fe8f7a599 100644
> --- a/tools/intel_gvtg_test.c
> +++ b/tools/intel_gvtg_test.c
> @@ -30,7 +30,7 @@
>   */
>  #include "config.h"
>  
> -#include "igt.h"
> +#include "igt_core.h"
>  #include <errno.h>
>  #include <getopt.h>
>  #include <math.h>
> diff --git a/tools/meson.build b/tools/meson.build
> index 2a084a0c4..6e694164f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -26,7 +26,6 @@ tools_progs = [
>  	'intel_residency',
>  	'intel_tiling_detect',
>  	'intel_gem_info',
> -	'intel_gvtg_test',
>  	'dpcd_reg',
>  	'lsgpu',
>  ]
> @@ -132,6 +131,11 @@ executable('intel_display_poller', 'intel_display_poller.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gvtg_test', 'intel_gvtg_test.c',
> +	   dependencies : [lib_igt_tools_stub, pciaccess, libdrm, math],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
