Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E913CE77188
	for <igt-dev@archiver.kernel.org>; Tue, 24 Dec 2024 08:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7688F10E294;
	Tue, 24 Dec 2024 08:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUh53usH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E734A10E294
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Dec 2024 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735029119; x=1766565119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=u/ZbkY1P2kd9ZF3ReptjgK6iqVf52QVIg3kkBeTNNtE=;
 b=XUh53usHBtlcRDSzUttDw+MN4NW6nmMi3UY3mO5pHwXxsW8tJ/K7LOhw
 gvu8JG3Eojrm3cnMCUjeInoqGYcLR0ipXer+bNTzEHW+Tt38C5AE++Z8c
 KMjkhHz0d1542D46FHfsbyaZXrNHw+mb7iD1zoPXvhjunUtaoUIe6Bdwj
 ku7c6YEC2Av0lFczHzwuugESDfLkBYnQyNbELsIpNwi9id+iZZ7PjVcPJ
 AphpHGWsZ7xM35HxfmPl6dHI3JwA8bma3ufDqaJO9W32bcEvtYeu1c9Dw
 qcBISxTP9eoE332CeINHutf5yoTXh+FaBZD53Q0rAYgQMsZm7yss69cfJ g==;
X-CSE-ConnectionGUID: 8X4wGs2hS56wkz6wvpDQyw==
X-CSE-MsgGUID: FaR7sn3ASLGnnOvPj4228A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46917186"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; d="scan'208,217";a="46917186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2024 00:31:58 -0800
X-CSE-ConnectionGUID: XNdn5ZPRTo2Y3BfwOtsxWw==
X-CSE-MsgGUID: hqo5njU6TF6KF+pDCPnQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="104435665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Dec 2024 00:31:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Dec 2024 00:31:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 24 Dec 2024 00:31:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 24 Dec 2024 00:31:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqIR6fneU+BXw4EX977qCgtmZ1VjqTpaSFNQHF1vDLnvkVSYflYRWyID462f+RZEdVHLuh5HPYYgUJNhkq58kq9ASLdynGbMTrE9rJkiHThmtbk5fF7ybYd3BR1eflvRsg/rLQ632DLtOdum74ZjlO+bDTDA8QlbomYvKiVEW490lpdKdakAzntrPLvxY3IzjZyvD5WhpoV77Cw1Hu92P4SgRgWyXhahYc2YKbG+Rz0HUAIpmotyvfV79a5ocNErQ0LaK6FNoS4epOpJTSkg9SBhSqSyD/Ea/kuUWwQ39wAKIN8P40PGLE9tz6IR+nwso1YqFIQJ+HLcxIOsXbxd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIjWgOmN9hYYYURhoOo2afqPHzBqu+glIUETykCSgKo=;
 b=aSAVNJBdsoIARAgrGm+YARCJLODZr8PbeAFqA7uSAE8E/zKsTUJuBYGC9+Qi2+It9PZncw/CKjxL5MI5oeLb2FI87I61hGIux1Ehk3MTdVxglhFPp3I6iY0Xjv23BXxhLtx+68QiMwD/sCraU+XgoWoNhvtPkW6BJ2Npukvel4gE+KO37NviKMpSh7Vaml+lhu0yAr2IaaQEQDqj8jC/YsSTyxaVZXfvTBtsNaFE+5rYnBbLBZjHcPFEmYc5/B/CZ96UVdYyyWMY/e+AhJVcKx1OPY+zDbw2NZcqkAblkNcUh07TlVxy6Zu07XEC1z5JINRGvwmQWbUgWMO1ImHtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 08:31:36 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 08:31:36 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kandpal, 
 Suraj" <suraj.kandpal@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
Thread-Topic: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
Thread-Index: AQHbRjOeUUbZzYfvkUm/AjZ4JktF0LLZeXcAgBuowEM=
Date: Tue, 24 Dec 2024 08:31:36 +0000
Message-ID: <SN6PR11MB2704C4588767DCA7E173E21CDB032@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
 <20241206171858.wtozqz4n2ntslj43@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241206171858.wtozqz4n2ntslj43@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|SN7PR11MB8025:EE_
x-ms-office365-filtering-correlation-id: 3f3afbe6-8b81-4082-7761-08dd23f5613a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?7+qbfAI33mt0oha9L+DmP+rsRu8D0xZ0mQo1t0f/DoVEm7CdiB0nxcz0l3?=
 =?iso-8859-1?Q?rYIRjSvYZAY3UUEONSDQRmzNAujfIrQiz+0jIlfyfnV5lfe1dnLZXP08Je?=
 =?iso-8859-1?Q?lNROyg0ca/ifWkZeux+LCvmR0mEVwQYXsoTKAo0KduOgEXZUeAYJlHtGeh?=
 =?iso-8859-1?Q?MtLGOzTb/aO+SrJ9QME6v1DF1d9AbVX2+OgGiK2OceosE0vIHChD6FRmNd?=
 =?iso-8859-1?Q?GhKP+DxU8JP6VnmrJbnxflXsThJWLKD5ujUtDyYEHqmTbtvoKrNNyP2WEX?=
 =?iso-8859-1?Q?9tSeFao1apVz+DwybOcWHBKPxVN8ot35XlAdevof19147jBezRZ9hYL5xM?=
 =?iso-8859-1?Q?BbO4uFVv0uu1BAJ08gIZh7sM02ntaTPOJEK4Df6wPY7A+US3oVteaEq96G?=
 =?iso-8859-1?Q?Afkq5p6td5hjj0YBrAX1x6zXPk6KcQNOUAZZu3SdtZZqOcEgFKYI8wQu9O?=
 =?iso-8859-1?Q?y2VQmufs0XLvn65lLicocpHGeDv6fMzTkjcmEKWDyWKPuLUrAdCLoTt0MK?=
 =?iso-8859-1?Q?k/aTNj/YeCY1WNO6X0Z3+Wi0JN30FMEmtr9+fAhku0XVUlo+LrJCa+hXPv?=
 =?iso-8859-1?Q?47OuykYFx8IsDH+TRHCdQENwcHvRzQi+MNTI2NwKYIYjbemE46Sirj6qzE?=
 =?iso-8859-1?Q?p0QghQNGlMtVuzLy4xovS1xq+1WOvxKzdwJuVataySaZvjc+InpeItOiXI?=
 =?iso-8859-1?Q?mjMW+2a+q7/SISjSzrAIRnoseZgZTSgpP3gt99Xd0Na7wXm+NzMO5q2jRs?=
 =?iso-8859-1?Q?pV232HBiw5uHy75fGnLrw/+PlbVN9SISEkn+cmOaqLe+m2FjaSsPyBn33H?=
 =?iso-8859-1?Q?7jGVPAGHJgUPaxckPENyHgvc5OlotbWSsfAsp31cjGK1zhHdfEL6NCcMt7?=
 =?iso-8859-1?Q?WF95i5OpZMB7GIuPSsMH6xbVbgN07U5AtfQqfydr6Z4UIj0mVf7DJJ2I8O?=
 =?iso-8859-1?Q?eoiX87udL+zj2E4LaYVYSw/g3u0IAPREA+5AqPLCTvLiOb0Lyd3MLQtzFH?=
 =?iso-8859-1?Q?HXX2nTh8Z90TitQ3Q5wFYWZDKPiA8HZ/Nw6x5EF1wdYFSvQE4opUXOotng?=
 =?iso-8859-1?Q?7SBZG8eAtp5xF4XcIJI1RxT8w2zqp7Wf2uEI9sFV/Lf1AAJkYtHfGK1iVD?=
 =?iso-8859-1?Q?DDeqvWO8YdQjwqr/48OkQV0yLLkcKizMs3fXvUGoSWrExsxeqcBTmUSft3?=
 =?iso-8859-1?Q?Jphh3OSuY2z4J0QHO4/GBJ4R1w5LjX48mQGz4DFvpbVmLOUuHNShXMRgGt?=
 =?iso-8859-1?Q?N9gghZiDXvpYIZsi08SWnKT6JPF4TjF47zJFx398ekwXQRvkPiNofzSrBf?=
 =?iso-8859-1?Q?JLuXYjDibpB925q2aIDvYx1XNy/iaeMKjPHg4FnoOwzPEnsFI87NiNlbPz?=
 =?iso-8859-1?Q?PAuXmXrLhIS9WWP4JB4O9y0vCXfyM9NjWfzXjj8xYbPoSgyt9B1w0wS53z?=
 =?iso-8859-1?Q?v969UFvXQOsW6SkSOFL528+QXKTGBoxvqz3scXIdIjm1+W63kRk9Qy2agG?=
 =?iso-8859-1?Q?Gy5fMWt5na+eE481t0fDJC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PdRbungSldJrVuUagoOPGTglF6oP6j74Ves2EBcFszFkJqhe03iLaLZnkY?=
 =?iso-8859-1?Q?gZrL8yoRqrVDJ0nKdg2YQlzTtr5f8nahqlhBtsYhOTZhpJa1pGcw1yUrWI?=
 =?iso-8859-1?Q?SZ5jg1smaBqnvnvS9CSX1WgSGWBTJ2+jdzsRnw/YkZmR0O0e1XvGfiWWBm?=
 =?iso-8859-1?Q?+ddosz9Ptj6cZpp6DOwPTrztZ0CYot5Tf5Ckx49raVa+4Y8X7Jka9puWev?=
 =?iso-8859-1?Q?ZM/OxW2jhtzQOATNgaCgoSvxHAYkIJUPrQYUmNhropq3X4TdUK2SUzpiAp?=
 =?iso-8859-1?Q?E9ioH8a4DzoOnudUKESyOtt3owwqtUZlDgxktDgoq85tD6sKv7WjcIqk3U?=
 =?iso-8859-1?Q?e2LhetJw8SVKeJ7LXAS0882SCnsPH0AYQiBKO9bCiYHq5loNgqg2EbbY2+?=
 =?iso-8859-1?Q?9JDs1pMU5Jx/0zbEQObTUM6fEc1E5k5pzt+qXz4bSSO8tuSMskM0xMG+Z9?=
 =?iso-8859-1?Q?sC8el1V3+DZ14Mu2ArB5IrKzMub+2xLxJPKJMRwXJB5duVcoOcxCzA/ACg?=
 =?iso-8859-1?Q?Yg58MW5ESsLg+JAyIaclAurzAuss5XC0AIkuPAP92pRgux6et7r4YK7Tg6?=
 =?iso-8859-1?Q?zc5sxLAy8QcHv9rtLsUNwgqn+yFCP0fhGqwvpQP1L0M33Zc546MI95IHxm?=
 =?iso-8859-1?Q?FNf+mbqEpaLJPdrOSP/C+hq/9aPhpLxBviymbsMhpxRQu9J0OXxd7UgQGL?=
 =?iso-8859-1?Q?A7HhozjBdlztT8p+LcjeHLO6Dfa2zW6e93EK+/2zpPBm4O0UV1QNvgWqla?=
 =?iso-8859-1?Q?LwMvXaElWFP77RH6m8TKH4kgxcE3+WS4EO08ALn4022fUFVcWQepOM3O6e?=
 =?iso-8859-1?Q?SVeYelRuZlLLFh9QTSRYkBANvUZZPxSKYyHSB6eRDXhBcerthM2fGMqA0Q?=
 =?iso-8859-1?Q?16+5/Bkn8w4263gJE8iACNSNVl1PNQreHfKug3/NRYRSa4F2hlUS5uDJmX?=
 =?iso-8859-1?Q?rYiJeg7OaEEtRbXkV7qo4mXN+sypzcDIRSQL5CcmDryE5YbQ1AsziYNIhA?=
 =?iso-8859-1?Q?ITWNSrwX0t44QoMGIAEO2uVqmHeg3ZIdNqoIQ0MBnmcXmEzVOnXIkFU5tg?=
 =?iso-8859-1?Q?hR5wYWPIq5Ez0G8IYacgdGzIKZPu1TfqqofNw+nZcNKzA0bFDpaN/77xSn?=
 =?iso-8859-1?Q?vbx54qp9/6+49Tmx3ZYrAdytA9UeA3Js+5/HdfMq5ckrm+OZFpEtCXeXPD?=
 =?iso-8859-1?Q?Hat/YlYWPoktehShmhk3ceXgmqvVrtaZWOF5POP4Tn4D7iO9msCqGgZzSH?=
 =?iso-8859-1?Q?FKEE/KGtHrlfQjhBTPySs2PM1Zlvc9B7rrhKiK5hEnlu/pmG7dKGzESrnf?=
 =?iso-8859-1?Q?3L5Z93K7aUSREMBDW4MTh1onwZNczp/usPoyZOqYhU3T358dm8c3y85wu4?=
 =?iso-8859-1?Q?Fyucf2mabIpgWlluFsq+HrLBZs7Knev+Ir+yBFoFAGBNY+mzkA/y7HkANx?=
 =?iso-8859-1?Q?gyevqr7vwLLtu0vLGEzDXT6l7eOUKcYJLbyFH2NQeiqcuauu3M+svIYwvo?=
 =?iso-8859-1?Q?MS/4s3RkLP9Ql1dfpAGPVi3HzPFh5S7auRfrSXYOq0ReeHWupK/WLVE5h5?=
 =?iso-8859-1?Q?b0Vtq67OojkglyM+W6bEE/H5lGTsg5JAvViSVcxdPP2aaMYaZTwlSU877d?=
 =?iso-8859-1?Q?EbbHfhfuLAArf1s4SqB27gte3RohRbMK3nf0su8VqC9OMxCK+0UuP5Zw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB2704C4588767DCA7E173E21CDB032SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3afbe6-8b81-4082-7761-08dd23f5613a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 08:31:36.1531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMVWoQ1IS6Gb13JK5aMDcTZXnIqjqeparxx1wPK35ttG7x6++39AItHEqju9rs+VHqRYHsZXCQ3QqRky6JAHTpoZpv8/2YNHRfQ70ijk/lLTfkvIknAkkUcrLgNvbfz/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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

--_000_SN6PR11MB2704C4588767DCA7E173E21CDB032SN6PR11MB2704namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Friday, December 6, 2024 10:48 PM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Kandpal,=
 Suraj <suraj.kandpal@intel.com>; Nautiyal, Ankit K <ankit.k.nautiyal@intel=
.com>; Thasleem, Mohammed <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool

Hi Santhosh,
On 2024-12-04 at 15:26:54 +0530, Santhosh Reddy Guddati wrote:
> Add a new HDCP tool for self-testing and easy deployment
> to client machines. This tool helps diagnose issues,
> determining whether the problem lies in the driver or user space.
>
> The current changes include tool skeleton and get hdcp info
> on the connected outputs.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build  |   1 +
>  2 files changed, 204 insertions(+)
>  create mode 100644 tools/intel_hdcp.c
>
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> new file mode 100644
> index 000000000..8c0258092
> --- /dev/null
> +++ b/tools/intel_hdcp.c
> @@ -0,0 +1,203 @@
> +/*
> + * Copyright =A9 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a

Use SPDX, see other recent C files.

> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * This tool designed to mimic an HDCP video player, capable of performi=
ng
> + * self-tests and easily deployable to client machines. This tool helps =
identify
> + * whether issues are rooted in the driver or user space.
> + *
> + */
> +
> +#include <stdio.h>
> +#include "igt.h"
> +#include <fcntl.h>

Sort alphabetically, first system headers, then igt so:

#include <fcntl.h>
#include <stdio.h>

#include "igt.h"

Btw are you sure to include igt.h here?

We need this to use the igt defintions here to stay consistent with the oth=
er tools in the igt_gpu_tools repository, We are using the igt_* functions =
in the existing tools like
Igt_dp_compliance, igt_reg etc.

Please let me know your thoughts or if my understanding is incorrect.
> +
> +#define MAX_HDCP_BUF_LEN     5000
> +
> +typedef struct data {
> +     int fd;
> +     igt_display_t display;
> +     struct igt_fb red, green;
> +     int height, width;
> +} data_t;
> +
> +
> +/* TODO: Implement the actual HDCP enabling logic here
> + * Steps:
> + * 1. Open the appropriate debugfs file for the connector.
> + * 2. Enable HDCP on the output using connector properties
> + *    IGT_CONNECTOR_CONTENT_PROTECTION and IGT_CONNECTOR_HDCP_CONTENT_TY=
PE.
> + * 3. Check the status to ensure HDCP is enabled.
> + */
> +static void enable_hdcp(void)
> +{
> +     igt_debug("TODO: Enable HDCP\n");

Tools is not a test, so maybe just fprintf(stderr, ...)

> +}
> +
> +/* TODO: Implement the actual HDCP disabling logic here */
> +static void disable_hdcp(void)
> +{
> +     igt_debug("TODO: Disable HDCP\n");

Same here.

> +}
> +
> +static bool sink_hdcp2_capable(data_t *data, igt_output_t *output)
> +{
> +     char buf[MAX_HDCP_BUF_LEN];
> +     int fd;
> +
> +     fd =3D igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);

You are using igt lib function here, make sure it will not assert.

> +     if (fd < 0)
> +             return false;
> +
> +     if (is_intel_device(data->fd))
> +             igt_debugfs_simple_read(fd, "i915_hdcp_sink_capability", bu=
f, sizeof(buf));

Same here, using igt lib function intended for tests
can bring an assert, it is no expected in a tool.



> +     else
> +             igt_debugfs_simple_read(fd, "hdcp_sink_capability", buf, si=
zeof(buf));

Same here.

> +
> +     close(fd);
> +
> +     igt_debug("Sink capability: %s\n", buf);
> +     return strstr(buf, "HDCP2.2");
> +}
> +
> +static bool sink_hdcp_capable(data_t *data, igt_output_t *output)
> +{
> +     char buf[MAX_HDCP_BUF_LEN];
> +     int fd;
> +
> +     fd =3D igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);

Same here.

> +     if (fd < 0)
> +             return false;
> +
> +     if (is_intel_device(data->fd))
> +             igt_debugfs_simple_read(fd, "i915_hdcp_sink_capability", bu=
f, sizeof(buf));

Same here.

> +     else
> +             igt_debugfs_simple_read(fd, "hdcp_sink_capability", buf, si=
zeof(buf));

Same here.

> +
> +     close(fd);
> +
> +     igt_debug("Sink capability: %s\n", buf);
> +     return strstr(buf, "HDCP1.4");
> +}
> +
> +static const char *get_hdcp_version(igt_output_t *output, data_t *data)
> +{
> +     if (sink_hdcp2_capable(data, output))
> +             return "HDCP 2.2";
> +     else if (sink_hdcp_capable(data, output))
> +             return "HDCP 1.4";
> +     else
> +             return "No HDCP support";
> +}
> +
> +static void get_hdcp_info(data_t *data)
> +{
> +     igt_output_t *output;
> +     igt_display_t *display =3D &data->display;
> +
> +     igt_info("\nHDCP Sink Information\n");
> +     for_each_connected_output(display, output) {
> +             igt_info("Output: %s\tHDCP Supported Version: %s\n",
> +                       igt_output_name(output), get_hdcp_version(output,=
 data));
> +     }
> +}
> +
> +static void print_usage(void)
> +{
> +     igt_info("Usage: intel_hdcp [OPTIONS]\n");

Same here, imho better just printf() here.
> +     igt_info("Options:\n");
> +     igt_info("-i,   --info          Get HDCP Information\n");
> +     igt_info("-e,   --enable        Enable HDCP on the output\n");
> +     igt_info("-d,   --disable       Disable HDCP on the specific output=
\n");
> +     igt_info("-h,   --help          Display this help message\n");
> +}
> +
> +static void create_frame_buffers(int fd, data_t *data)
> +{
> +     igt_output_t *output;
> +     drmModeModeInfo *mode;
> +     uint16_t width, height;
> +     igt_display_t *display =3D &data->display;
> +
> +     for_each_connected_output(display, output) {
> +             mode =3D igt_output_get_mode(output);
> +             igt_assert(mode);
> +
> +             width =3D mode->hdisplay;
> +             height =3D mode->vdisplay;
> +     }
> +
> +     data->width =3D width;
> +     data->height =3D height;
> +
> +     igt_create_color_fb(data->fd, width, height,
> +                         DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +                         1.f, 0.f, 0.f, &data->red);
> +     igt_create_color_fb(data->fd, width, height,
> +                         DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +                         0.f, 1.f, 0.f, &data->green);
> +}
> +
> +static void hdcp_init(data_t *data)
> +{
> +     data->fd =3D drm_open_driver_master(DRIVER_ANY);

Imho you should do an open yourself.

> +     if (data->fd < 0) {
> +             fprintf(stderr, "Failed to open DRM driver\n");
> +             exit(EXIT_FAILURE);
> +     }
> +     igt_display_require(&data->display, data->fd);

You are not in test, you cannot 'require' a display in a tool,
imho you should inform user that no displays were found and
just exit, no igt SKIPs.

We need this to use the igt defintions here to stay consistent with the oth=
er tools in the igt_gpu_tools repository, We are using the igt_* functions =
in the existing tools like
Igt_dp_compliance, igt_reg etc.


Regards,
Kamil

> +     igt_display_require_output(&data->display);
> +     create_frame_buffers(data->fd, data);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +     data_t data;
> +     int option;
> +     static const char optstr[] =3D "hied";
> +     struct option long_opts[] =3D {
> +             {"help",        no_argument,    NULL, 'h'},
> +             {"info",        no_argument,    NULL, 'i'},
> +             {"enable",      no_argument,    NULL, 'e'},
> +             {"disable",     no_argument,    NULL, 'd'},
> +             {NULL,          0,              NULL,  0 }
> +     };
> +
> +     hdcp_init(&data);
> +
> +     while ((option =3D getopt_long(argc, argv, optstr, long_opts, NULL)=
) !=3D -1) {
> +             switch (option) {
> +             case 'i':
> +                     get_hdcp_info(&data);
> +                     break;
> +             case 'e':
> +                     enable_hdcp();
> +                     break;
> +             case 'd':
> +                     disable_hdcp();
> +                     break;
> +             case 'h':
> +             default:
> +                     print_usage();
> +                     break;
> +             }
> +     }
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 48c9a4b50..8e24005eb 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -27,6 +27,7 @@ tools_progs =3D [
>        'intel_gpu_time',
>        'intel_gtt',
>        'intel_guc_logger',
> +     'intel_hdcp',
>        'intel_infoframes',
>        'intel_lid',
>        'intel_opregion_decode',
> --
> 2.34.1
>

--_000_SN6PR11MB2704C4588767DCA7E173E21CDB032SN6PR11MB2704namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Kamil,</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Kamil =
Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, December 6, 2024 10:48 PM<br>
<b>To:</b>&nbsp;Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.co=
m&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Kandpal, Suraj &lt;suraj.kandpal@intel.com&gt;; Nautiyal, Ankit K=
 &lt;ankit.k.nautiyal@intel.com&gt;; Thasleem, Mohammed &lt;mohammed.thasle=
em@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel=
_hdcp tool</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi Santhosh,<br>
On 2024-12-04 at 15:26:54 +0530, Santhosh Reddy Guddati wrote:<br>
&gt; Add a new HDCP tool for self-testing and easy deployment<br>
&gt; to client machines. This tool helps diagnose issues,<br>
&gt; determining whether the problem lies in the driver or user space.<br>
&gt;<br>
&gt; The current changes include tool skeleton and get hdcp info<br>
&gt; on the connected outputs.<br>
&gt;<br>
&gt; Signed-off-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel=
.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; tools/meson.build&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 204 insertions(+)<br>
&gt;&nbsp; create mode 100644 tools/intel_hdcp.c<br>
&gt;<br>
&gt; diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8c0258092<br>
&gt; --- /dev/null<br>
&gt; +++ b/tools/intel_hdcp.c<br>
&gt; @@ -0,0 +1,203 @@<br>
&gt; +/*<br>
&gt; + * Copyright =A9 2024 Intel Corporation<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
<br>
Use SPDX, see other recent C files.<br>
<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice (including t=
he next<br>
&gt; + * paragraph) shall be included in all copies or substantial portions=
 of the<br>
&gt; + * Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING<br>
&gt; + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R<br>
&gt; + * DEALINGS IN THE SOFTWARE.<br>
&gt; + *<br>
&gt; + * This tool designed to mimic an HDCP video player, capable of perfo=
rming<br>
&gt; + * self-tests and easily deployable to client machines. This tool hel=
ps identify<br>
&gt; + * whether issues are rooted in the driver or user space.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &lt;fcntl.h&gt;<br>
<br>
Sort alphabetically, first system headers, then igt so:<br>
<br>
#include &lt;fcntl.h&gt;<br>
#include &lt;stdio.h&gt;<br>
<br>
#include &quot;igt.h&quot;<br>
<br>
Btw are you sure to include igt.h here?</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">We need this to us=
e the igt defintions here to stay consistent with the other tools in the ig=
t_gpu_<span style=3D"color: rgb(0, 0, 0);">tools repository, We are using t=
he igt_* functions in the existing tools
 like&nbsp;</span></div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Igt_dp_compliance,=
 igt_reg etc.&nbsp;<br>
<br>
Please let me know your thoughts or if my understanding is incorrect.<br>
&gt; +<br>
&gt; +#define MAX_HDCP_BUF_LEN&nbsp;&nbsp;&nbsp;&nbsp; 5000<br>
&gt; +<br>
&gt; +typedef struct data {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb red, green;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int height, width;<br>
&gt; +} data_t;<br>
&gt; +<br>
&gt; +<br>
&gt; +/* TODO: Implement the actual HDCP enabling logic here<br>
&gt; + * Steps:<br>
&gt; + * 1. Open the appropriate debugfs file for the connector.<br>
&gt; + * 2. Enable HDCP on the output using connector properties<br>
&gt; + *&nbsp;&nbsp;&nbsp; IGT_CONNECTOR_CONTENT_PROTECTION and IGT_CONNECT=
OR_HDCP_CONTENT_TYPE.<br>
&gt; + * 3. Check the status to ensure HDCP is enabled.<br>
&gt; + */<br>
&gt; +static void enable_hdcp(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;TODO: Enable HDCP\n&quot;);<=
br>
<br>
Tools is not a test, so maybe just fprintf(stderr, ...)<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* TODO: Implement the actual HDCP disabling logic here */<br>
&gt; +static void disable_hdcp(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;TODO: Disable HDCP\n&quot;);=
<br>
<br>
Same here.<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool sink_hdcp2_capable(data_t *data, igt_output_t *output)<br=
>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char buf[MAX_HDCP_BUF_LEN];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_connector_dir(data-&gt;fd=
, output-&gt;name, O_RDONLY);<br>
<br>
You are using igt lib function here, make sure it will not assert.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (is_intel_device(data-&gt;fd))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debugfs_simple_read(fd, &quot;i915_hdcp_sink_capability&quot;, buf,=
 sizeof(buf));<br>
<br>
Same here, using igt lib function intended for tests<br>
can bring an assert, it is no expected in a tool.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debugfs_simple_read(fd, &quot;hdcp_sink_capability&quot;, buf, size=
of(buf));<br>
<br>
Same here.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Sink capability: %s\n&quot;,=
 buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return strstr(buf, &quot;HDCP2.2&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool sink_hdcp_capable(data_t *data, igt_output_t *output)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char buf[MAX_HDCP_BUF_LEN];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_connector_dir(data-&gt;fd=
, output-&gt;name, O_RDONLY);<br>
<br>
Same here.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (is_intel_device(data-&gt;fd))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debugfs_simple_read(fd, &quot;i915_hdcp_sink_capability&quot;, buf,=
 sizeof(buf));<br>
<br>
Same here.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debugfs_simple_read(fd, &quot;hdcp_sink_capability&quot;, buf, size=
of(buf));<br>
<br>
Same here.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Sink capability: %s\n&quot;,=
 buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return strstr(buf, &quot;HDCP1.4&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const char *get_hdcp_version(igt_output_t *output, data_t *dat=
a)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (sink_hdcp2_capable(data, output))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return &quot;HDCP 2.2&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (sink_hdcp_capable(data, output))<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return &quot;HDCP 1.4&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return &quot;No HDCP support&quot;;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void get_hdcp_info(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;\nHDCP Sink Information\n&quo=
t;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_connected_output(display, output) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Output: %s\tHDCP Supported Version: %s\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_=
name(output), get_hdcp_version(output, data));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void print_usage(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Usage: intel_hdcp [OPTIONS]\n=
&quot;);<br>
<br>
Same here, imho better just printf() here.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Options:\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;-i,&nbsp;&nbsp; --info&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Get HDCP Information\n&quot=
;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;-e,&nbsp;&nbsp; --enable&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enable HDCP on the output\n&quot;);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;-d,&nbsp;&nbsp; --disable&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Disable HDCP on the specific output\n&quot=
;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;-h,&nbsp;&nbsp; --help&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Display this help message\n=
&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void create_frame_buffers(int fd, data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint16_t width, height;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_connected_output(display, output) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mode =3D igt_output_get_mode(output);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(mode);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; width =3D mode-&gt;hdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; height =3D mode-&gt;vdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;width =3D width;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;height =3D height;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;fd, width, heig=
ht,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1.f, 0.f, 0.f, &amp;data-&gt;red);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;fd, width, heig=
ht,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.f, 1.f, 0.f, &amp;data-&gt;green);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void hdcp_init(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;fd =3D drm_open_driver_master(DRIVE=
R_ANY);<br>
<br>
Imho you should do an open yourself.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (data-&gt;fd &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fprintf(stderr, &quot;Failed to open DRM driver\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_require(&amp;data-&gt;display, d=
ata-&gt;fd);<br>
<br>
You are not in test, you cannot 'require' a display in a tool,<br>
imho you should inform user that no displays were found and<br>
just exit, no igt SKIPs.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: &quot;Segoe UI Web (West European)&quot;, &quot;S=
egoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica N=
eue&quot;, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
We need this to use the igt defintions here to stay consistent with the oth=
er tools in the igt_gpu_tools repository, We are using the igt_* functions =
in the existing tools like&nbsp;</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-sys=
tem, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Igt_dp_compliance, igt_reg etc.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
Regards,<br>
Kamil<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_require_output(&amp;data-&gt;dis=
play);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; create_frame_buffers(data-&gt;fd, data);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int main(int argc, char **argv)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data_t data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int option;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static const char optstr[] =3D &quot;hied&qu=
ot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct option long_opts[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {&quot;help&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no_argumen=
t,&nbsp;&nbsp;&nbsp; NULL, 'h'},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {&quot;info&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no_argumen=
t,&nbsp;&nbsp;&nbsp; NULL, 'i'},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {&quot;enable&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no_argument,&nbsp;&n=
bsp;&nbsp; NULL, 'e'},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {&quot;disable&quot;,&nbsp;&nbsp;&nbsp;&nbsp; no_argument,&nbsp;&nbsp;&=
nbsp; NULL, 'd'},<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {NULL,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL=
,&nbsp; 0 }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; hdcp_init(&amp;data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; while ((option =3D getopt_long(argc, argv, o=
ptstr, long_opts, NULL)) !=3D -1) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; switch (option) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 'i':<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_hdcp_info(&amp;data=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 'e':<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enable_hdcp();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 'd':<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disable_hdcp();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case 'h':<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print_usage();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tools/meson.build b/tools/meson.build<br>
&gt; index 48c9a4b50..8e24005eb 100644<br>
&gt; --- a/tools/meson.build<br>
&gt; +++ b/tools/meson.build<br>
&gt; @@ -27,6 +27,7 @@ tools_progs =3D [<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'intel_gpu_time',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'intel_gtt',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'intel_guc_logger',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; 'intel_hdcp',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'intel_infoframes',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'intel_lid',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'intel_opregion_decode',<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;</div>
</body>
</html>

--_000_SN6PR11MB2704C4588767DCA7E173E21CDB032SN6PR11MB2704namp_--
