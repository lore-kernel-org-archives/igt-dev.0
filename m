Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABC0CCA470
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 07:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A7310E903;
	Fri,  3 Oct 2025 07:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSa8MgLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B7E10E8F7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 07:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759477522; x=1791013522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fk79uEO5Pm4tdzm7+ohqfZhTkhKL9mZQdqXoeGTD3TM=;
 b=OSa8MgLsewxGHQbn/cm8BUM+vwQ6nEf89CBWAxumsPqKHTz/l9L4T6te
 YfDbJH6aMfMkXDI7eAoRYmfEk5VAKOrRvup79Ie0sqVO4ZW0KgV/4YXJk
 qPvPuXA7jTTPftv2fWRw7T9sh5fi6WPyCK7e1iJPjsCHm4ckqCee3cU6c
 rUHZbisfijGmPXkvlUGhEZj6iOaMK48T8YBDLk5ZJQJHsizoN4WXN+lm9
 FI4BIL1hlrB7K5m6XRtUYqbVljHYQcor4ubQXCt9muChLIcYEd6W12uL6
 QAGx20fRyh2mAucToeqwSF1wVdX1wYiJdDFNgi9qu/4WCjXjcQeSj4CfF w==;
X-CSE-ConnectionGUID: AQqWQwLyRqikQZ4lPpk41Q==
X-CSE-MsgGUID: T2Iw5FxzSuu/MZySqAzIEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65609300"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="65609300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 00:45:21 -0700
X-CSE-ConnectionGUID: IDdT2H5CQ3ySKl85Nup2+A==
X-CSE-MsgGUID: WiaVLPS8QjKwQ+nvPNvhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="178352732"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 00:45:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 00:45:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 00:45:20 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 00:45:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOHrOrIAPBFtXlxFzdngYpVAfw52m1q3uDdJTn4aCez2CGBBHHpdPPCnTf1n/u0QOvoK8HoYHGQuXBcH+dnn3rp8pAZmK/FK4W3GLvYmXSd+BsNdL2oAYJdwGbmAZMOoYW2hXJSvy9YSN8G2v3JZi0DaeIukAebr2kFd2XiIaDaffYPxGW/WtGLr1FJpoZQOdDRKS9KIHlzb8Gp2InQ3VwCDHZS2xmuMfNN0Lqgzn+4YKEsmlzViUFkDmHZjC9K7rRZLXrvTvAwjqCqkvey5mMI+fCplm7MnBxUDSjJzohoojDfE0Qws3Wk5MZGGIryEGSTxifIM2KvCB4CFBOUdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pIGLEqqdj+cUZJ+loWoIIe2TBzeR+iX2YP/bZGItzo=;
 b=gYZuFnFyX7/Ve/mCEeoDV3P7qyDxoaAxxAkVXCMrHt7UdsuJmoPorz2jXasy4RvQIQhCduusU3XXSvZDNInuSXbR7zoNz15Q2C3+4lYZ2kOUHraJn1LnA8oAzBX4fbyx4nwS5bi4I9OUk/uqlYRJmAngW9jAQP4hIOdnvGnJohuutvpORKY4GYVvok+yvq8ykuM9cgBkb9yMUC+mGWy8pdwhTlo4Ng41VSRXC3JrYJYr4r0SHNTGDza46yf/0UYdZ8b+GsYgNVIWCosH11pDP501W1QSt1+7LwwlEIsHJ2sGLZIVNT06QMTVXRuzjz7+xq0KmxqT0KTA+zOfniD6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 07:45:13 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 07:45:13 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC
 cursor check on simulation
Thread-Index: AQHcNDTuOLaux4gdAUeNn6AyOLwFvbSwCmDQ
Date: Fri, 3 Oct 2025 07:45:13 +0000
Message-ID: <DM4PR11MB6312433659EC563FE7435BF990E4A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251003070747.566921-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251003070747.566921-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB7503:EE_
x-ms-office365-filtering-correlation-id: 932f8b15-f6cb-4ff5-b1b8-08de0250c990
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xwFT1jA+9ITx9tcF9AJFCVppglspQ7IE1htqh1eIDwOFneGdqsvJ5XeiVY1h?=
 =?us-ascii?Q?my/ZBJuuviDRUq096zgYMzaOcMYakka4vE8L5dKMNCxNIXtUfLmFw9+X6KD0?=
 =?us-ascii?Q?1Vk1mtIuxboYo/qujEH0PhkT+dO1+dTydf22YqH7KxHs4GbxkriCjbCT5pjQ?=
 =?us-ascii?Q?VSmRjUZwFSVF358oVD4KME6oSrm/tm9d9fGLB8+8Gtof/ymd30nUQcKO80SL?=
 =?us-ascii?Q?hbXHVf58rmbJWJp9atWRWU3mQ5EDuirU3Bc/tYkkGYmv17t9TsmsOKcUSnSR?=
 =?us-ascii?Q?kwNG7Mc4ospN+Aj08fBMO4prjPW+Z87UdXadXK1BVGzHIm170ojTDL3M3eas?=
 =?us-ascii?Q?KhPV77R1ZFxdePiZ0t7rEDGpUUqu4EVUL+QF9RCFN7EQsbAxsRl4DDFFLaL3?=
 =?us-ascii?Q?Atip7ZAY3IfnXIa5fEF/LQILHi2ZtBe7xvh/+7HqdmkUVItry4zlyukG962s?=
 =?us-ascii?Q?GIhASgA0te5kWJr+w2i/x9Mm6qWmc5OweTNIv+PLxRoVzf7WjF6rkA8yRK0w?=
 =?us-ascii?Q?3TT+m9B3XEuDWruab/VJth85Qm9oA90Vwx91jTmHPj5Hpy2a9eruiV21CPNB?=
 =?us-ascii?Q?iz6UWQo10MXc8sXxwcxbEbsUSk08gGm0jK43tiydWJTvuSA6z+A6JUoTXffa?=
 =?us-ascii?Q?d+f3ppO+9d5fJCsVGxDbCgtMP1paR4iGOirjHOg05U4GdghBOsH9JZK/ifmx?=
 =?us-ascii?Q?mitgOD6VVLTguYW/5GerphcHzQ00Y/9/AEqEXwfbuuxm0744kiiY+VnJGOQE?=
 =?us-ascii?Q?FlsBFA4KnhLctJr7f0J/cpVEGr0FwbWYzJnLKbpQdOBkiYPsEtWHBcliWeKr?=
 =?us-ascii?Q?DKNzex96p+ddz1bZiiIHvPNFnyyBPT2oeD2yxfIesekmOrGqlevMndlVpV0/?=
 =?us-ascii?Q?EiIYRYDeqbxu+eVBqQftKAYNM/NVcShawO++eals4ZKdrvNcU3NqRmLV2eKK?=
 =?us-ascii?Q?kHUAt9/5RFiftbqKMH0lI85fsHajeKLdNVD9CL7kO2vXiHSlgkx1vSi+UaLc?=
 =?us-ascii?Q?0otUgW8UF3NTCeS3Hu/XC2dgEwq+eTdIqeI8ytZE9XCkQIk5T9UK4LoRQdza?=
 =?us-ascii?Q?Lh8E1WkVVy9GYa/gpfLIBmZ47mkW9/2T8wNbT4En5oZK0cpLVkJrqIBZIPTe?=
 =?us-ascii?Q?PDLM6q2s/fNjbWRRRGxoakqHcokDBZz2GsVzsUBGbu+s+p7VtSXWtx2zdfwg?=
 =?us-ascii?Q?VdqBVQIDdrKElsomg8vaSzkjvgCl46njKY3EoJAKfVQ4kqw4RzJwQyQPBVyz?=
 =?us-ascii?Q?1INowEVkurMuJCz9l9Va+IDJtRNEgGJpCwoTL9FXx+WlGKqh5iOLC/gJJJgv?=
 =?us-ascii?Q?YNPtxXSPKQYqV9xdByOaW3/bl8iMvj8PEbgExYBmf5fWiuaYxlQ3XQMXNlhY?=
 =?us-ascii?Q?z+PxQP5+JGytC55CVcvGE4NN9zp/7GINoh/urMJaQ6CZZYdBbDJC3idZnMgk?=
 =?us-ascii?Q?XgSZTaoHjjeFqiB2pUdG18rq5uaO8+B1Fy/SPQQun0+rE11taX4/umNshWCY?=
 =?us-ascii?Q?m+k/cObpUaW91Z9jsTjQnkU9QlN9yH6ZMqxs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yfuqbXtlWmSyDZ/FKx9Wb7I0+jez1jMvIGXOjsk5icf8iVaO51wZtfCoPh7p?=
 =?us-ascii?Q?WeBvL/kWkHxsSkgNvhT9CI5snkGHP/vkOjlMtTJJ/U6QZgM3XJ59ReKCWJZw?=
 =?us-ascii?Q?1rxlOFURHDVlK09+LB8h5mcb8ZoVuDs4sFPd5iovxAJWlPo23LO1+ecKx8r8?=
 =?us-ascii?Q?6Yyc/kdNgQM0IMgahGi3C7tztFqp11dAJ2g9W/w1QU2CvvDvMKbGeAYrwACE?=
 =?us-ascii?Q?UnjxgZk8PD9DWpvZuvAXmDrYu3FXJVOcSLWF0AN7qpM6zauWNmMWCwNTTf5r?=
 =?us-ascii?Q?WvOC81uVTs+4LEhY6RiISWvWmwJ1UDM31MWonx7oB6XKcLSM+eDUj94lNMq5?=
 =?us-ascii?Q?pU6CN9HftYD75PvhKw9wnOIisDh14oduwHt3iXeHgr1XR9JOJoqqvYiPH9XD?=
 =?us-ascii?Q?WKWCPemSJBQJKZ+kBtTGTOTC32op3QwK87yCyejKF0doam74hIQuJ8t8uvvX?=
 =?us-ascii?Q?1Z2IR5HBU30Go/+FEDLtR5sY/KnY2B6bhFD53jcdgePTUI0M1CVZ4mF4plMs?=
 =?us-ascii?Q?gGGC5VrXm9fCbO9D1gONLeRXSZPJGcGlyUYUM9UNBPWoRQSc4jhOeaIjYXzK?=
 =?us-ascii?Q?UewOTdcUcC0WV/XgoqKOenU7ySq8TPXkybfgbA6xRw4L9ya4n9vs6PpEArtj?=
 =?us-ascii?Q?zTSbTHrmveVORM4F5rTbuIKws+eCnqAaVygCmC3ivyXkabb5p76N6LCrRvxa?=
 =?us-ascii?Q?yDGvtGNyAT3j6OBEsnbBdXCB4FlkW2qD9Chgn2V4GBaijKtFylSWnCgXvaCr?=
 =?us-ascii?Q?wdt8sdb4fkKd2N3JdFlBwfuBSRQJ5P5x89X1gaSf4WHr0efkS2s2vA3rQFOq?=
 =?us-ascii?Q?e9B2f9LmhKlOtirQErTHwElwIpgU1F7qZkC7TaHWimq8B+1RjswUE0wgwBrn?=
 =?us-ascii?Q?M1/sFAANlNO8r5xXiWn2QF1S4D3MxBlvZrh6GEqtsYsSQJoHZwl8J7KOIr9k?=
 =?us-ascii?Q?6N7dj7CKBGjkjQguKfyymbNKO60Yba5jaIpRe+wtqwpimpfADnGOOZ1x73j/?=
 =?us-ascii?Q?01nQhGzcRCiJv3IUbrv/KsGOcXNGTFbiwSX8PcaVpTRQxpXtWwKZWtt/xG/K?=
 =?us-ascii?Q?8CfhEkvR/JvrK5LnstI2u8sx39zTntMYxp+3qbx/0VmebWpqNW8uuageFUH2?=
 =?us-ascii?Q?HKkgFQ8Xkx1X9UvY2tJPxgZZJVM6odS6XnVK3HFkGhfLxhC9k7C3qOjbUAJw?=
 =?us-ascii?Q?/rOPw4jtWfoOQ0MCgTParphVedvSVX10cyXZrKeQlgMqhZgCNTy/HXMJM9d1?=
 =?us-ascii?Q?wc/0vPUL0X3NERwmisx0IoKSQW7eXOj26GmH08K4vHvxxPQwNtN1P3rwqO4c?=
 =?us-ascii?Q?Qqx/KlkdCtkf2aBMhjhVAsW/SOH9RFslQldCcY+9V6JofbN+R6Oc2N0UtVkE?=
 =?us-ascii?Q?bUq1Hy5B4ouoBa+iVivL6iAASF3FQOxJluP4i+xQl8Q8yJ6z/2WZ0ACWSHfP?=
 =?us-ascii?Q?qwTjl9N9lmZaCTWO4JbfCXGzvDGeeNPnv8n6eDjw0apnYWvq9sruILNc4XEw?=
 =?us-ascii?Q?9yhto1dy5MmutjTfIWDt8ig7+S9mBlri0PYuCrzaLuFCpV/rJAMzJwO2+Bcu?=
 =?us-ascii?Q?A783g9jmDtC+VJssvK0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932f8b15-f6cb-4ff5-b1b8-08de0250c990
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 07:45:13.5459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ycMSYvR54wz9Z++r3DszxjkoMxpXMReMSX0uVJvNUjlB0wWDnMM0+gYBks21XFKYC7FUc5TPoH6mRrGLZbWfhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Friday, October 3, 2025 12:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>; Reddy
> Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC curs=
or
> check on simulation
>=20
> Skip fbc_check_cursor_blinking on simulation as it involves CRC operation=
s
> which may cause hangs or false negatives during test execution.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c in=
dex
> f3843cdb0..7ba31cd86 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -149,6 +149,14 @@ static bool fbc_check_cursor_blinking(struct
> drm_info *drm)
>  	bool ret;
>  	int i, pipe;
>=20
> +	/*
> +	 * Skip cursor blinking check when running in simulation mode.
> +	 * CRC operations are significantly slower in simulation,
> +	 * so CRC checks are avoided to prevent false negatives.
> +	 */
> +	if (igt_run_in_simulation())
> +		return true;
> +
Can we just do this before even calling this fbc_check_cursor_blinking func=
tion ?=20

if (intel_gen(intel_get_drm_devid(drm->fd)) >=3D 9) {
		if (!fbc_wait_until_enabled(drm->debugfs_fd))
			return false;

 +		if (igt_run_in_simulation())
 +			return true;

		return fbc_check_cursor_blinking(drm);
>  	pipe =3D kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
>  	pipe_crc =3D igt_pipe_crc_new(drm->fd, pipe,
> IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> --
> 2.34.1

