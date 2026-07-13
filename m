Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08ADC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 19:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287510E642;
	Mon, 13 Jul 2026 19:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtHk4Ueb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6C610E642
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783970844; x=1815506844;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dSV+9WNWOVO+z0rIFwz7i9yBHOnmdonmVbR/F2R6VZQ=;
 b=dtHk4Ueb7Ly5h/euC5CW+CJ5AdxB1kStUemrkZGsyIi2qxzSpmWaWVfn
 2igNTvykFJxFtF7VCpodmZvJIjsvno+Zenl1LGjnKClpisFXW+rbKK5qZ
 dreMHmGA2DEgpRrVrNfhpNtsiJOBX7wZdUo8er5YoZhF0Tbrl0DNja02U
 acM8KIHvFayP7wYQ0UO4wJwcgN2vkFawmhE76ihxN5n8DE8KkiNhGtsL+
 HBbFfo4vv1gPh85NCuilO0ZDbYpEF46x9ap2OY7xs6fZbF/tmuYNSyEZA
 bPdJsP73dxkYwe6t2fGbDFhFLix2ZsDBsSy7RDHOMn0OaxjAvgzuHI9Ly A==;
X-CSE-ConnectionGUID: cSKy3/y/R5ig0L1r3gJBaw==
X-CSE-MsgGUID: nvLmgPQyQXiiJh9lMoCkIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107383723"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107383723"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 12:27:24 -0700
X-CSE-ConnectionGUID: fmQnKcScT4i3exBbpylzyg==
X-CSE-MsgGUID: +J4gxlSqRciLu2ZQK7Z3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="251210445"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 12:27:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 12:27:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 12:27:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 12:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+LAm4tTJQ+mI9j4J4r2u4leEmFAzGPh6ts78R5FspzUZ1Xo5tWLAH+VHBztxCuGA2RUWumN99bHuURw+CW62TZ+dnq8a0NrTb/mg8ygrw0dbAvnF1fM9PcVSFX2Sc3q7rRhPci9zoLgx2Fyu3aSg0deIEy6OWCe7sixrax9ZM41417VJHg2QkW5jOXV/lCaHnLs5UClHfeKDhO0wnByzGOl//zn7V1Hny0gPFW1FK4dleJ9qK5DJH/iS+VT/r25+ixywYN5/FP5TW3WXSy6qSeS8JFdN6fBIFlCZ48sWPf/RBw9YZ0R7CB6Sw8EQ2aaWuKLkj8A+6i9f9cXNmngUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT5hOk2yHPrPPJN6Sxo+D1dyDEAiHLBX4gAfXqzxIPA=;
 b=PMilC/T9RtreZYMe938jEJGmi8aY+09JUL9tGDWNKlp2clKgxmudYUUhrGLv2MmjBNG2dkkrgRu67/p5rJh7uLp1WqSbNTiq7E9NUI0cW4c0QiRH95pFWjZC4JlyyeJdjBA4VoYC6TSCwXcqFdsDoCLJfpL69Ykpbs0gM/9W7bL7j1KCySY2yolXefsxkQTC9I+1SRTdqdGtYIaBhy9gd4wk6R5+NffX8EubR5Gv27ECix3UKJtqclp3GkGtnoto50af/28OBaOV2RjPummXvkCiJue+2ycCClAEl4HdPk3zAZLYJHMMTpceeKQ7vGF4ijzl3h0qzLlJKaxiFW/xRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 19:27:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 19:27:20 +0000
Message-ID: <6373280c-ac15-4bbb-88e1-e35dd820b610@intel.com>
Date: Mon, 13 Jul 2026 21:27:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on
 VF/VM runs
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, VijayaKumar Nallamothu
 <vijayakumar.nallamothu@intel.com>, Piotr Rudnicki <piotr.rudnicki@intel.com>
References: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B82.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::60f) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYXPR11MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ffe76f-ad8b-4975-b761-08dee114c209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 38XCer3MAb+//YYrJoo7kntJ0jYVp5iPSh4QtWBSwVGYBHby9FdtQ6gIVwwnFDdkvsKthkJz4ujsjQxuW5MO8CDwInvhjhxthui7YXoIJcpdJ+FO02oh2F7ZhAVN4zbf83t/acZ/nR1R9myqOf/lQvBtLK0oflanx5MomlvChwckHPLjnvvDP3l5CFw94Ow9Lzap0ed7civO3liQJPEN9U5INQp4BhEsnOpGTZz44IJHVgqz1avZYEVfvdepbLhBM3MjcF8+cO0tdvkJ6nNK0/p19xskgssGYTxu8XkDRGit4IcKGnjQvdAc1qcoDrNDrmw60MNcGDA2rCpxZEtkGBX4zvyKwGQZUZaHxuyqRRK6EA7E6WiJrkUkehm+qp0fkRd/fyCq7sf7xuSlkYszsw7E/HuRwprLZykB/OuPkp+t8ucWT2gUUOq97a2Wr+gamuXnF8h+AxpS/u9J8bqP/KUjANQnGofHdLTRGppxO9f5qS8gAfmBwT9nXYUBuUKAG5+fNjrnTe3HrAtEL4nxyXoLPri/n9cbQPIakLGFlUO+HJUNfc0DpBfpbzjHiZ204HI1bfM0bh29m7WDHQ5uwHSpoGlQt2mUGHckuVz6aYU/9//AcKYuoTGdeiGvYqB6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpHTUlueUpGVmd5ZlA2c05CbWNKNVhGa0hOWkxqT3hxSloza3hrcGRkcGpw?=
 =?utf-8?B?SjlxU0FieVI4QUxTT1A1V1lBcjhzR1hOVWMyaThJV0c1UUFWZ3dSaCszclNr?=
 =?utf-8?B?Q2JnN29Db1BpcGFuN0JSbDQwUE1Bd3NVRWJ0SEo5aFJLKytWRkV4MHU2MGR6?=
 =?utf-8?B?MVBsQ1hmUE5MTml1MWwyOVlLQWdRc1ZOMWtyUnl3L2xNc1R4cHl1d0dZcjcz?=
 =?utf-8?B?SUhFem1td0hHbXFhSkYzaVgvc0JYMnpPR0c3ZVdPY2lLYWNRaXZVbjlZT2RZ?=
 =?utf-8?B?NGUzME82Y3JmMU42L3FiTm9rbTRqSXptcENNbVJGalA1b3ZvNGJLRHc3NGRK?=
 =?utf-8?B?TjlCc2RvQ0s1SVRsbENCTkNBWVR5R01mYXFWcWZBNEtHNVBJeDVWb0Zvd3FL?=
 =?utf-8?B?OUZoejNqNHJ6SWErUFJ4dzJBZklHOUI1bHpkMGZEc0xPTGtha0oreGxHcUJN?=
 =?utf-8?B?NWJPRllKd2gyTUlLTVJzRkI2RXVycFFXRHlrcHlILzk2ZzUrb0FQWjBCQmtq?=
 =?utf-8?B?Qk5GbldiN2VpdktBY2V0OU95VytVUUdQZk9XeUd3TTd5UEdMbStGemxtcTh5?=
 =?utf-8?B?amRiMUFFYzI1TkNaNStrQlNnZUMwTElGVnFBSmd0YStMYnhLeFZnRjNDL1ps?=
 =?utf-8?B?Nm9WUGZxUmVyRjBVRHJsaDMrc1pIdEtkZWRXTkdkY1V2OUFHNnM3ejZudDg0?=
 =?utf-8?B?YWFmUXBYMXQyM0xWNU5yNThPUEN2dnJpaGdMVmJCekptdGlPSDFVWFFBaDB3?=
 =?utf-8?B?NENwbWcxdFZkYkR2d3NKUjlXLzdyc3dxQTBuWTdxb2hYd0R5Q3lraWJsWFhS?=
 =?utf-8?B?Sm9kNUZZcUZMWEw4QWVVemE5WUV2MGtJRURwdkgrNjhmb2lSaVhGVDhCeFNJ?=
 =?utf-8?B?d3lKNHg1WmxGaWV1QlJzZWdWTWlwaXJYLyt5NlpkaDNscE9sQnJtdWNyWXhI?=
 =?utf-8?B?WTEvenJ3NUR3TzhBUjFxclVKaXNuSll5aDgrb3g4RXV1c2VST2I5RGhaOHN4?=
 =?utf-8?B?WWFzMzZzTVUyTm92SVdqcS8wRStlVndpejZ2QmtpaXBVb01iRC83VkRhMkEv?=
 =?utf-8?B?MjhJWE9QSDl3QW1NQUREak1pWHlRYVlFbTgvMjlEd3lHSG84VE8zSW1PRktn?=
 =?utf-8?B?dVVrSG5ubGlSZ1VJSWJNNTFubU5qcW5sUW11VEpkMEZlcnJLYXVtRzRrdlhp?=
 =?utf-8?B?MjBxOWM4R25HSFpEZkpxUlhydnUvd05uT1ZuYm5neTl1d3dBT2E5Q3FIQmZz?=
 =?utf-8?B?Y0VXaXgyOUNleFJtOFFnemNycXhiYWZoZko4MFF5MUpqeGJZNTNMSkFERXVo?=
 =?utf-8?B?Wnh4aWM3dFdwd2h5UGlPamVtdnIyejZTOSs5VVJIdnRnMjc1OFFsajFIVHdw?=
 =?utf-8?B?c1JnSnl1TWFZb0c2alhFTWl4ajFzTUNubmZ6UVR4RTNCMXBFUE43TjhWa1Zo?=
 =?utf-8?B?NzdONGl5S1JZckxqVnJpZGROeFRDNy9QVzlRb0ltK3I2VENlNHFkdWtOQ0tZ?=
 =?utf-8?B?eWxhNGRWbTB4UXFZYTFuc200NW9yUzg3VFVqOUJNZ241b3JBd2U2NHE3dWMw?=
 =?utf-8?B?M20vZHB6SURIZ2N0NFNJcTVaaFFOdCs5OVNqWW1FTFJ4Sm9DeWQ4dHZ4dXAr?=
 =?utf-8?B?alVtc0xBYk12TGpTQnZxd295U1ZTTFpTZSswWklOd0VOMjdVdFV0R2hxRGdm?=
 =?utf-8?B?YzQrSGFZWDl3TnVhYmxmVjJNWk9OVmk1bUlYRG90SmtQRUJPNnQyV05JcWxa?=
 =?utf-8?B?T285OE9CeWRNNTBUQTVTM3ZlTFQ5djFpc1BUazVJWTJUMjk4V081elhFZ285?=
 =?utf-8?B?SVQ2WVR3OXZ0N29KSCtiTFVKWlZRY2RjUE9UWDN0SEdOVW9ZVDFtNjN5UGxz?=
 =?utf-8?B?VWo5TE5jN2FxOE5mN1BKRmhvR2g4Y284VWZLVkcreXJ4VlhReGdFZmJ5UFdQ?=
 =?utf-8?B?YXR2SzczVFpCblJTQTM2SFU5ZjRId0RSMDBoUDN4MzVPU1lqMUJsVmp6b2lp?=
 =?utf-8?B?OFFhcmdsK09HYVVzbW1HYy9hOWRRYkQwQ0VCUW1LcTVCQkI3S3I3NjJYVzNO?=
 =?utf-8?B?Q0g0cFp4ZUgxZk13SEhyZFk5NFc1c1g3Y21yQXlEenhVeWozU1RHaWFITE5q?=
 =?utf-8?B?c2FwOVUrM1VDRGhBem5YYzVZMzlSWGFCMWtYT055Szlaa0VHK09TL2VrRTc3?=
 =?utf-8?B?dExpU3BMQ0lJOGp5VEkzcDVKRnFZYlh1RDFKZHRDN2xIOVk0L2ZjMVRJWnEz?=
 =?utf-8?B?ZGdrWmdoVlFhMkNDSU9nR0hKbW8zakFucThZVm5zNld6R21Na3VRSVhXL0Zv?=
 =?utf-8?B?cS9yeVN6WWhjNVNESXRnMkZKQlRSSURpZ3hDcmVZaFBjdnBCT1dBTk5ZWFkr?=
 =?utf-8?Q?l+WfgBML2uwBnjZA=3D?=
X-Exchange-RoutingPolicyChecked: TgCyL5mZ8M35TXWDIj/DB850sdI299k4BPyUJriSDbvYypFhfFQ8Qq1k5WZdk1Fw1JjEjFhre+upgNIatFerw8ip3k5OoXPGjXnvvW+PWZID5DLjCaoPdB/r5/hYBwxhS4lTrYsvY6Q3oddzWKyThZ9AwwVrhmQ9rA9cByNncFq2orIDDpoCvLiBBjruy6IzYZ870Q8u8MF8LupqvBsuKdGIWZkAEwAmzxcJQq3iWhv+CHBs8sGXIgA4gqqV3bcN+5fP4ZHYSojt5nC0XQi1Jri42roiTWhgDsiapEOaN3I42ZWNrx/sikAjizvPshTVHvFWzkdGEGZDadd7krk+vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ffe76f-ad8b-4975-b761-08dee114c209
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 19:27:20.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPFIM2qG+JEMwVBmiV9+eVHW/JYMnMV4qsxbrJLA3Tdkk3WJDdUdpSYq020+wxEFictN215bjzLh1dJlMYVUcZit4SICTwtOCoiyX1IIhHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8732
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



On 7/13/2026 6:53 PM, Jakub Kolakowski wrote:
> SR-IOV and EUdebug are mutually exclusive features.
> Block EUdebug tests on SR-IOV VF/VM runs since they will
> inevitably skip.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>
> Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel-ci/xe.sriov-vf.blocklist.txt | 8 ++++++--
>  tests/intel-ci/xe.sriov-vm.blocklist.txt | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> index 4a19aa943..7b5bd2165 100644
> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> @@ -9,7 +9,6 @@ igt@xe_module_load@.*
>  # tests applicable for PF only
>  #
>  igt@sriov_basic.*
> -igt@xe_eudebug_sriov.*
>  igt@xe_pmu@.*fn-engine-activity.*
>  igt@xe_sriov.*
>  #
> @@ -60,4 +59,9 @@ igt@xe_query@.*cs-cycles
>  #
>  # Tests that need to be executed in VM instead.
>  #
> -igt@xe_live_ktest.*
> \ No newline at end of file
> +igt@xe_live_ktest.*
> +#
> +# Tests related to EUdebug
> +#
> +igt@xe_eudebug.*
> +igt@xe_exec_sip_eudebug@.*
> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> index 6271b1a70..0a02abaa8 100644
> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> @@ -10,7 +10,6 @@ igt@xe_ccs@suspend-resume
>  # tests applicable for PF only
>  #
>  igt@sriov_basic.*
> -igt@xe_eudebug_sriov.*
>  igt@xe_pmu@.*fn-engine-activity.*
>  igt@xe_sriov.*
>  #
> @@ -57,4 +56,10 @@ igt@xe_pmu@gt-frequency
>  #
>  # The feature query_cs_cycles is not supported on VF
>  #
> -igt@xe_query@.*cs-cycles
> \ No newline at end of file
> +igt@xe_query@.*cs-cycles
> +#
> +# Tests related to EUdebug
> +#
> +igt@xe_eudebug.*

are you sure you need this?
it looks that we don't build this test anymore [1]

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ba8c03812b2593752b1d7ab31c104bec63ca21ec

> +igt@xe_exec_sip_eudebug@.*
> +igt@xe_live_ktest@xe_eudebug

