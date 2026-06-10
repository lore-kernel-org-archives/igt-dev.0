Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACC6CD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 06:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42F10E71A;
	Wed, 10 Jun 2026 06:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8LC8uxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF8E10E71A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 06:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781071740; x=1812607740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IJK7rgN4OMTO2RWxowTS2SbROOZlLiK2tPQfohU7VhU=;
 b=h8LC8uxuecRftX/et2uqAZRFNk5TcoeYSe7ENSDm2JnQg5gcLq0+lFMs
 T88FVFVXY5SumYdXraQ/pHnuopUjTpgi7Ac/HBacSZY0F3KRCDxCg33ng
 ApjFSUJAthVN1RNKDdqeztVxP3lY0FMiES4hcasM53H3ZCrN0VzZh9q6S
 V135WeCQUxJFyQua02nr8NTYgcwn5PmO1mFdTT9Eioa4OB4W+6ecPwiZk
 MMpR5gCiPU8Ql6e8QoO5HiAGjG7ukTqx40vJsb3vSqyOHDmWUML4bSpLK
 4Judw5oBXmEs2KPO6g+4P6bTwe3xUMkW/81kT95KpJUYwKSAI5i6cBfp7 A==;
X-CSE-ConnectionGUID: YjD0meqcRYurp4oMSbD3Vg==
X-CSE-MsgGUID: IqvbpTUjRuqcvUN+sAUteg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80871647"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="80871647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 23:08:59 -0700
X-CSE-ConnectionGUID: iW/55oj9RH6w1TqU6D4kuA==
X-CSE-MsgGUID: JOx3shMNQv2u9XFhBtMYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="245227393"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 23:08:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 23:08:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 23:08:58 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 23:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9LkUkk27thEPw2MN/zfBjfBrmqEfzsIhHKu/nmdIMwmUA/Zf3Qu1hqLcz/Tiz+9E7Wi4DD6qBb88x97p9RzMQ9CAShNHzuZiizCRd4EJuzqPE9pT0yUBr3NYRowNj6lhdpI0nPwNRlt3yjAA/mmkhqDpqG7AFNBcLlBDQTZcDez1N1JTLYpEtvM65NBA6rhLoQAIlWOQFNGKPO2a0FtqJ/y5N5kL1vxc+FCM+NItkmnHah7ThaCWJ9dPHDzQ5Hd7ffzJ1zU0jKqVTNVzXGUP+Sev0PaeWFP24pSmMofcSrRK7mBD1OUMfmru5foHlWp99XbRrAXKBkebYScZIN/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkmJzhZwKmAOeGujkt7uB7jkhmajMGzFQQ5fkeMnqnk=;
 b=oU/mrmTldWi9ijMER4TH9X/UHRqjCF4lwFRldr+OWHPi66jmP2uLgCwUpbozJdK1ZcHtxinh7lsJj77C6lj5CIItuVf3x1VeS0yoSmlpBc4B7HBVOz1uMl3hNOQIy4ksA7acOW3V2OIoP2lNE5TCFIOqtWeVQQC1RTm7bx5KhNyAE+UvjrCIMU2X/A1JEM8miSuTJxXGzAncKh67IvkHa6HGrpUhpGaAjRqGXdW5E9Vl9ElkD/5D79DopJ3uFTO3h3GVr7ORhIdJnkAVjGHmSczyvcmUkpytyCLmIsJRtQ9s5SRvIDKUdyJboShcvyFNg1DJQujaXVt/TrpGx0BZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 06:08:55 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 06:08:55 +0000
Date: Wed, 10 Jun 2026 06:08:43 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: enh <enh@google.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] fix android/riscv64 build with linux 7.0 uapi headers
Message-ID: <netazu42qvgnkmpd3yp6aftp72tp75oatonzcu5f3ilfkq56j5@6gbgzon56oyz>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <CAJgzZorTqga=4+CnZ=1awR4A9YvV5Kq-Yw8QOS5PSvGoOkZBXw@mail.gmail.com>
 <CAJgzZooGLKb2SM1PUXeaX1fV3JZ2pU_3THo7USp2RXhxZGdNjQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJgzZooGLKb2SM1PUXeaX1fV3JZ2pU_3THo7USp2RXhxZGdNjQ@mail.gmail.com>
X-ClientProxiedBy: DU7P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::16) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DM6PR11MB4545:EE_
X-MS-Office365-Filtering-Correlation-Id: e898717c-4526-4cc6-a654-08dec6b6c0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|5023799004|4143699003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: kxIA0fT2bN5slklF8ZjcpVehxkZOeKj5dxL58BGcTVfc3RWpgtMDshjQ0D6Elx+MoNz1RMqFdI45MWhzR4S8uZPuErRse39daCMhuiIDt+kHcw38vjriYL6gZ19wjbzuGLZXoBQbam+YuT03HBF5zMi87M/RsQs1chEyEtZTsgTWWgA/QG10ucWOWjSxvjNppcJhC406mLJkwkTZesLyPeidmvu5AboMSseV953jAnTDgS32ywYe7A3xiP3HkMJOh5ShztJIF8vW9TyVo1LViTrFi5CTnwv7nbCZy2iQ3VhHti985iG6TU0ks/ts8KsxmXm8SejMAX3onmVOMxaykXBJ2gJCSSEC/CM5x6+tNk9HmEKjS82isfA5S/pShIPCEvITgxBf+S1YR5tQa+XZ1hiAFcrEPk9Vmgwju9hQp+4Hpa2M3m3uSZM2RJ+fImZ5rt0m7tykwZLCMqBILQVatlbvN5eBrVCIOR0iIMLnohAiXLncsmIumDIT93CVgJWVkbIK0H/uhGgApHlwNi5zvva3Zkem9jM0RCAf2GmZGt9ebDXgaQdQB1LhKxpdA+hwEiaxo1ltdoHmclPFD1lBYUZNHDIzNEgOVNOHy2CYnDsxfhR4m3Fb3oxKG5gY5j0iWLxarzh/npylLI/EU1zF8S+L6PNG0MZlV2j4MSrdsGfdT/6pPGrY0TZM0Xb3q8U4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(5023799004)(4143699003)(56012099006)(18002099003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elZrNjJDU003OFkwMEphaExlRjRNRGh3dWJwN0xreDQ5OFZzVDFhZnFkTkVK?=
 =?utf-8?B?NjF2d29MaFZxazIzM1ZpL3NJM0ZZRnhHNWVQY2h2NmZZWE1WeDJlVUtJTzlz?=
 =?utf-8?B?L21uOGtTOTVuMnc4eXBHczYycEJBVXozL0pJK21wWTFLYVoyTzVZL3E3eVFC?=
 =?utf-8?B?Y3FkcjFGdWlMQ09zL0UrVEpGTFplaVhtOEpsLzJLWnUvcHRibEpaMGlMckhx?=
 =?utf-8?B?eEtuempNR3NVdzZOSmhnekNWRW9CTlltOUlJRjRZYWNVbks0M2ZMVzNOWU0z?=
 =?utf-8?B?d2h2RW1pRUZpSzk2dFA4NG1lVkl5U1J4YnUySWVRYi84NEJCL1E4czYxUDRu?=
 =?utf-8?B?TUJoVCtTV0hTcnBWbjh5U3lKa3lMaldSNkFOMVJjSWhaM0VUUFBQd2o0cjFy?=
 =?utf-8?B?VzMyN1NxQTNyQ1RtM1VtdnBYTXJseVlkaHVLUE9QcEYycXBYdjNneEN3RzNt?=
 =?utf-8?B?YXZoeVNyNGUwQzJZNjFoR3Uvb3g3Z1ZyVnV6OHczc0YxRllxcXFvWVRPZS91?=
 =?utf-8?B?R3B2Qi9odWhxTGJycFRNN0YzSDRueE5jSS9VeWlvb01ZOUlMSTFvZ1plcmpI?=
 =?utf-8?B?TmtuRkgvaUg2WSt1L0FZS1JGOUttN0FvbUJZcVNJVlN6RnRVa1ZUOWtaeXRn?=
 =?utf-8?B?SDVqY09jODhzVUpiSHh6NDdGR1U5NnE1Wm1XWWlETTlrZ1pCcGxLSlZCZDk4?=
 =?utf-8?B?VHpPNW44dVF1R2Vwc3NKYVdoSWU1RlhGdEJ4VlJ4N2FJQWZQOU5QbzMzdUtn?=
 =?utf-8?B?eUl6SVNCb1JyRTU3L0F6WWh6VkhDWkF4VGJJWGpSM2JnZ1J1VnhvZ3hIQWZq?=
 =?utf-8?B?bEE4MkNzazdKczhmT0p0Q1pXaWo2S29JUlVCcGV6b1BKdGEySnF4azZ4RDha?=
 =?utf-8?B?R0IxcnRYcXdsekNWdFN2T1ZSRlJTcFdUTi9CV0dlTlR2OVUzc2wvTWNqSjNm?=
 =?utf-8?B?VitmVnJXSUN4WUo3cWVLUkNFTExUa1piMkdLZGRJaGxkdGh5OUJzRXkwZ3di?=
 =?utf-8?B?TzQyUTNma1drRHFwemZxTmNJaFRYVHo4Y0tWM05tY1RzSFZvcTE0WWpyc3ZX?=
 =?utf-8?B?T01abUdDN1U1Zlh2Mzd1MEUvNmI2VHlRQjBQTWg0ZGV6dFlmdE04VW0wRmc4?=
 =?utf-8?B?TDg5YVY3NUlRaXBCdkNBRVhIRS9USWlTVzU2NDh5NlJjZWpVTW5Rbmx3Y1Rp?=
 =?utf-8?B?TlRmc1JRSVVOdjgvc3YyTjFtbUQ3SXREdlZ1bnRtN2gza3BIV0haaHc4RW1B?=
 =?utf-8?B?U3NjQVdmM1A2Q0FoS05iUGM4UjRRYjFGRFhXSlJudnI5dkIxUGhBME1mR3lW?=
 =?utf-8?B?THAyREZuYnE0TWh2TG1vMkF2bW5jaDhISEtQOXNnVHJiZjg2d29YMzlIODlK?=
 =?utf-8?B?bVptVWh3RWx6VkNXRE9wVklINHNCQk9vNVhiMi8zQjBpcjFDVUNoY2YvdnY2?=
 =?utf-8?B?NzhUYXdZNkYwU2NxMGYrQVVpdnNLUytBRkdOTm9qV3N0SUJWVUhBUWp4N1hh?=
 =?utf-8?B?VWE4M2ZIVTV3V3ZON3BDWnZaRGFOdExZeFR2QXVUQ3AyL3lWVUNud21IQ0lm?=
 =?utf-8?B?Q1F3aDN4N2hJbDAyWlZGazVOSEgyK2dIS3A0NTJIQVhCekIzRnppVTJHYUhh?=
 =?utf-8?B?STdXSng2azlLQUMyb0ZsdDh3eUdTcUpRWnFoVEZuOVBtbzMvdmp1NTVHRko2?=
 =?utf-8?B?QklKaG83cGl3VlFvMmNIK3BHSDBSVkl0dW5MVTZzaWsyZ1dtWndJeWgvb1c2?=
 =?utf-8?B?eUJhc2JFQVR6ZVZ6YTRkV1U3eW96RHN1VXZ0ZEhiQXJWMVRjaStjL1hUSzJO?=
 =?utf-8?B?a0k2Y2cyOWJYa1ZnV09zQURZNVBQblpkTFF3RVowYmxMQVJyT25RWEY5dGg5?=
 =?utf-8?B?a0dmdnBmUWpYOTlGbnI0ZWRhTVg1U0k3U2tQblNEZ2kvYWF0b0hQSEQ1WVpt?=
 =?utf-8?B?Ry81NGVseHRvRU9Sa1E2SEE0MGJaSFR6OTUrRERKbnZTQ1p2cTZaY3FOWXkr?=
 =?utf-8?B?NGxvNzhRQW16REkrNS95QWNvckNIVzRiZ3p0eDJkbTgyY1ZFWTNzYWFHN0ho?=
 =?utf-8?B?bUJ2OE1VaStPRUNFdXpNTGsya3dMdTk5bEY5dmphdmNOY0tuMGxFSUE1Zm9o?=
 =?utf-8?B?L0NjeWlFazdFUU4zOGI2eUxwVGxsMkdpbXMyVEl3SnZ6SUczVkJVYkovOTNS?=
 =?utf-8?B?dXg3aFpqNk40M2c3YVdHQmVOSEpnRlhoK1BxOUQ2ekhZOGg1cWw2anlrZENH?=
 =?utf-8?B?Zmd6bUJ0UHVsUVI1NWs4NnplR1J2Sm1FUWN6OVJUdGxIVUQva2pCbXVsRmc2?=
 =?utf-8?B?dU9rclYrS3RDZVJPZnM0eHNDNG54NTdjLzYwYWxYclVtU0JvNFJ0TmhwK29j?=
 =?utf-8?Q?uypvPvT15dW+sHgc=3D?=
X-Exchange-RoutingPolicyChecked: LGavWAwp/1tLDL73K6OTQabWuB6g/WzwjsKszf23Ei+kapauF8kMzu0DeVFzG8d2dXGfwN02Y63eCb437D4Dhu5ILjPZ16srTQKlKhadq3IYhO6QAHCEmNqSCQW80smAGKG2VOZn3vEIDntYfnaesB5bZN8RT1cQ3fUj0YuhKkJ5HW819nsU3cpjgNspSXXUQfABqCfmZe9BnfAcjWOBX0pvm1JlJQsg03QlP3vnVtjLYq5LE1WkOJPVGcxo1rwg0yWVq7/vPvmVMETzb+PZ0sfC/914ZGvr92xbhpwtqrBrJOpNUUSGwuuutf9b0aF/nORskWa66zSN6j5f5nhT0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e898717c-4526-4cc6-a654-08dec6b6c0b1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 06:08:55.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1XBcoyokPF1gxEbjZ3GdEM84Cz8HP015DQobxx+iLQc9QDoX0YWrBMkTrgKql3l5Z6NdS6UOCsklp/AyE72nfOKFzPnTzTtlDh63d+NOgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
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

Hi enh,

thanks for noting the differences between current igt and recent
linux changes. I'm adding Zbigniew and Kamil here, as they were
involved in the introduction of the patch you aim to fix below.

Zbigniew, Kamil anything against the proposed change?

On 2026-06-08 at 16:58:27 -0400, enh wrote:
> ping...
> 
> On Thu, May 21, 2026 at 1:21 PM enh <enh@google.com> wrote:
> >
> > linux 7.0 adds a #include <linux/const.h> to the uapi header
> > include/uapi/header asm-riscv/asm/ptrace.h that breaks the
> > igt-gpu-tools build for android (which uses the upstream uapi headers
> > directly).
> >
> > the obvious fix is to just remove the #error (and the already-dead
> > duplicate #ifndef below it).
> >
> > this fixes the build, so it's all the change _i_ need, but i will note
> > two things:
> >
> > 1. your backup _AC() differs from the kernel one in that the kernel
> > one in that the kernel uses the double-expansion trick so that if
> > _AC() is _applied_ to a macro, that macro is expanded first. this
> > doesn't matter for your current use case, but is potentially a sharp
> > edge if further uses are added in future.
> >
> > 2. you don't seem to _need_ the _AC() macro at all? unless i'm missing
> > something, it's only used later in this same file by the _UL() and
> > _ULL() macros, which are themselves only used later in this same file.
> > so you could drop _all_ the macros and just explicitly write 0UL or
> > whatever.
> >
> > so there's potentially more cleanup you could do here, if you're interested.
> >
> > (i don't have a gitlab account, so i'm assuming you also take patches
> > via the mailing list.)
> >
> > --- a/include/linux_scaffold.h
> > +++ b/include/linux_scaffold.h
> > @@ -22,16 +22,12 @@ static inline s64 sign_extend64(u64 value, int index)
> >         return (s64)(value << shift) >> shift;
> >  }
> >
> > +/* May already be defined by <linux/const.h> */
> >  #ifndef _AC
> >  #  define _AC(X, Y)      X##Y
> > -#else
> > -#  error "_AC macro already defined"
> >  #endif
> >
> >  /* Make IGT build with Kernels < 4.17 */
> > -#ifndef _AC
> > -#  define _AC(X, Y)    __AC(X, Y)
> > -#endif
> >  #ifndef _UL
> >  #  define  _UL(x)              (_AC(x, UL))
> >  #endif

-- 
Best Regards,
Krzysztof
