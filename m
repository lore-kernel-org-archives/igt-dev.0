Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6184C79FB7
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 06:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F4D10EB24;
	Thu, 10 Sep 2026 06:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ld60U287";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF6A10EB24
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789021075; x=1820557075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qKQ8DroV7FlDfaz8ByQjGL4JL1JPCxNeyu7239HPTuM=;
 b=ld60U287YBecGwU0N9WMBSZU0eGr9Sl8Zot0n+3fvfVlHiZzLjPq5lYf
 jVa4Th4DeeQnwoepu7+rHccDGjIJMV08co5iwIzxGwC+/HEYZB2usKM/h
 40TmuNwXnn13rhbc39q2Oe978FImdyejj3HbBqvfmPnLQrXCznoONsmjn
 zU4lUr3EH1pc9txS1aNkvHIPEq3l/wW1tM2bti/8JA6qhlRV3s4TgM2rW
 nMQZts+2BmQLeWzxivl2zprbpbTcuN6pZEH25Q4mpkoUWmMY6fEfdhn+P
 1yw6DGeJ/gnnBk9R1YPcED6XVRJyipAoaJ75aafzuLUiZMs9g3gJR5C5N Q==;
X-CSE-ConnectionGUID: jcB5FhUJSLC5FQMa3fPtnw==
X-CSE-MsgGUID: ORQqPmnsSZiz8SmtEXTidg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93287229"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="93287229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:17:54 -0700
X-CSE-ConnectionGUID: mTCxjBYISaqVoH6+VBPzkA==
X-CSE-MsgGUID: txkUO6hWQ1aJroOikrK3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="267849390"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:17:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:17:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 23:17:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2OCp2+62/EvnfY/M3I9tHN7REBNNlOr+WRdQd5wn5Mk4hfm5OnFJ05axVKJYu73DIvyNnM8xD8a02HcEfDHQwSlMIctpgwL38hovz3qcB7bA8JZtQHdjqGQMyl9hRt3F8vQcftodfjxHSMRj/Zbn7dFj+sGfnFp7O+YVt2cGgF8dfxlFUvLdca9IKkqjS2l2/EA+aUoeDDynC8AJyym2Xlo3DUU9DxU/N1M3Dln8hJj7QkXUQRg2SpkxOwSlIGc5g/in45BD9c8cmiZ0tjtfaI/7K3KWg+7MlvxhIzkXJUhcsL7QuEVncTL4N1y7V/zoyL3RYWfhORFPHzQaqeNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxNJlpWyIROMVjFlW7eFyhbQr/+aN5sYZboEvO63pIA=;
 b=lSy8Q91OkNnVMoKXGGaRzWaDy2YUyx7j9ef8lDI1QbeiptPoAOJeEuYig82m+WQ6L1CcKmLrcJ3XVD8Nr8il7+Zp0cMTg3oDBtIFfWS4YSyqbu/Pzv4ikIhmxRbvtPiwoIbEH9OclBtDZDs8Koi6JIhKnn+xqLuMaLq9MAcwsYV5bRsmMw0pzSPR7eXJDbV7LwYef9j4g7Wg7nTKWc4dWZgKkstjB/h07OeegI510CXTCXHTJAMpMaOKjDan/BadNWMUOiRY3HKmzuQsHfdAK1m2GXE8zq0AS5xSAL0aM1FL60Sit2GWaOywEXfW3kcxEWYrPY68N9vmVNuUE1y0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA6PR11MB187491.namprd11.prod.outlook.com (2603:10b6:208:5e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 06:17:51 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 06:17:51 +0000
Message-ID: <4e07ff06-6b3f-4d41-ae82-1a1458ceca1a@intel.com>
Date: Thu, 10 Sep 2026 11:47:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-4-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-4-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA6PR11MB187491:EE_
X-MS-Office365-Filtering-Correlation-Id: 943bfdcb-f938-40c4-1591-08df0f033e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: n2cu3CDjP25ugZ61Vot12RfRBYa+uEOkrj/L3ggsrIdOCgncqQMjtjpDJutPkY4zyfYrRKmCMvVzIy7OY4olQmYtFQBnuw4zX7QP2QE4+xXn+U7vAld0KM7w9vSWstdR69uxQePWswrYyvbLn9/SjJNxgX5m658HHNei2sL5WzEiMkE7iVbnTpbDrOx+l3sEDwX9ggd+IGe0iUc5uVRPM5YrfbFB7tOnm36tpdHWBhR4++Jew+xl7t+AtZh2Y+pGmAvXRyBi66mh3Rd9M4cQQk4h//U81IuR7RjBEltwH3bDhcABJau+XSyiugPIKYiZTusL0abTiG4r115Q++OHBolzYLZ+Lu+UAd0EAa+9+0/PnxUUDUi12Y3n7YrVn1dUqzxm07tv1/6iaGBy3c4u6kjVSsws7sNzuP7Bf4iAjR3q71VSUUTTC0fh/MIejUWlAStluq8q4XNY97Te2rjhQHl0R5i4/jO+V2ukoF942VYRtL6uqgiC3AvPQs555YV+A4PblRyaA6r5qrVZTRjxaD/yY2d+wW2CGBucEHnR7sUTI0Deh2mrJWngq0yO5fBue7OIuw4jHCbcexddX4j811ADZB3YhR6gSj4apCh/bZXCK0azbHMgSZIdC00GnZ9yHg1UHpevOv9HrdlLWPmPKOO0brRityJeSpuuO8I4Bk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUNlZVN2Z1NRTDdYOXUydmYrTklWUzJmbjJnRkZsTWRuU1pGNUVzUGM0ZUVa?=
 =?utf-8?B?WlBGUkN2dE9DdHQrOXk3Y3VXSmFWaTlDa2tSMVRHeWJLRGQ5RXFBMWY3WE1K?=
 =?utf-8?B?Zk1laHRsaFN4Mys2emJzcklqcHJZTG1ndUd5a1VGMVM3RDVrUWN6cStGajRB?=
 =?utf-8?B?NUFGVzdMWFVETzVlZUNHbTJjMVpQMXhlUjZUazh5U1N2dnNhb0tvczYxWUJO?=
 =?utf-8?B?dkQ0TzVVRGFjY1ovZUVhajBLYnY0VzN4Z2s4bzl2QXZUb3FKKzZqTTRGTzlv?=
 =?utf-8?B?VEFvQzA2UmpsS1VoY0NCSk9PT2N6bHN5Vnc0RGtQcXlLb2tBdlYrQWF6VFc4?=
 =?utf-8?B?d2FYdVBIVTZQZHFKYnlkYnVpc2h2M2grbkpqNGxsZm5XZ0xsMTR4YWVEMUFP?=
 =?utf-8?B?ZTlsQ25obWlDUmhYMlNtWVludXlCU25XZi85azRNWWh2cmNjdlRicnpwWEoy?=
 =?utf-8?B?Mm0yYjROc2l4OE9FbXVTRHR2cVh6Ty9BTkhsSjFYOW9UbE5DdDFyY0RJK3Nr?=
 =?utf-8?B?VDVqMW4wZ3p2NWZVZ2cwM3d0OUx4OVFQNGlqRDhTSW5sUEtxMGV3eEU5bXJx?=
 =?utf-8?B?bGhmOE5ZL2FrK0x6VmlxSXk0Tk0wUWZWYjFycDZSbDhpS3JRTFVGN2U5aDFt?=
 =?utf-8?B?V1o5WnJpL3RnMWppZExMMHhTY3BlT09jSkFmWmVGZWpHREVpNGNuSEJ5Rkcz?=
 =?utf-8?B?djV6QldRa3VpVVlSNGMvRXoxVVRTeTdpRzlkaXRvamVUKy8zUTJiaC8rM04x?=
 =?utf-8?B?QVFwUnJkVld3OTU5VXk5dGQ3TVdZRFZnR1ZQWkZpanNiU3RuNndORm1wRHJp?=
 =?utf-8?B?bVdHWWRYVFN5elZYa3NESE1wYytpL2xXQVlXQUJPUnpENHpQRFVtMnBBdWdY?=
 =?utf-8?B?NjF0RFY3ZTNTYVBVdWFCTE54Qjh2MTRuTE5Xa25lbTI1cFRXbTNndGZmOEpK?=
 =?utf-8?B?SkNCTWpEUHZUaW5LbkVOMHRxSGFoclpma3ZQQXNYTzZyRXpkNHFsTWxHSTB5?=
 =?utf-8?B?aEpmcm9raFNMUC9SNFpIenVGdFBSQW80SU9rVG5pUkp5anZCc0NXVVNVblpm?=
 =?utf-8?B?TkZRY093bHhDUnl6MzVIS0V2dmRpclZBMFpUSEJacitJNzRkZWkvUEp6Qk5E?=
 =?utf-8?B?NGpnZkUrb1RSQXFrazNlWlZNMWN6cWxlMmhWN3hkaENKQ2NxditpbDZzQ2o5?=
 =?utf-8?B?RFlmamhkWU1KQjVhLzQ5ODdVZEI2ODEyOW1JZkVydkJhcXlOS1JWNHp0OW40?=
 =?utf-8?B?a2lwam5Pa3dpc29CS2Zzc0VkSlIyRFY1aDJTb3FQR3d3c0pDM1ZPUmMvSlVk?=
 =?utf-8?B?VnNWSjVZUmV2Z0xWWGdsTTJQL1A1NCtiMTEyTTNicW1JR1hpUG83RUphUDZJ?=
 =?utf-8?B?ckpXQS9lVGYzQ3FpU3hTa0FTVEFwbkFqakdQWGNjNHJGOWpKTkF2K2JmQ3R0?=
 =?utf-8?B?cVNzS25lYmZoYlZaUFQxd2hLSTA2LzRDRTBQYXZpMjFuWEE0ZDFPeFZRM3pw?=
 =?utf-8?B?bUR4WHl2QTlUZDRZdFZkR2NOallRVUQrNjBVTGZzUC8xcG5mRGZkV1M0cDh1?=
 =?utf-8?B?cm5qSFZJYTE4eUVjVDBXN0JIZXZFUHNVY3lQd2kxRTRZOGlDeUtNSmVxekRC?=
 =?utf-8?B?SW5oZytBbVNKWWRwNzhNZXkzZUt5d2IraHRpZG41QjU3dEwrMmFyN2V6Vy85?=
 =?utf-8?B?bll0cWVzRVV5cERzaXFmS21DY3JYdDhEYThyRmJ0WnVLOWhVck9wc0tSVTdO?=
 =?utf-8?B?TXp6TllGeUxnUUhPQ3U2SlN4RUVkMDBKOG5LOS9kNEFSN0QyMmcvSW9vbkhR?=
 =?utf-8?B?Q2xXYWhweGFzNURaVEtWZWFkaHZHd3Q0eGlvbzd5Njl1QjVaeXgvTys3RWFx?=
 =?utf-8?B?eVNUT3BDcHVyeXQ3elF3M0duQkpqRDloZlRvMDl2b1NkQ3RrL2dKWUdzTjZR?=
 =?utf-8?B?UmM2dXAzeStSaVVtOWo1MXoxUUh4M2pHSDN4bGRkYlJMd2d5emxNNDZ1dHFO?=
 =?utf-8?B?TElCUzA4TGxHcy9Ja0NoMzBsNjVEMXE2ejM3a1ZMR2tyMUlCNm95U1J2YUt5?=
 =?utf-8?B?azhESmZoejBlK0tSNThYSmVXY3hXMUxZbG0yOGVDWUUwZWZpZzhRYXdiR1lJ?=
 =?utf-8?B?M0Q2a09NQnhSanJIemRLY0FCcWtQK0FkRnFNc1p1T1FndDlVNnlLQWVWOS9W?=
 =?utf-8?B?TU5CYjRQTGw2cjFQWlZ5WWFNUy94NlJBbjlISStQemxnTjlCVmZLK3pCamdU?=
 =?utf-8?B?N0VIbHJwMTNuQ0ZrWUJVbkUzOVBTM1ZZdmhKY0J1MjNPbWpsY1ZGZ3RvU1NC?=
 =?utf-8?B?cmE2a3dkVlkxWTV6dG91NTI5blFHelNOcGxYWGxYaXlDUzBmMTdYTXJaYzNk?=
 =?utf-8?Q?mBtII8AFseXIF1jc=3D?=
X-Exchange-RoutingPolicyChecked: kCcRrf2R8voVSS8Y/aa9u5WSoVwQsVLZPC3Flr7gYJr28kNHLPprTP/rVnQuqJDYjVZLD4zAFYUW9iNY4MRC5blynSYnmuqNFRRps0fRt+YXG4/BCCjPhO5p10NJBBLwqWcHEN9OlkerIDK/RKs38lbnY9C75Z3wvZfEcjD5FqI+JQPTVXtIP9zFP9JhukCzY7DT7ixPfnLF7rm9j/F9ZMyAcO81B99pNru3+oNT4vKqOjQlppqBQhMoxSLK197aandg9klwV1h/StZfwQmfdbY0WtRzjzEx5NnlX+7vRamNCjSDOr+Mt52VgXpLQUmnbvxiBGrBvOFp1kSBUXKGUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 943bfdcb-f938-40c4-1591-08df0f033e16
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:17:51.2428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1X5Sy4HPsdeYOHUKPkV1SSU8eJOZGj73jmkbMDLOvMGvwsgzhMbOTV38S4Nw7XumX70ajSax1I1WPjeS9Ea3YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB187491
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

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Introduce an IGT library for communicating with DRM RAS Generic Netlink
> interface. Add helpers for Generic Netlink socket initialization and
> cleanup.
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v4:Renamed library function names prefixed with igt_drm_netlink_*
>     (Nikula Jani and Kamil)
>     Moved the headers to other commits which are not necessary in this
>     commit (Nikula Jani)
> ---
>   lib/igt_drm_netlink.c | 54 +++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_drm_netlink.h | 20 ++++++++++++++++
>   lib/meson.build       |  1 +
>   3 files changed, 75 insertions(+)
>   create mode 100644 lib/igt_drm_netlink.c
>   create mode 100644 lib/igt_drm_netlink.h
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> new file mode 100644
> index 000000000..709c01987
> --- /dev/null
> +++ b/lib/igt_drm_netlink.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <stdint.h>
> +
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/genl/genl.h>
> +
> +#include "igt_core.h"
> +#include "igt_drm_netlink.h"
> +
> +void igt_drm_netlink_cleanup(struct app_context *ctx)
> +{
> +	if (!ctx || !ctx->sock)
> +		return;
> +
> +	nl_close(ctx->sock);
> +	nl_socket_free(ctx->sock);
> +	ctx->sock = NULL;
> +	ctx->family_id = -1;
> +
> +	igt_debug("Cleaned up netlink socket.\n");
> +}
> +
> +int igt_drm_netlink_init(struct app_context *ctx)
> +{
> +	ctx->sock = nl_socket_alloc();
> +	if (!ctx->sock)
> +		return -1;
> +
> +	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
> +	if (genl_connect(ctx->sock) < 0) {
> +		igt_drm_netlink_cleanup(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_NAME);
> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
> +	if (ctx->family_id < 0) {
> +		fprintf(stderr,
> +			"Failed to resolve Generic Netlink family '%s': %s. "
> +			"This may mean the running kernel does not expose DRM RAS support.\n",
> +			DRM_RAS_FAMILY_NAME,
> +			nl_geterror(ctx->family_id));
> +		igt_drm_netlink_cleanup(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
> +		  DRM_RAS_FAMILY_NAME, ctx->family_id);
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> new file mode 100644
> index 000000000..0e563e55f
> --- /dev/null
> +++ b/lib/igt_drm_netlink.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_DRM_NETLINK_H
> +#define IGT_DRM_NETLINK_H
> +
> +#include <drm-uapi/drm_ras.h>
> +
> +struct app_context {

app_context is too generic for a non-local type in a public header. 
Please prefix it with "igt_drm_netlink_". e.g. struct 
igt_drm_netlink_context.

Thanks,
Soham
> +	struct nl_sock *sock;
> +	int family_id;
> +};
> +
> +void igt_drm_netlink_cleanup(struct app_context *ctx);
> +int igt_drm_netlink_init(struct app_context *ctx);
> +
> +#endif /* IGT_DRM_NETLINK_H */
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index 7248bbc2d..70da9a4a0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -27,6 +27,7 @@ lib_sources = [
>   	'igt_device_scan.c',
>   	'igt_drm_clients.h',
>   	'igt_drm_fdinfo.c',
> +	'igt_drm_netlink.c',
>           'igt_fs.c',
>   	'igt_aux.c',
>   	'igt_dp.c',
