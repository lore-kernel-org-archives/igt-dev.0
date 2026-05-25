Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C90CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 14:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1438D10E112;
	Mon, 25 May 2026 14:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z19ib2dt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F29310E112
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779718628; x=1811254628;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=NXRlYzHvIhbplAk7YQgG//V07vcZnnWWUbaes4wCy60=;
 b=Z19ib2dtYrDAPjQsVa22xNLPKjrgVICaZGoQL89M+fazKuBcZce+H+4S
 DAINPclrfbnr9MSIa+c2pKAGhlJORKg4/P1gPoD0kCAdmxHXk+RZQQ6lq
 mvfn8+9VQKUjdKuecUFR/m+vFkAKzx1oRZIUJB8mDxZP2pnVZZeIGDvJi
 6a2vQWytQSzkLMi2xf9yC2/3c/5SQetFcIALpGp06hqWwKBrLcNoZ82MP
 cMSgOTCzO3oyPGGLVRZqPiKNUofUe5mnRZMkPfLu1DPCgA10hxpT63QIL
 SSGy8wsDadej/NhkI3zBz7VTbh2ijrIYg9OK3jvHgFK/ED2MsnkEL0pq1 w==;
X-CSE-ConnectionGUID: CwsjIfcnSNyZaEIl3fvf3A==
X-CSE-MsgGUID: gZPzLQR9TgC+MSoEd6yhkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="97967024"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208,217";a="97967024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:17:07 -0700
X-CSE-ConnectionGUID: wlIJutQJQRSRKaCg2KKTKg==
X-CSE-MsgGUID: 0KS2IlRlR/O+secLUpuEAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
 d="scan'208,217";a="240575608"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:17:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:17:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 07:17:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZGVE/+k2sQEq5EWjRn+vcC5DKcisfbZ34BZoLW7LGkP5VIRsvquZ3jw8biI10IS9LOpD3WWRqPUfsH+US2il06Ye+LSMiSUa4v5E2JRMG8/S/VLFowiSDo45igrY0nqCRdYUB23lJuVQfeMnrgbOnE1cI8Jg/2bSXh1GIZWubW/f/PP/G7SQWhF+9g6t3uU+DC/n/Fx42X04vCBN5KxWs2bVnZLsIcfHGD/L8I0AmX+BHUi/0r/ftt0GyaRb0HMgYdYo11M7vftNzRLDIciWsQFpEAoWwntFo1QMI2cJ47KROImqWM6AyYxsbgsl6A65PGBBY6vwRzh+VxZFa1WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO5C04jT6Y8R3yoGQDx7iV1Eccnc1h4eQ2fHwe+p4Uk=;
 b=WRQ/4DnIAH7s4QoAv8ic6fIiJwKNzLJno85g1KWiFceuHBHkBE2g0Ifk4VK7c1g8gx81O6Xscbi1T8yufllws1wEQ2oUtcLr0+3adCOy/Yc+Dgg/pqFeytY30j8xvzEDzniL+yWXSJiinaXNhV1ODlOVt2wqBOckWmp7ADu8+XLsKowZlDColgVNMzJNAh7O4NRq8ALENgfG9aR51RFFrGiqQZ2ZU4Ue3u5Yg+qTTOIZe59DpI1R4y9/iiZuIuDl5Va8Zhavxu94IVqZ/6KwJ4SPppbQ84i7izOupjEyLokP5QFVNWJ5oe79dt0r9r//BnDRqXrhqiAzMa6Gb75EhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by DS0PR11MB8668.namprd11.prod.outlook.com (2603:10b6:8:1b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 14:17:04 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 14:17:04 +0000
Content-Type: multipart/alternative;
 boundary="------------5uK069UclApKCyFLAoPlSLnn"
Message-ID: <a6c31239-2933-43d9-81a4-de1cc738adb1@intel.com>
Date: Mon, 25 May 2026 16:16:59 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l-ci=3A_Update_VF_and_VM_blocklists?=
To: <igt-dev@lists.freedesktop.org>
References: <20260514165723.10559-1-jakub1.kolakowski@intel.com>
 <177877864070.72814.16705880750594964604@5ab824fced77>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <177877864070.72814.16705880750594964604@5ab824fced77>
X-ClientProxiedBy: VI1P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::20) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|DS0PR11MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 1348f700-9d39-4330-b996-08deba684b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|13003099007|11063799006|5023799004|4143699003|22082099003|18002099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: GQ7Fp4hQapocMJi2wreXrWHsFRaCO0UstP73TgPOmf2nwkkxSpGSo+waUdRM8RF2yx6Hw7m/Kd5m303kF1sdMtW4goNSteZ9qqv/HImt4fZSoS05a8vZR0J5BAb2yHULZpKJzwLdiTQ5JW9obPViZWdEaQ4B3HgkgCelA1QftZit8XxgXGnySjh5fx8Pfo698i3yVPUJV5/Offnbr+e/Tph1uLuJpJgz46txxIn8OxE71NGVT+58hvUeC4DZKcUkGqc2AIfIQhbJH1ut4KBjAehyAyzaZB1LuKZIJeysg63VJ5Oq08CvG63AUsH3fFe9P10SlP2iMTGXMETvJt/G8nxOfnqxxsYQ6SQvfcl3i2Cyqyic9SFmBjeVm/LKuXohFqEaIR7DFbq22vWqL+x2RoSR03vPUsh0jexFufMwrXi+39CrE8q8FBZU1k3AiRWBfBIeTLl74Pw3m5XZ7pefkwxvVRUSdY8aDLVlIuiR8ibh3oIrFszpcdQAS2zwzPwm+7bEBKIZWY4vZxhRRvHt/1et1K6cKTDWd2lHoVJa8mfkZ5fE4Z2l6wdM3cGqEkxkJxnOfW5uPNk/Zr/E7PRjDgdHzZEVHUwbChxJjh+SgOJXLVbzWjR+8qvusE8PzuX6Z7OZGKHIDSSQwL/a0863qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(13003099007)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXQ3c1kzd2k3QU5PQjliTjJCSDVOLzFIKzNIVUhJLzVsRGorYVVJODk2ZmNo?=
 =?utf-8?B?TE1qUG9WUGEvdHFpZ3J3UWtwL3VGT0syRWNKdi83Y2RkWHg2SWxEMG8zVkdy?=
 =?utf-8?B?dkVDKzNabWNIS3AyTjVQdW9JeVZnenArNWdXcDB3bU54OXZ6bFowNzYwRVMv?=
 =?utf-8?B?N0NxeHErRDdlTksyczRYcUM3ejhCdmlxYVFod1VuVXArRCtNNGsvS0JtYmdV?=
 =?utf-8?B?SndHV2NPWlo1TS9EdkdIWlJ6ZG5ZNS9WZ0FXMytvU0VTN2t2Qzd1WnpRb3Ru?=
 =?utf-8?B?S05oenZ2TEdyOW9DTENiQUFlL0JFQU1obEw0Vi9LK2RxemV4MVkvQlZDMDVz?=
 =?utf-8?B?b29EMGY2QVVhaElBYU5IcWpIYSt1eFhUKzhHZnpabTBzVVZqSW90Yjh5Vnhw?=
 =?utf-8?B?b21YUDI3Smp4ZCtZSHZIUWtJYktTbXUycVBRdUVVR2NIRHVEVXBDYVZNZGY2?=
 =?utf-8?B?VFFYaW1GR0YzdG83STZiY3prWGM3QkFIL3hmMUJEdjJTd2NScnhxNGp3VlNE?=
 =?utf-8?B?L1MwdlU2WmVVdC9QV0w0Vi9aNGIwOGsrVUtPRE9raFZ5YmhMWEhOT0JpVkdE?=
 =?utf-8?B?TXNKMkxmY2w1aDBWUDNhaFM3VzZ6b3RLOVBzdDZQTm5jbjJUenZySU8veGJN?=
 =?utf-8?B?M0V1dWcyeVV5c3k5TG45WUxrSEpaaGJHZS8xU0JQTzAzMjd2d2drQ1J5ajds?=
 =?utf-8?B?aVJxUzVpa3V6TkJtQ3UrSCtvdG81azBmdTJrOFdybC82QzVkak1XUjlNelVm?=
 =?utf-8?B?MjkrTnJsdWtxQXZ4VlBMZko0NXNFZFhBeEsvNDBiS05EWERvMEl2SE8yc0Zx?=
 =?utf-8?B?Q0Y3dkFtR3BUeitHTW5qVkRkV0haZkZIbE10M1ZmbVBJVUthUHo5elN0OFd6?=
 =?utf-8?B?dEtqMmlhQ0hkdzgrcmhhZytuOHMzaDJLK25ZZGFyaGI2M1pKRWV5Y1UzMEo3?=
 =?utf-8?B?M0xDN2JKM1FLYW5oZ0N1bXRPZXpqeDlMUzAyZExmWmNwdWdMTmtkcC9wNVh4?=
 =?utf-8?B?OUk3RUZmeXNoMy9WNExCRWViNWhib1p6cXFZcmtSVGw5STUwdGwyS1lQVER5?=
 =?utf-8?B?RU16alJ3eWV2dC9ZSXBvK0pDVXE1aFhIcGFvRmRxaktaVEZKRENIc1BkaXBp?=
 =?utf-8?B?ekZPZGNkcHZkRGNEWG9jSUp1WXgvNlVQcjVSeHFyMGNTYndqMzUyYnZ1Tmtk?=
 =?utf-8?B?bzJzSC9tRUJiTnlsN0FnMTdoZkNKVFFocWtnUmVTQWlqOE1weFhDQnRxa1ZT?=
 =?utf-8?B?blJYeW9ZS0ZMNWVROUhrQVhzNTlpemdMWVV3UWFqNmZhem5MZEJ1WjJHcWJ1?=
 =?utf-8?B?TFBqR1pRUTdiajdlN1J4TFZsamlPVHZBd1l3c0hVemFoU1pKT1puT3hZeDVu?=
 =?utf-8?B?am82TXduWjhmNTFEZ2l5YjduMnB0NWtSL0pFMlB0S3ZIeEdrNFd3NlB4ZnFm?=
 =?utf-8?B?R2hiT014dldPUldVZkdzNDk2K0ZMRmNvbGRRZlI1UmwyeDNoOUNQb0ozVjdo?=
 =?utf-8?B?dG81Q3NSR3dzb29OTW9Vc0Q3RFBHZUVwVXZNUFFYaC9kQlIyR2VuaVNDbVdw?=
 =?utf-8?B?bkpTRW9CSzJPVTlwR05YalA0aFloZXpUdEYzSTlWL3VtaXVHemtVQTdOelYr?=
 =?utf-8?B?NmUvZ09YaTJXem92NmZGelNYUW9EbTl4MWlDeDdYTjUzazNtazRNVTZTUTY4?=
 =?utf-8?B?OG53U0R0Q0YwMkF5a2lOdmdOTHJMN1JwRUh2WFEyUmxoWjFLQUpUV2FZNDVN?=
 =?utf-8?B?SEtwMWVHcTJIS2g4VXJXbVZIZVJPS3F0QVdNSWNoR08yajExOXBybGhLSXQ2?=
 =?utf-8?B?SGZ1YXBOV2orOFdiS255MzQ0ZVpUMlRQcUtta3J0eFJzbURJREdZQUg1UE5y?=
 =?utf-8?B?S2lmZDNUblh3bmVsNXF4TXIvMG1wcjBBOEY0ZzFnS1dYVlJOMXhwMDBreFhC?=
 =?utf-8?B?OUdlaHA4eVVlRzhYOU52WUZRM0VlRGFad0NCeU56cDgrRkJSNG5vRmdBZlIz?=
 =?utf-8?B?LzJzb2xBeU1LbU5BVzhoZ2FkdE1xellKV09IdEZWaE1NQnJhTEZUV3JCbEI5?=
 =?utf-8?B?UUIzVWdLekZIeDdrbXdhOTlXd1hTRnl1UmxuRzUrS3RCRDNLcEJJNm0rcm1j?=
 =?utf-8?B?cmQvcmtCdlRqOENiSmkxYmJVTE16eXNWWS9ESDBqcVVSOVdYQnY4RWVKaCti?=
 =?utf-8?B?bTI2NjcrRi9zT1V5WEpCdnRQVHYyNksyWXlsMHhwWXhxMCtjRHJJNVl4d29y?=
 =?utf-8?B?NER0UW56L0VaSzRqc3djZi8ydW1RQldkWWI0L0hHNzNPNWdYdnJxSlNaczdG?=
 =?utf-8?B?TlNFNVJpcFF0VTBxTkFwbjJ4eVhiRmE2cTh1bk9YZDExRWpqQjkwb0J3TW1Q?=
 =?utf-8?Q?BUiqOApHkzkLwXLc=3D?=
X-Exchange-RoutingPolicyChecked: GgNKV7RDC80eu8/dlMd4SbK2TED7n7mOTt4Pj+lGsLI90QMMkoxVlwgcCeSIyu3iHK0tmu0xxxz345HGqSJ1OSnYvJLb9ZgK8ZrrC1sblZ/8qgm7P8GrsMapKHf/5jPltiuzypfI/a2RrLyaoNsNKma1k0c/M92phXcbI1TmqGW2BRBX4e2PmNly4IPwKx+s12NnVUistednn0I4CyHAfAbENnvOowarAkqiSXK84Khxegx54CBRJpE7I/fD91DjPD4lMzXxuDRAK1IMLsw+K/FfCtyikpT0OOGM8899hR4eu2fv1eU5s8RvpckVsgPNnro4QGNpJ+pLHr7v7eo+3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1348f700-9d39-4330-b996-08deba684b64
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 14:17:04.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2CMx3lJRIRcvZh9CxaNGS92GzxrLclZAAK93j8kVOQ6KsxSIIh9pCzAtu4gY26ZpT/0lnG+tviSSs3FFfnmUvvYxrb7/gV998Shw6/RfN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8668
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

--------------5uK069UclApKCyFLAoPlSLnn
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 5/14/2026 7:10 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel-ci: Update VF and VM blocklists
> *URL:* 	https://patchwork.freedesktop.org/series/166584/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/index.html
>
>
>   CI Bug Log - changes from IGT_8912 -> IGTPW_15185
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15185 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15185, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/index.html
>
>
>     Participating hosts (42 -> 39)
>
> Missing (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_15185:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@gt_timelines:
>       o bat-arls-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arls-6/igt@i915_selftest@live@gt_timelines.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-arls-6/igt@i915_selftest@live@gt_timelines.html>
>         +1 other test abort
>
unrelated to this patch

>  *
>
>
>     New tests
>
> New tests have been introduced between IGT_8912 and IGTPW_15185:
>
>
>       New IGT tests (1)
>
>   * igt@i915_selftest@basic-await:
>       o Statuses :
>       o Exec time: [None] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_15185 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>   * igt@i915_selftest@live@workarounds:
>       o bat-arlh-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arlh-2/igt@i915_selftest@live@workarounds.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-arlh-2/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>
>
>         Possible fixes
>
>   * igt@i915_selftest@live@workarounds:
>       o bat-arls-5: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arls-5/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-arls-5/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>       o bat-mtlp-9: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8912 -> IGTPW_15185
>
> CI-20190529: 20190529
> CI_DRM_18489: 121c16f9d8c56ea07263df84ab971cc10870fe88 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15185: 7a072a8ba404bc6f06457d2ff1fee4ecf0b71124 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------5uK069UclApKCyFLAoPlSLnn
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/14/2026 7:10 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177877864070.72814.16705880750594964604@5ab824fced77">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel-ci: Update VF and VM blocklists</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/166584/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/166584/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8912 -&gt; IGTPW_15185</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_15185 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_15185, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/index.html</a></p>
      <h2>Participating hosts (42 -&gt; 39)</h2>
      <p>Missing (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_15185:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@gt_timelines:
          <ul>
            <li>bat-arls-6: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arls-6/igt@i915_selftest@live@gt_timelines.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-arls-6/igt@i915_selftest@live@gt_timelines.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>unrelated to this patch</p>
    <blockquote type="cite" cite="mid:177877864070.72814.16705880750594964604@5ab824fced77">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between IGT_8912 and
        IGTPW_15185:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@i915_selftest@basic-await:
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_15185 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>igt@i915_selftest@live@workarounds:
          <ul>
            <li>bat-arlh-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arlh-2/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-arlh-2/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@i915_selftest@live@workarounds:
          <ul>
            <li>bat-arls-5: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-arls-5/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-arls-5/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>bat-mtlp-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8912/bat-mtlp-9/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15185/bat-mtlp-9/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8912 -&gt; IGTPW_15185</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_18489: 121c16f9d8c56ea07263df84ab971cc10870fe88 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_15185: 7a072a8ba404bc6f06457d2ff1fee4ecf0b71124 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------5uK069UclApKCyFLAoPlSLnn--
