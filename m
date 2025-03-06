Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB95C282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 16:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA710E9E6;
	Thu,  6 Mar 2025 16:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhGqQ+L+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EF210E9E0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741277221; x=1772813221;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xPjli9ejLGz4oy3PHCunfyf8CSa6FvuJpIY3rRJnCpU=;
 b=WhGqQ+L+VI6KvHPsSzzLFmrqg6tW+uBvfVsGOLT6OJdJTgb8YO92l34T
 agQFhltM6TDa8yad2PhkxF8eIYqbqD4EFH7QRfLuVb2n8A5akOBp1JDeq
 sMArfx+0AqsNXnIixG/qrc5/ePqnZFZw+qBMA/ydGnooH8sMRwObif5Cy
 mqbaJlnvBOB8m5kFNJ5QdglQl+0Y8LTkZx6HO2quMKRMGEPWn4FGYOLk5
 yfh8+CJdpLlMDLGzCcF+tpxPaawzxDkuz09Z7R9nDa9RjZOVUGOlzsCOq
 FJwPPVCAai59kzQUg3q9hza55vrNV6pnH5o6ma9Hgve3raOEJGSiKmOp5 A==;
X-CSE-ConnectionGUID: 8b2iNjjAQ62tJoSjK4iKoA==
X-CSE-MsgGUID: fRqz0QBCRRiSWXxpqVGq4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64743953"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="64743953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:06:42 -0800
X-CSE-ConnectionGUID: rCI81x/TTHyxDm/uDrSypw==
X-CSE-MsgGUID: IcBtv73aT5aqYPMTVFKWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="124078124"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:06:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 08:06:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 08:06:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 08:06:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8JBn1yazNwKPNyNqxE4mAySgN4qZ9HvN0ZEzgJxY3nqOQYf85Gu709oQhbfAw41oIfygsxMJyfSSpafj0tVXcjWuDrfAAbn2Ay70CLxy8WQdZI+qu4wCQoNxh/+BTi3SZD50XF3b4l9E/MTuN5w7jwpIDIreKgf93LM3iGl9O4c6rzgXCgIZ2A2VSbQIzMlT4s33Hce7Dyk3I+/fecKutkns3csFgi1lJop6Ha9oHl9wbW/oETMfG0FXkCvy9ug2WM9EWnvfVq3XHWDzliWuM4dJ4QDZlEBhbQBh25y2QtezcMAEKfMlFJ33fXL5+OHMdkpF6jwD5aJWmwOTBF7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV5Spnua0jYFG/loP5UuOURwwnKiNnzwr/9NmWD6g70=;
 b=B6zv1g5XAMiaop/W7sZC3CtFZ1tqFKKedCotEplS/2P7cs/SAtcwzzb+lUpQw30EPFaLW0yiKGD/60VJDpg0zQPpFo++hhZD3D5R8m8Z4CjihjmdYDzoVW+lp96WawsZwM4EyneTjfCak9VWjxQBLj2RuTnm+oWeQJcVUE4964LtzpMKfmCVLJA6RprVU+NbKlIdpmdBC+0NudZd8QZjQSFmriOg6AZiJkmWDaX4H2h3K9nkmNmWWte+bN6d7OAnu+GihQwH24HrqHoT5iCXBAelxjbEYV93NxxHJF1lGcI6751bH/nNGKaj5iZzqycGC1Pnzw1BKzBYEjZj9jIgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 16:06:02 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:06:01 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Thread-Topic: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Thread-Index: AQHbjos98wlsrMbk30KIz6KGD3CPK7NmIH8AgAAhOwCAAAOTUA==
Date: Thu, 6 Mar 2025 16:06:01 +0000
Message-ID: <CY5PR11MB6211DFD1745310E81E6C498095CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
 <20250306135100.ey6vkuzvezylu7jt@kamilkon-desk.igk.intel.com>
 <yc7bfsm5qm7ciipadix2ahhwzazmnkkvbvvyfa5a27qu7vxq5o@5p7nmvftovgx>
In-Reply-To: <yc7bfsm5qm7ciipadix2ahhwzazmnkkvbvvyfa5a27qu7vxq5o@5p7nmvftovgx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB7683:EE_
x-ms-office365-filtering-correlation-id: 2ee168e3-2e9e-463a-4e62-08dd5cc8ca8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ierhvUUsvfhFr/chfTYpK1NMeDEqZqOWEy8gfoYO9mpAzHJP3yb78+bBXzzk?=
 =?us-ascii?Q?niMZFqJ41PBeAQYb2gl+tTA4XXJrCzL2gJzeXDUM6DgHhcgz2wqSDPqyws5m?=
 =?us-ascii?Q?RX721EHadjzm4lNZhF8H+MRjK/peIRXsIIdeATTwxwlVUZcM0gYZWM2p9omA?=
 =?us-ascii?Q?Ol03FQn+0EIs7+FQx2hFYMvaWSaGYYxXmersJk9CmGHacSc/YwYXdUgZpLET?=
 =?us-ascii?Q?selXMpQiM6z+D5BGF5NlXItiS8pSK99LBA505rcigkhPD7UxQNTsn1iNGx+3?=
 =?us-ascii?Q?BAhYt1hhfM85HSU7SzIhbWxSTbeo2ibxmqT0WctubVfjfVWkvM8hnz4zrGH2?=
 =?us-ascii?Q?xEG5tM4OMCr31D2oV1l0oWKicWoR/+/Wbyg+ptNog5ejRJbhe7EgkoKGP8Ha?=
 =?us-ascii?Q?LhlWg53deZCZdZaz8sXRm9sJgDwG8FL7BtXFzewhuI36lnkrQpuC8mQW81vw?=
 =?us-ascii?Q?Cl0anCMK10w9M2utaTiVx4uSaLUwSk5+BKXALhmzVyGeS6iil0xWICx+BF4b?=
 =?us-ascii?Q?9c1AoVfkU/l80feufKeoFUAf7zBa0nKsf+H1KMXIUZj8KTbDmEb1YoioEKIi?=
 =?us-ascii?Q?UgNes7Tf5tAvN0ejhxZNUiF9NR6CuiNBlbvlVOrZ/kMyqzGtHisGBLMZtQ2T?=
 =?us-ascii?Q?6OKg6D90NyAw5EIoXpNRkidIHYQAbzfM2UHB+uygIyfDZd8z9rpE7N5m5jpM?=
 =?us-ascii?Q?LuBD3arYfCCGw4XYFbCBykuUevvT45Nu4/o6fBqpAmM3JWOXWA+MIRO6f7ol?=
 =?us-ascii?Q?cBT8p1lWn3SmxDkGNiGDP56lH9E/L8QOHZ+vPGVCx9e8zGIo8agkKW34lnCX?=
 =?us-ascii?Q?AMQEi/cklAThWe5lN5aTXCnl50bgLdMtxResfU04+O62TB5ytJBLOGf83YCD?=
 =?us-ascii?Q?2ds3lOg2DXWTY/6CesIAzptoDLfgG/fARh0kFNc4AFbrEVXvW4Zw1II6UnMT?=
 =?us-ascii?Q?oqIzwgu8OYmnbiCuvpbWHRgRDu7m0ICg1/2iEalzJyMDcU+3zppaaZ1TtHaq?=
 =?us-ascii?Q?esUGy3OgAddEFnlX5wFbRlT54xsPZ6jNdmshQZqWUkJf368stzSG3/z5XbkO?=
 =?us-ascii?Q?bVxLvT87v1Ozyp7Zl7x/AzkoX70bI3YKuwow7z2vux1KILVmbth1USwmsoMk?=
 =?us-ascii?Q?0V5hBiyg68YyLZUQbpu4mh62+Txn6lFzxRIXsaoFh5hlKG9m2mHlXVY/1cdI?=
 =?us-ascii?Q?xPVreE2+knn8viyEEPetyC4VCwOwrb1cI5MRl21iZ7LoANDmsffNr19BuoSW?=
 =?us-ascii?Q?m9MsQTaqpwgbf+hWL/0f8lFyY2EetSdMF5X/yVebdnk1X1h1VlClWyZL8ldC?=
 =?us-ascii?Q?wvl0NpqY+o74DP/Y1dLTXdY7P+J1OCUZxuT7hh8nj4jWlBSLE2cS7rEC6azc?=
 =?us-ascii?Q?Gsq5w1oLrsFBtlT7JBn8uXr4bgA7oTMwYnbSP9KcOT7+sQ90fPrDINBIo6wK?=
 =?us-ascii?Q?7DQ9MpCnkoGK3lqj1EoEZDXJnaqxj4JHaZlnSUdEljliyZ32QGAxcw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vl3IMZj6BPRyAUarME6d+m5y+NDLyxZsNZJ34bxG66hfJJYnI+AC9RlAMKaz?=
 =?us-ascii?Q?iLzXgK3d5ohHWzmNN1jQcxP+V6xJ+1G6XfN68kruXMj9qqzZEhXZx34xMHcX?=
 =?us-ascii?Q?DTJCKOW7dWQS5BdYsfBxh5yXcUl04GzsiHPE6AY6jO2+O9rvK+nv4ngicCki?=
 =?us-ascii?Q?jnoK0MYrKGlyLx7xEqqhAGE9tt9xbzgnSv0Zgmt3OXm3XdBhJWxaDsFFm/3f?=
 =?us-ascii?Q?T4+m8piWfoMSNmhpMsNsrKprytXXTJp0ejlQsm98BJepT32o07M1fykimel7?=
 =?us-ascii?Q?g3HuXhUyLCxyWaKlFoyeTaVwO8+6fThcmaEZLGV9MmPlUwB2kR1bMS4kMZfs?=
 =?us-ascii?Q?s5WQcLrRUPcHs6/tVtugZ3UgYvJN0S1ZfWFeDjt20wA/Ys5Hv2FpmmwmwGVN?=
 =?us-ascii?Q?IZKt2Im4XlDaYnDJ7ZMcV+Xs4Bk04a97RKeayhQfcFfgW+MnRmP+vF2HsTau?=
 =?us-ascii?Q?0HGuYYpu98Cp9icBuC3+DAhAd84h4FNKXvETZWU6paijtVaNBVI02t+7ril/?=
 =?us-ascii?Q?UBPadEMYscGyi0uOFGNNerUnpD+Nmjrh1cRACJ2iYlpYj5gu0ZKsQCcNEAxB?=
 =?us-ascii?Q?QFzZXjN8QUyN4YjxPgnJ1WmajhpZ1BQD2jnt8thaGZgZn9mHRRzYqKLZS+lr?=
 =?us-ascii?Q?jn7Ad2dnvVkzYXclt8eAtBO2bhFXaUrmq2wszaiVOOPqwlyil8+mvEsEo4+e?=
 =?us-ascii?Q?4Hz/OKV6QlSrDxRPKXXSvSq8XtDZplBeWdgXIkFj6VY3Ta1EDVLwYd2/ZjJ5?=
 =?us-ascii?Q?wdTKDjmzZ750BgO9aZ2p7O6X2ClP9oI6DOdXF3zqvz8HlUhvNLu3McxlQTzl?=
 =?us-ascii?Q?SEt/qjmmneokSJSosTjw8dKZPP1v5SfeVhbm6MeTQNRCQjVoXdH2J1tMLv67?=
 =?us-ascii?Q?p/UvOeyqa46o/7MipAlBsxhW3PWkxqkg0h14tcq5Iyip1H480BidvpQs5R48?=
 =?us-ascii?Q?V1zCMsSy7NpLUoL+DA0d1HfNBh9vckOwf8LJqJUNzQSmlX5s9wGREHqat/Bb?=
 =?us-ascii?Q?M4AGdmUMlkfj0TfpntQnccl81YOI9wP/5L3bHQcsWitupib+d5FLqFlB6gyg?=
 =?us-ascii?Q?gFPy2uOQ8vvvvEfNiqJmhZJev9ZWOfO2OZFVEGxPBk3luWFaqIVudEZP2sUw?=
 =?us-ascii?Q?MXYjC9CdOMeo9zmlrTKL8znQ+95tmufiRauaT1ndLUII5OYsuEjDD3dj13Tz?=
 =?us-ascii?Q?a0j9mVWcIS4uzosbv+W1YtW6v03OsS2QzUJnAvvANeo6jVJcy74xliVhVi8x?=
 =?us-ascii?Q?rWnfEpJAj/G89qeuwBWsv0ewd2YqdFFAx3t4aN2mp8HbrD5taCzu3boxbibj?=
 =?us-ascii?Q?SYaYjn75mLtUIin+HLmYLW2NccvhOXSbfKObGthh3cOC9fYdrnGpGDff4rRa?=
 =?us-ascii?Q?zhq/xkJCff2u56lz6hIA8SL6eh00gFDAnR+ms5Ahtth7JmP5PNyyGu/U3oQq?=
 =?us-ascii?Q?BhQntdBHL4h6/hJ/t56MaUODhwB9GJgyJY9RWVowSuN8QdWrRQ2VVHAsd1vQ?=
 =?us-ascii?Q?80skRB/Egwic8mc6+sghcdo/gFF+KhwIvqomwk5oytIuNODpINY56obS1FE0?=
 =?us-ascii?Q?FkhAX7u52j7PhDV/PSoYWhnVIpkZHxOG2VQGv615?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee168e3-2e9e-463a-4e62-08dd5cc8ca8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 16:06:01.7427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+/sh5ykvMY2kz62MYbNBsrHWiaAvopFdAa+plNWM5cTD3ok5Hl2TYOKNGA4+Z1jypUdrVbywRPSNW8lsddGhdwkrDmx37C5aXUbCvlfZKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, March 6, 2025 9:20 PM
> To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; igt-dev@lists.freedesktop.org; Tauro, Riana
> <riana.tauro@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>;
> Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
>=20
> On Thu, Mar 06, 2025 at 02:51:00PM +0100, Kamil Konieczny wrote:
> >Hi Soham,
> >On 2025-03-06 at 16:57:54 +0530, Soham Purkait wrote:
> >
> >add prefix 'tools/intel_pm_rpm:' in subject, so it will be:
> >
> >[PATCH i-g-t v1] tools/intel_pm_rpm: Add support for Xe driver
> >
> >> Add support for runtime power management for Xe driver.
> >>
> >
> >Add here your s-o-b:
> >
> >Soham Purkait <soham.purkait@intel.com>
> >
> >Please use checkpatch.pl for some obvious corrections like this, you
> >can find this script in Linux kernel sources, also read CONTRIBUTING.md
> >in i-g-t sources for some options for checkpatch.
> >
> >> ---
> >>  tools/intel_pm_rpm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
> >> 08c25ca8a..945247d2e 100644
> >> --- a/tools/intel_pm_rpm.c
> >> +++ b/tools/intel_pm_rpm.c
> >> @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
> >>  			goto exit;
> >>  		}
> >>  	} else {
> >> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> >> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> >> +!igt_device_find_first_xe_discrete_card(&card)) {
> >
> >Split this line:
> >		if (!igt_device_find_first_i915_discrete_card(&card) &&
> >		    !igt_device_find_first_xe_discrete_card(&card)) {
>=20
> I'd rather stop spreading this. Particularly in **tools**.
> If env_device is NULL, why don 't we rather build a match string with the=
 thing
> we want aka
>=20
> 	"pci:vendor=3D8086,device=3Ddiscrete"
>=20
> I'd replace in tools the current uses of
> igt_device_find_first_i915_discrete_card() with:
>=20
> 	"pci:vendor=3D8086,device=3Ddiscrete,driver=3Di915"
>=20
> ... and implement the driver=3D match in igt_device_scan if it's not ther=
e. Then if
> it works with either i915 or xe, we remove it.
>=20
> I also think the tool is being less than helpful by trying to work with d=
iscrete-
> only device.
This tool implemented with intention put the discrete cards in runtime d3co=
ld as it requires to tune each pcie device in the topology.
As d3cold only supported on  dgpu, we don't need this tool for igpu.
Thanks,
Anshuman.
>=20
> It looks like SET_I915_AUTOSUSPEND_DELAY also needs to be abstracted?
>=20
>=20
> Lucas De Marchi
>=20
>=20
> >
> >Btw should we also add support for other cards in multi-GPU case? If
> >yes this is some more work for another patch.
> >
> >Regards,
> >Kamil
> >
> >>  			igt_warn("No discrete gpu found\n");
> >>  			ret =3D EXIT_FAILURE;
> >>  			goto exit;
> >> --
> >> 2.34.1
> >>
