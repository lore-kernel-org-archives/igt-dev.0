Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846FCC54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBDA10E4BA;
	Tue, 28 Jul 2026 06:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VimFM+ao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00D910E4BA
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785221474; x=1816757474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nXZnRWC2zY9sL3dUOk1qdhbyWvl8pyKw/tOChj0PATc=;
 b=VimFM+aoN96cfbQ6KW0w3/pYQ656ofdmTMxzk+85pfvLr4AqRXhNYjug
 Mr6b8Au489llD//LI0bIECKFAYSEri3C9jXGbeYiKnFveqSW0X0Gem9i6
 rVh+s2u1h3w3PQIEqPgzMtk3Ix1V58BG3h+Ws67xvpoffwMq9mko2q3UE
 HNlg3Vv75ATtDxzgLtsvijec8Z+JjMYEhWASe4wnW1IRUlch/39SkDjZl
 Jhtx4daN8DFv2gS6eTVSXb32NeAGoQyEL93/OS1iVhErzONWOH/qp8Tst
 MrPJRXeLnkTumdrCtZXpZnzb9DgfNLMAZTEg45XMfyenkYofzfOH5G0pw w==;
X-CSE-ConnectionGUID: 4wZ/G8jlSQyNTsya6bZ+vw==
X-CSE-MsgGUID: UIY1FwFRSlqdA2z6grineQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89469367"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="89469367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:51:14 -0700
X-CSE-ConnectionGUID: 1oQL2hZxRgWVoSCM+1wVrA==
X-CSE-MsgGUID: rztL91iXTP62pST6Vsadtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="263932523"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:51:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:51:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:51:13 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:51:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NofrUJvd1yPKL+BhHH2fe/5xQK31Xbeb23rNypVYRS2hWc+MJy4wxLGxQjNSIiF2ZG8CLrGhz32iOJi5pajY6L3RKBTR2HNqR/U6RjnUp0MGx/Yfp2DwJGHtUVmHAqi9hXQ75oQ5QM4edAtuX99ZPtJk1buwSizr92wBdsKCaUoJa6InwLLg1o3vmDJc7nsUhuFWJgVJ7k99XunuUjWL7yhASjTQ22KgGSp4cQ0onr7duwa/IZbTHAr++bXeWfvsfvvjZnXLNYlMoi0d0FmGdwtXSsGOI0EuNbWVwc9Ik5HQ3kkd6iVy7k3S+IDaHYLzeLZR0lxvfDLtN3AUMvhXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTMomQrdv3vcTguIVpBNa+RmrlYca/bYZw0aZs4V54c=;
 b=M6zROYuVX+2ewr9BkL0taT+3JEy9hT4IYy2JnrYd8oJFnUFc/dIT30JrQCXfZC3jNADBnTruC3V9XradK4ykTnAi/c/Ep8rLi7RkzpgkdoAEPV7lvoDBD6Msjpo47hqnD4ShvAWmv70BH5MIwH8acZfiKGiZxsf/PUQMr3t14Vr+vSP5Muaa0axcJqqOCR+IB1aQnBg3Fd2fL0Rj3f7Y+bP2abajFzQl26Oq3kRmDafoDljnrgqJ52llSuGiH3IPZXAgrTcpVE3MTgBpLDHo6I0prrXTnsUIX+gW76eiw+19KwJuOiL87fSUJxWptgMk89JdX5OTAIyq9wIFZkxiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:05 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:51:05 +0000
Date: Tue, 28 Jul 2026 06:50:53 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v4 01/31] lib/igt_tools_stub: introduce static
 sub-library for tools
Message-ID: <td27ezsvf2wpa3tf3objsvggbxn25fm2w3xedybsh4y57sa4sa@gg5eppvd6yop>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
 <6cd55f6efb0ea8e6dce0a66de140a2010100dbbb.1785152675.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6cd55f6efb0ea8e6dce0a66de140a2010100dbbb.1785152675.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU2PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:10:234::12) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd33726-fc50-4cf4-af7d-08deec74985b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: GsMm8bjviZLC4gk9ShZsZc4io+RXpSXsFNakH/ZN9djYBE4zHDRhkbNrjuebOvSOG0IaSgIBoSQRmzb+iJ/q8TDnweVFtHN/ZJgWRQEptLqUSHOZnSRnnbg7qC9c3aHju74G6WtL0CHUaHgfBInTx2RVqXIBKcIRjwbUiKZZTHRwebthn8UvzVVjDyVcfy6qRhKWGvwJ/MkYqdwJgGhIAgFNfCshJ++z+5VtB0HH+H/vSbnOhlKeClwj+1k+GmEg4Mj26JviasE7MhiNia8lqk5vZC3ZDK8ANtO/YCS5TLbgbrwfHaVH7TubMNOfryClRe6Y8n0VJYS+foqUOtkVorsJtCbC305617LYm3OQxamkP8d+7o58PV21nM7fcjkiZpC7PhcSOepykoJB2bKB+Ma5lDiDuW85rOD/zgK7YxU8tz9AU3JpcMMDkRv/1I3z1+qC4wXkiVIRmsbqZKffyFS0pncCSVze/VotSABm5EYpCrStxau6VpIKg0/BzAfGmZ7ChE/ZyOc+FYpsj1a+/PD5inBHgAZz9A2EtskJ1WR5Arfq2ZXK+kmvNeVweiPt0hGDUgUkOe3GzO1mDp65G3HOmbZFkVzgPqcNtwJ+VwoGcJ0YzTEKJVO1nyKALjYy8CNdJhQgQ6VoFkmlNJYfg5dv4N0Cj2BbzEBCTkBX4a8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkEyQ3p3WkM1TlVhd2VkWEYralI5UG5wN3MvWWhnVGZrbTN5cU9GK3gvbzJs?=
 =?utf-8?B?dXRyMVdwTzZKeTdYN1BTTkVHOStEWmNhb0N2UXdVLy96Zkc4Y3N0UGFlalJ4?=
 =?utf-8?B?QmZ4b25XMEMvR1Z5UFhvOVFBMEd2bUZGTmVVemlSQXpWSFFzeWJiNkx1M3RX?=
 =?utf-8?B?emUwVFluVTBjQ1BaTTZVVDZrVy8vbEYvcEd6S2pndXB0YmpGYVhNZ016N2JY?=
 =?utf-8?B?aFRFU3ZUZFJWaHhnV2JMcW4zaHM5d2F6SmM1UG9EcWR3T0FGZmpYUlZwZkJN?=
 =?utf-8?B?a2dWQnloYWRLTTVjY3hScmhJY2Y4TmJUeWdBN0VYTW9iODVqWFBUYzQ4bytl?=
 =?utf-8?B?anY0SWlqWCsvU2FvbmlpVGs5emtXejZRTmw0TzNlK0RsLzF5ZStVanVIeVpz?=
 =?utf-8?B?bThaQk5WeExvUFRWMlRmcUFVeVBSa21LM1I5NTRYR2ZaWm9xaGdBRko1T0Ny?=
 =?utf-8?B?ZVFCbi84b2Qzd1M2dkhQeFhZK2YwdFZraGR4ZDFhZ0tydnpMdE5kRVVackxD?=
 =?utf-8?B?L1NuRzNoYWRWY2Erc1JWSGNHa0NCY1d3bEtvSStEOTgrMEk0V0dsZDlYdHFx?=
 =?utf-8?B?TFJGcnVIdUdXWGYvbjkwN1dsbDZjZG1LL1dobGpXYXNoYjFTOVZYdzcyWTlF?=
 =?utf-8?B?UGhWMFRMN0dxVmJ3ZUk3bUVLVU4yWC82K1pJWUhSbFVacW1jU1hTNDYzN21H?=
 =?utf-8?B?ZE12TEx0QkdXNTFZc0l6YWJaQlRtUm9FVGpiWFloWTdGb0t2THBKMjBKOGZm?=
 =?utf-8?B?T1lJQXRaSXAzcmowZS9nUnFoTGhsdFEwM1A3SEwxS3NidGdqeVFocXFuemZQ?=
 =?utf-8?B?N2Fac29xM3dzSy9Ka2lXS2lmOThSaHdQM0ZpbFU1djEwaVdQWW1zZXlBTjVz?=
 =?utf-8?B?dFZjV3RMK0ZZLy9aVXN5aUplL3NMb0pVakNwd1Z5MW9FNDQxcFV4SjhEV3Zv?=
 =?utf-8?B?cHk0UERJMFRJN0JWUGdORVh3WHBCYnViZUZwQTVOdkZVTWVTaXdnbW8zU2Ns?=
 =?utf-8?B?SDlYK24vcWo4S3Iyck5leDJJczFDYmdraTBQeUZ6SDRHV1FoSHNzY0RnWm5m?=
 =?utf-8?B?Zms4b3FKcU5lTEhVZTNUNGY2VGhXaTZUWGQ1RjNsdVh6dEVtS2p4dkVWU1R1?=
 =?utf-8?B?a1QrWGVsRkNCb0FDS3NhRmJ6dXNoV2UxSzQ3cHpGRThtaUQyUmVSNVNPYkN5?=
 =?utf-8?B?MmQyNEhhNEt0ME9ud0t1VlZLdmN1MXRrVjY1UWhvRGVPTHJ5OVZYUmpNMkJi?=
 =?utf-8?B?S3doT0JuTTc1VU9jMVArdmZXQWdZeHdQd1dQVHJscUhLM1o2UTJ0K1YyckJ0?=
 =?utf-8?B?dEkyanhmSUJyUWh0c3dKUmxaQ3pqb2VPb2l1YTBqNU5ydDlibHF3WGRyeHF4?=
 =?utf-8?B?TDNVLzgvMnRhNmUvNEpWeWN6UHRYdm9ZeUFTTGVIVU5pRzg2djBrcnpSREo4?=
 =?utf-8?B?NlI0OC9vQnJPZDlsNnlKajUxdjVabVUzcjdSKytYeUREZnk0UmV6MVgrTi8v?=
 =?utf-8?B?d0FEdUs1LzdDd0xQSlN2U2Noc05SSWhKUjg1cEYrdWZrRU1iZGY3bmlYenRV?=
 =?utf-8?B?YytydmRYbFNnUERtaFRnaThHYmpGOW9ncEQ5RU9za1BueTEvL2FuU1RqdENS?=
 =?utf-8?B?YisvcXpyK1V0QnVHU3YyRWlOdG11TTRDMTVTSldudDlwYkNwSkRCbTA3aDl6?=
 =?utf-8?B?bmZvNVpHSG9Oem5uYWNFb2F4NXczL2FiSmkwL0dtZExETSs3c0dTd1gzVEFy?=
 =?utf-8?B?ZTBpOUh4cDBKQ0NYWnZ5RElXQytCcy95bnBWejU5Ym41RHQzWEdxSFpoMmdh?=
 =?utf-8?B?eHpTSldoR2h6NFNRN3JpVTNKK0F3b05VMG5hLzJNemhzdnlDYnBaMmlETGpW?=
 =?utf-8?B?MFo5enZDcFZ4bCtBMzBhRUx4VHoyTGxneVNCdkU3dW9HTG1XcE9TUGM1cTh0?=
 =?utf-8?B?Zmt2UGJHdTU0MnBhUUtBUnZ2OGJudWtud2VnNnQvZmNFeDlteVpzNTlLRWlL?=
 =?utf-8?B?RU9OdlRwMks3Q0FLM3JSTC9mVXFKVmxwTmlEZFM2Y3FQcHNmQlpVb2x2WCt4?=
 =?utf-8?B?N0hUUm53aXBkcktPMTBOYzd2TmZHOFovZEYxS1NZQ1hhVVRHcGtqVjFkdFFh?=
 =?utf-8?B?MDhYRkw1MisrV3NsNHY0SkIvMGVtL3h2Mll0cHM2R0hzS0c1M3FKNS9GMWk2?=
 =?utf-8?B?WTVKalJLTWFMMDAybTZjVTRBWDBVelU1QzYyUnBRYmViUC9ObnpXZklOaHdQ?=
 =?utf-8?B?NTN5L01nNkI2ZXc2T2gxTkFmdk9mU2J2elE2ZHdXc21FWVd5UXgwOE0yejlj?=
 =?utf-8?B?Q2RxTDMvZ0pBTFY4aEVpcmpXbkNJbUNZT0xka283MUFicXNjcXhUcDExNkpT?=
 =?utf-8?Q?+b/zC2c+NwhOuOx8=3D?=
X-Exchange-RoutingPolicyChecked: O+ZVZFvVKuer20Sak8aiHAdvZDvjOdL2W01Goyy7Isd+wHwEj+pb9Q3V6QJmpHjmDUbB2PLb54Wrm3SsmWr7n389o8Am6awkmiLz9h21uvaOl0ehev71ixhzhixteO5ZugQCXOKVxSJzL0EBgsZmbA3raekXoG7CnnEFl7TmifefuqBnDHpy5aN9S1wXZDo+JpkdbqLnPFMPBPkHQS6BrU2g5TOX6xJM0Rz7QW+XeOsHWHeAgV59wntcr1FOPRJMmh1iLw0YeXTqcS620lvAFqN8L8rT4gVyaLquG1aZ6rMf6BpBGVl4GQX+aFq6kCF9V42klRPpEbRUBqReObXaSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd33726-fc50-4cf4-af7d-08deec74985b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:05.1113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Kb5VZAxpGzOsrjdjAkQXCH5fa8G5sesNVdd0R3VVpBWLQmyvNxF0OBmDezxK1gUh9mHdI1wUSm66MAvbuC3M8AA5vSEly4e7XFy2GvmOPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

On 2026-07-27 at 15:22:29 +0200, Sebastian Brzezinka wrote:
> Add lib_igt_tools_stub built from igt_tools_stub.c. Tools that need
> minimal IGT assert/logging stubs can link this without pulling in the
> full libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index d1289a5e0..e95b29d49 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -349,6 +349,13 @@ lib_igt_perf_build = static_library('igt_perf',
>  lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
>  				  include_directories : inc)
>  
> +lib_igt_tools_stub_build = static_library('igt_tools_stub',
> +	['igt_tools_stub.c'],
> +	include_directories : inc)
> +
> +lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
> +					include_directories : inc)
> +
>  scan_dep = [
>  	glib,
>  	libpci,
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
