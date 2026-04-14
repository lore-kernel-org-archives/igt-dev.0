Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA42F9D0F6
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 20:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F4C10E126;
	Tue, 14 Apr 2026 20:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h35Z4RLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D4010E126
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776198801; x=1807734801;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=Im7l2E2/HxfFyC2OtnOC8YbT9Hz88BBOfnjV48E/FDE=;
 b=h35Z4RLXoF+Mc10beG46/JzboWi87pbSnuEIvQ+aY5J744J8NuzP9HE8
 OpihsFmprSgPYm30S5Am9GDaTt5hWOozRzjrbCja/+hZzAgG4QeM5tpvG
 P30oWffYwXWn1bZsVhxbGzL7onEmC+AN83sM2rF25xyS8Jxw0EagfQiZb
 wQ19DLG3fPdDqkMDukTxzw6Cy55aMpft8D6dg1QiyVLLAgHHYGU79j3YF
 9bvQp/GBKGsy25YMgsT9QSk64m5/UdFTgd6JVE/qsvOfVTsauVADPMF1s
 MogX0uogS1CIgS3Ajcmr14yW41kOzcEuYRlQJMxLpPPqWHHbf9czGO3bJ g==;
X-CSE-ConnectionGUID: iwfRQQO4SWGWsPoWN/ORNA==
X-CSE-MsgGUID: YPNpVMOgQ5OmKEvdUBc/uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77044162"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77044162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 13:33:18 -0700
X-CSE-ConnectionGUID: WKy8MKSXSsCTaMTjprY2og==
X-CSE-MsgGUID: Cc/OBYBTQCaA75KTmB86eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229167018"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 13:33:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 13:33:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 13:33:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 13:33:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkjxyO/9UAgWU+SjZSiK4zmjRlht+RodV7VITYcu5T3C9NRG7kw1/147LNg1NpBc0dlyp8psextR8zg/SOWAFiz+OIdS5eAnlk7apob1OEurvL5UZqVhgH9NkeV+5urhTMW59YoEOHApOxsf69IuEm7miivzOrYlLRgbkYYFwAPUsg5G8BFkYN8T7rr93ocxX0rgFBV7Dw8kJlVleg2W9QcpQIuIcgVGYwY5/MainjgxJ+7M5stF/g875XAAj0sjBeS7Yo9Zf8Y49MuGjfvQYyrE6Rjy2bXEv/sHCzO84/csSomfEhwXWmKeA8+edAWP9gcNEGxkbACRwf4kzeCi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byYhZjh6NB1qGJAQ0070OcUa4GZ4EhxpvXWKxNc/cks=;
 b=HgT2i8vZpHeNgX729Foo4qjW7XMKA7aFWhHR5L+7R1UAldkV7yapAdqTvhi1Os9SauNIgLChby6nItiDmXCbB4/aQGp/Lm46nvBBvx9XbGHOpx8g4J93GstjwyZl8thbCfvjX1/5loN4ZfZVNXiAIZdqRrgHO/kn0hVKkRTVZX8E5l+we2WrGKXM4hu3LfWUXmm4u7t13Iy9nFIRai4NXHX/oAoEGzki9cCWpAjXkwCIqXbyvMibr5gBzWmGhnRAFmY3VbcAIUP7S4PUSf/yty22z2z4awevIH5z3/HuwhrSVoHeM2rCztIy7pLqQ/CUCQVHR1m3/4Grp7b4ivHcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB8990.namprd11.prod.outlook.com (2603:10b6:208:56b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Tue, 14 Apr
 2026 20:33:12 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 20:33:12 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script
 and allowlist
In-Reply-To: <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
Date: Tue, 14 Apr 2026 17:33:08 -0300
Message-ID: <87h5pdwad7.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddd855e-e438-4981-6c6e-08de9a650c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: PVCcWpwNKXkYYFf1qEhCirL+JF5LOLsJAPDGZCVQI8IC5rCcfaXySMvixMhmjGEdCs0oro1EXBX2cAfptToINz89G35zx0tTukHDRW8fyzeX/v2d/KJLA03zgjPSUwECP8OyfUFxTbYont0vkzZ64yBdIdJyruj34nBkT5O6M0HzxiHEqftG6BWMYSSG2/l+Ob4onnDetrQb+VGImvj6wtdLpgNz3fot2PGjioevA0fIC8f9jOUzV3I3LqX8xVRtLcndBq7bZzSqbYd1xOYwx4UbxwAzcw75pYbEEmRhkS18PnNZsOssAIRq1KBYP5uQaYy1aWOMtzZTIr2zyjZfoYxQYkfv4m/DdIuFkLiQOZ7xK4nF5h6cJeYyhVAYGw5flpmhF7d/npjn7/QgZpbmjkr+GmiWWQr15Gx7iSbXj8j9zsv9gIGMKsNoORgK1EyDKhcX+RIDU82HOufUfawtmgT5/Fuvt5sSNzThNJrMED4ZYiLN5gen89F/FfHbAzULo1n6VDK0uB0KkZYqJV4TCV06hRPy4+zgbFRUETKIbuqtBV9IKbbnF9V6X6ZryD+1uw1L1b0CDS4t6AfYSkrLSBvQdFMlYD8iijBN4G8+b5YpLugHUNNDod+bcygG9MWm+rwD3PuhO51Cxqi7n2XxjeIcw/whx18pPYCOMp13k7MnnzW10V9aZmuDZ5n8tA9dCxzVtqBd4PUY3zLRNSKmhWlwcfyKjDGunmMzpzMKl7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVA5RDJCcFhlR3Zya1UwWmROMnJWOEhIWmloWmw2VzJaRnZVK04yTloxaU5L?=
 =?utf-8?B?eFdQbHBwUWRKcHd3OEg0UitlZGZEeUJJN1dkZVBSUDlsRzNLb28rWFcyUWNK?=
 =?utf-8?B?L1c1SDlaSlNGYzB3emtGZFNwcGdnclJXY3ZLOTh0K3pVYzJhMTFHOWwwZXJp?=
 =?utf-8?B?UTIxM010NmhEa1c4T0xLdGxaaWZMakJKSVRrcWdtWHJIK3FUeHc2ZjRBcTQ5?=
 =?utf-8?B?dGZGd1dVVFdWUWxIcWpqSkMyRk4rcUl2emxJbUlXYTIzaEQ4WGtwb083M08y?=
 =?utf-8?B?TDUwK3Y0TE9pL05xN3lDenpVTGxwOHd1Z2xZSjZvZVBCZnpwaHRYd1kwVlBj?=
 =?utf-8?B?NXh0Ym5uV1hyWFVyRDdIVDJXNUFyYVpmVGQyTEVqYW9nWjBMMzhneEdnTWRk?=
 =?utf-8?B?TFl2VlU4bTBGUTFvc25wcVZLN1YvRFQ0c0ZLSVE4OVB5aktzSnYwNFZMdlF5?=
 =?utf-8?B?WCtjWjFrcVFKZ1lKNHJaZG1GalBwWWhWTWN4SWpybFdQamhWNnU1YTlLL1dB?=
 =?utf-8?B?bHAzVnIxaWtvMC9jdlhya21JQjc2U0hNQ0kzT3Bydk53NW5XUGdrZUhGZ2tO?=
 =?utf-8?B?bWtnSTB4cU5hRms4Q053TlN6UkoyMyt4RHJpUFJIeDdFYlVRU2tMb2FTeldB?=
 =?utf-8?B?dEpDaVRPL29QalRENldsbHlWSTB1WHBlRE9lYWRFMVJVaG1MZTdpTmJ6dyt1?=
 =?utf-8?B?UlhJWUkwa2tDZ2w3alRMTUYxUmdWMytEMHd4ZWE3QiswYVFnL1dOektpNVdr?=
 =?utf-8?B?Y2FXRHJLRFRucG10YWhNNGVOL2N6Y2U0U3lLSVpWSEhMMkIxdWdOZUVidldM?=
 =?utf-8?B?djBscUFsekNZeUsxK25TQWlsZndqd1VkeVFzNzRCNWxXSWNOTC9hdW5GVzVv?=
 =?utf-8?B?ME8wNHErYWF4YnhlenZIaTNuRTluR1ZUWnE2b0lhVFUrb1BVek8zZ0EwS0Qr?=
 =?utf-8?B?WnN0ZnBjWjloVXBVMWRleWF1b3FxUzdVVURERkg5R2lOUGlFT2NqbjQ4ZUk0?=
 =?utf-8?B?cWk5ZGRKaWNlUEJhWFhTR3dsU3hxNHlWUS9mTU5NWkxRSUx1Si9kWkcvK3Uv?=
 =?utf-8?B?M1JoNEJMU0FqaWNZNEtyWHhmSXpBMWY2VVdLL3FjYTQxcENreWpKSnZmbWJC?=
 =?utf-8?B?eUxnQXo5MU9mY1pyM3RGT01ZUW9HVDRCZXhBVjdNK3Q3T2hvNUpIczAxNXZJ?=
 =?utf-8?B?TEFHaFZLWElnakZyb3FYUGcvbVQ0cTlJYXpaamNBUEFuczlpQnZRcFYzWFBz?=
 =?utf-8?B?dXJzYnhuWG5jclZzVC9VWTc5bzVpaFcwL2FYc3d6dThjNUlnT3d6SnlSNXhk?=
 =?utf-8?B?U05OdU9rbTlEVFhMUGlSOG5JbW5IV0c4SnAyZFFkdnJvaHZsYWhnU1BSTFdw?=
 =?utf-8?B?SFN5N0dSeXN1VFlRSDFOYXBsZWhjWjV6TVVTM0hQVEl3Q3pvdVJ2Q2hYN2Fz?=
 =?utf-8?B?NStGL1ZDcDFXNlloL3BWZ0FqWDZkTTEwS2lCc2pET0RTV2VrWWFHYlpnS1hB?=
 =?utf-8?B?UFNzWUR0K2JjQm1wcXF1WTlMSTVNTWNLSDhTc09GWHM2RVgxTCtqaE11TDVI?=
 =?utf-8?B?Q1M2Uk9GczNGdlE4eXBSb0Y1NkwwM0hnY1VRd2R6L3JnSVlhcFVRcVkybGVT?=
 =?utf-8?B?Z1BtRHlENUV2UWtUUUZVZitqZVQyUWprKzB0eFlRVXg3UUhaQlBqRmltbjFx?=
 =?utf-8?B?TmFmVS9BWFdacW1CNnpuaGR4VnRINzNpRW9Tb1lRNUovaDdqdk9PaTdhNHRj?=
 =?utf-8?B?SjRHbEFWTlp6djVCMnJTTkxiYWcwZEhBaERpdWJueDAvUjN3MS9aRC91ME00?=
 =?utf-8?B?ZnRNTmxFanZvTXMvenNKdVpVQkh6N1NzQkFHcTgzemJjNHVvYXJjUTlmd3lE?=
 =?utf-8?B?QXNCWlFxcjRqN1FrZzBHQWlDbUF1eFJrNFpwVWlVUU9CeFd2RnQ3NWpxUGlY?=
 =?utf-8?B?MEExNm43N0NGYUNnNlBEVXhSM0duQ21OMlJTZVlWTVlEZElISzNZMHBCWnNs?=
 =?utf-8?B?WlRUSXpSMzE1ZVZSTnE0bTJiR3hObUlZUXRkUENFN2twNGZCckZIMGcrUTlj?=
 =?utf-8?B?RGdNRlRtNFJPcy9sZDIxOEl3UThidXdkc3JCU0VEYlZHcmRDSUI2bUpOcTIr?=
 =?utf-8?B?U3lvNTBYOVdMNUNSQllqc1VjZWxwUXU1MWFLM3B5QVNCcU04RWViWVdVb3Bj?=
 =?utf-8?B?UGRZb0F1R29PKzkrdFJMUjNaajBaQkxEWmN1dUozbElVRHU4QnpJdVpmYlJP?=
 =?utf-8?B?NUY2Z0kzNjkrNlVVN1RaY013alBrZ1BXaUpmQkxYNjdYSjNTcDZyY3k2SWFj?=
 =?utf-8?B?ai9UWS9jUzQ4Ly82TkV3WC84dkpsWWlJK0FsN3l1eEc2eWdnUzZsQT09?=
X-Exchange-RoutingPolicyChecked: bCy1iVObNUd2qRcswpcyAVgvEagzfrmEIhqWOdioM8YCKB9fK2Zm2SOU7zgXJcYM3xxCu6yhFXUp7Wo+XRsekm5ckZGMh5S9WP8Sn9WS9oQWmjQ2WQGdhVjqom3BF1nD3kY13qRQFDuGMRFYoO6ZmqFMfUE35LRt64hmgZIqnWjYKILyT9vszg9UHf0D27oNOxVgVc1wSFe5xvIJOnCwmRpbHJ6JqtrtGdPc3X1Y+kQrmqyj49Mh25pGagh+ZsQtzaPf89Hg1KhcsvIl5dKTW1rBZre1rAGS4PT2pyJAbcrEtlls3DWqNM5YpnWaSeUbfF1s0fOTACdAE9htz2VAtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddd855e-e438-4981-6c6e-08de9a650c87
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 20:33:12.6857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amahfRGyIcFXXqlPb0L/5xj+ZbEeaMr6E9OyPKDZ1ZAuJbqM+P/aUmo4a0KtUGjN5Y0HTsCenHRtHGXOpboo+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
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

> We need to explicitly extract guc logs for failed tests so add hook
> script which does it after subtest/dynsubtest execution. As copying to
> attachments takes a lot of time do it only for failing subtests.
>
> Adding this hook script to CI will extend execution time much and
> using allowlist is necessary. Instead of allowlist argument in the
> runner (previous attempt) now script filters such list on its own and
> decides when to move forward and do some post-test actions. Such
> approach is more flexible but moves decision to script what causes
> it is more prone buggy.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: install hook to datadir/hooks
> v3: migrate allowlist from runner to script
> ---
>  scripts/hooks/guc_copy.allowlist  |  2 ++
>  scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++++++++++++++++
>  scripts/meson.build               |  3 ++
>  3 files changed, 52 insertions(+)
>  create mode 100644 scripts/hooks/guc_copy.allowlist
>  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
>
> diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_copy.al=
lowlist
> new file mode 100644
> index 0000000000..04cb3f8298
> --- /dev/null
> +++ b/scripts/hooks/guc_copy.allowlist

Do we want really want the allowlist to be part distributed with IGT? I
think we should default it to no allowlist and then CI (or whoever is
using the hook) defines it if that's desired.

> @@ -0,0 +1,2 @@
> +igt@xe_compute@compute-square
> +igt@xe_exec_basic@once-basic@ccs0
> diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_copy_o=
n_fail.sh
> new file mode 100755
> index 0000000000..595cf5205e
> --- /dev/null
> +++ b/scripts/hooks/guc_copy_on_fail.sh

Maybe guc_log_on_fail.sh? I think it is more descriptive than
guc_copy_*, since the latter is a bit vague about what is being copied.

> @@ -0,0 +1,47 @@
> +#!/bin/bash
> +
> +# Hook script for copying guc.log.
> +# Suggested usage with:
> +# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook 'post-d=
yn-subtest:scripts/hooks/guc_copy_on_fail.sh'
> +
> +# Copy only for failed subtests as this is time-consuming
> +if [ "${IGT_HOOK_RESULT}" !=3D "FAIL" ]; then
> +	exit 0
> +fi
> +
> +# Process and copy guc logs only for those specified in allowlist
> +ALLOWLIST=3D"guc_copy.allowlist"
> +scriptdir=3D$(dirname $(realpath $0))

It is safer to use "$0" above.

> +
> +if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
> +	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
> +	exit 0
> +fi

Well, we could allow the hook user to define the output and default it
to "$IGT_RUNNER_ATTACHMENTS_DIR/guc_log" if not passed and
$IGT_RUNNER_ATTACHMENTS_DIR is defined.  Otherwise, we should error out
IMO (i.e. exit 1).

As an example, someone could be calling a single test binary directly
and want to use this hook.

We could do some simple argument parsing here or, to make it simpler,
establish that IGT_HOOKS_GUC_LOG_DEST would be such an input variable
(and document it in the doc comment at the start of the script).

> +
> +cd "$IGT_RUNNER_ATTACHMENTS_DIR"
> +
> +# Look for allowlist in following places:
> +# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
> +# 2. Try in <scriptdir>
> +
> +if [ ! -z "$IGT_HOOK_ALLOWLIST_DIR" ]; then
> +	ALLOWLIST_PATH=3D"${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
> +else
> +	ALLOWLIST_PATH=3D"${scriptdir}/${ALLOWLIST}"
> +fi

I would just receive the allowlist path from CLI args or, to make it
simpler, from an environment like IGT_HOOKS_GUC_LOG_ALLOWLIST; and I
think we should default to not using any allowlist if none was passed.

> +
> +if [ ! -e "${ALLOWLIST_PATH}" ]; then
> +	exit 0
> +fi
> +
> +STNAME=3D"${IGT_HOOK_TEST_FULLNAME}"
> +echo "${STNAME}" | grep -q -f "${ALLOWLIST_PATH}"
> +if [ $? -ne 0 ]; then
> +	exit 0
> +fi

This can simplified with:

     if ! echo "$IGT_HOOK_TEST_FULLNAME" | grep -q -f "$ALLOWLIST_PATH"; th=
en
        exit 0;
     fi

> +
> +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do

Suggestion: use $(cd /sys/kernel/debug/dri && find -name guc_log)...

> +	attout=3D$(echo ${log:23} | sed -e 's/\//_/g')

...and then here we don't need this line...

> +	mkdir -p "${STNAME}"
> +	cp "$log" "${STNAME}/${attout}"

...and here we can simply do: cp "$log" "$STNAME/${log////_}".

One issue with the find command above is that we could potentially
collect GuC log for other device (not the one under test).  I know that
IGT supports selecting a device via the environment variable
IGT_DEVICE.  I wonder if we should make it set an environment for the
device under test; we could use a different variable name to avoid
issues with the existing one.

--
Gustavo Sousa

> +done
> diff --git a/scripts/meson.build b/scripts/meson.build
> index 6e64065c5e..2ce961898d 100644
> --- a/scripts/meson.build
> +++ b/scripts/meson.build
> @@ -15,3 +15,6 @@ endif
>  igt_doc_script =3D find_program('igt_doc.py', required : build_testplan)
>  gen_rst_index =3D find_program('gen_rst_index', required : build_sphinx)
>  generate_iga64_codes =3D find_program('generate_iga64_codes')
> +
> +install_data('hooks/guc_copy_on_fail.sh', install_dir : datadir / 'hooks=
')
> +install_data('hooks/guc_copy.allowlist', install_dir : datadir / 'hooks'=
)
> --=20
> 2.43.0
