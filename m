Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A86C0218A
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 16:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CD810E583;
	Mon, 27 Jan 2025 16:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPuHzdyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BA310E583
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737995378; x=1769531378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RcD9SVQe0aVaTiQ9bbgYFA9Nd44CO3WI0l/BO16yYHg=;
 b=TPuHzdyYlmG/mS5w8SU5pNG5spgONdb0gWsGUzUFXO5ZC3P/HvAqF+hc
 HJw9qOJLef2YhAmZXdCd22HgTgoIz5vu7T+T4igsGxwzFIo5/g3BVjmbj
 H6GUlIs2pGUzmH/cvFqYRZ/0cN1owOPDOPW0FWN621f/fjNDEcO+4dYQR
 Y88uf3Zfe/EzuA+bZuu8Dbb2+dXf90Qfrfv68ggl08xbWnjSfSnOS0Bwl
 InwFaYXQrH0dSFZAqZGNgBIyOpwtATl/ooRzFyin5R4P1vvSXr2S2y5R+
 ESxDnrHcX0FhwBBPIo0aZpDOCS+J0mIMGsFaaaFGrfFdVRDqlBqJhWU9/ g==;
X-CSE-ConnectionGUID: s0gG2BZUQ6aUBiBo99to1Q==
X-CSE-MsgGUID: IDHX5ZinSMmNcvhZqdobEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42218538"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="42218538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:29:37 -0800
X-CSE-ConnectionGUID: j9NyshioSXm/52I1SKyODA==
X-CSE-MsgGUID: +w+lhrhzQTOyCyQNV2tAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131773593"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 08:29:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 08:29:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 08:29:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 08:29:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpqd5UdP/rOCYtFBWyqA79seKEfdQolzvWNlQ1exChCtNYbWNcptssqMOat9KH7hJuZ2pxL3ZREKrIySZMTK4mYvGf6pfzho10Jj/iRnGu71ydp5c7aKNyURYdU1VJZxG2YqMf53uQW/hxU7cBAmHAnt41WfOsYYq1GNBWU/H8YmOTRpD9mzZZ4AXhrqP3Y5DcY8BlRpnZnA4FLIyEe9Qpule6q7qbIqFTHcYZCWwj0S1kFlBu9hwkLmJ8+qbznCSy+9Vcj6tHN4WTiISTpO7PFf6cEYNp6sa4mcmX8M/oixiVCs29dZAI6tLTcrpJFfuH1b90RSr2tZevDAfG7bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d71RORwtOR2e1U6Te/W4AKfznGyvfyf+ziVF6U8L6Q=;
 b=See5NwWkg0DIkWXykCvwQAwqD2T+ksrSBVvHc5vTHLitkderGpfv2YyUnuABlTbZwJKY+bAws8wPb3Us9B2POB6Z/Y5DTyBNY7kwAVqJA/Chu3Q5cpPD1Tz3FsDf6aWC+VD+iJUjzJbwXB/B2J+D6o1Q6KH6IWCVdbtl/RWaK9+PmGsSxC08sgYHxDIJQFUNOsBGg0t6wx0+2fvPXoEfBMoHmD0KQDi3+bhTPwd5HdG1l8hD4WXGzJPNzD6XMyB6ANIVhKvSKoZOAdsXVuQ3QtjMBNzBgWfZEvw6uWqgtjeYNhsNxqJ4C16gcy5JhLy3cFOWaZbigu2Y53eCyisdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Mon, 27 Jan
 2025 16:28:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:28:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "stylon.wang@amd.com" <stylon.wang@amd.com>, "Rodrigo.Siqueira@amd.com"
 <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "gregory.f.germano@intel.com"
 <gregory.f.germano@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Index: AQHba/flKYRPA+IScEW6+oL/GckHJbMi7rcwgAeUDoCAAEvhIA==
Date: Mon, 27 Jan 2025 16:28:51 +0000
Message-ID: <CH0PR11MB544488333FEA1A748EC6449BE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250121112944.115491-2-peter.senna@linux.intel.com>
 <CH0PR11MB54448F91732885E4871ECEF2E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
 <5b250520-3043-4b0c-9555-b613d7f99ffa@linux.intel.com>
In-Reply-To: <5b250520-3043-4b0c-9555-b613d7f99ffa@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB4983:EE_
x-ms-office365-filtering-correlation-id: 8ca22dc5-d7bd-4da2-65a4-08dd3eefaf74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cmDcaZyFYaDDD+XB9W1FljLJI+k7wqVgYu83XwKlEEQw0pQTmv7BuCDAtRaM?=
 =?us-ascii?Q?L1du9kO5rcQWspqjH8J4eez3qLJNQKvO2bLzXu0GBLSzwtgiuyMyL30gxdqB?=
 =?us-ascii?Q?hNGg+M6Jx4sQKj9B0eniq3n4l1we6Iva6/XkfyioAYuDFjEGl7JkZ/UNb03g?=
 =?us-ascii?Q?U+y1gwrE9o595Ie+A4DNhy2es0jug5dV5do/Bhd8PpMB8TfUWxiKs4xN6x+Z?=
 =?us-ascii?Q?HLvOo7NgBGewx3uMHpqYW73NVaLttSCuUsrVZoO1drTOHCB+MOYbYeHs4ios?=
 =?us-ascii?Q?j+qmNK+gI+3JgRkeFKOYPE/G9YKgpSXJpYoga140ebHMtOY5Qq+x8ayDTK6y?=
 =?us-ascii?Q?tWZZBuxL/28F8ViZzSla6FuDeHTJEHEFp/4w5mKcni35x0F/tU/G+bZjHJ39?=
 =?us-ascii?Q?hIYPHDjrCuz30aiBKZy7MUlUBfJr4Aa5RavdsX6+5nQ6PclnOegTtSh1mP7z?=
 =?us-ascii?Q?6KRyvtvB3WY6waJ+pFS1HW4QX3VUHT7c5rmxRnNMZXWXg68EvPPX3AWu7QzZ?=
 =?us-ascii?Q?tEKgn3I5r/NVa9KrFkCe0wsoAoYdQVGGflX/AhK/NEH+Ky5MgnJ+NqEa1lai?=
 =?us-ascii?Q?e8m5qbuMrp/ezHrnPhp9b8AUgWtGDpDDkzpik9zbaKxPTOzVQAQp0kQiDtXp?=
 =?us-ascii?Q?AQZQjiY+6y+V3bipD1mMYwYCu0HnzrHN2KVvdSfMGI6C/pI9pw5bixvRS0aV?=
 =?us-ascii?Q?F/B7by4nOXIGrBOjgS83xft8n0kXnmKylrO1iDbtYvmNW94EiBQ2HU4JNYf4?=
 =?us-ascii?Q?6YOxZ+uNQTe2hGdFnBK1zZN4xH//+AIAfmmZfwjx/RY6m4769eKyXMe/DAZj?=
 =?us-ascii?Q?coyAnstEMYm3XTYWpiO1eUcGgynak+uK2Pb61pB/BHRTcZU0w5LgQTusI/qM?=
 =?us-ascii?Q?deYHUpl96ltHfz8P9sWJ8tjf2lWEBtX8SB3vidrmyB2asBCDSUMkBQTmcyJZ?=
 =?us-ascii?Q?22HIjJryVUYiJF12m5KdjLNrdLmDZJB8mGA9sQCXcWcrIcLMJq+yFnLT0c2O?=
 =?us-ascii?Q?TSpXsQFZdwba7ozd3KpB+YPp5cr/HCD0xcVSFWIeIbLA76g8nrF+YQg79yHK?=
 =?us-ascii?Q?pRTqmvKIoj3uMuRd8sLg1GmKpbzJwZu7HbHvmP4/smOcleQnCUvOcTSlNRNq?=
 =?us-ascii?Q?4/82Ofs5z54aZTcP1UOJc0lrviwD7QeLLLYd4CvCJeHStq3ofwetKlW/MnaE?=
 =?us-ascii?Q?z/UajcxHQW9mMZmKVOJhM+K/EXVJmFeYBRalUbBTVgDwxjmHik5zrLU+tb0R?=
 =?us-ascii?Q?XLHb7MKvpKKovwma1AGSSXIWG5GPOCOSTsJIiAnJSXKPhwZKg77oG/SN8eFH?=
 =?us-ascii?Q?tUqeZO/wcHL8iIfUfretxN4ddA58CCYNf1rnxoZ+Vc+Xmvu9kmRZB6UgyeML?=
 =?us-ascii?Q?axInwKLWNITA0CEHYB0V3iYJsWpCB4ictIGplP3PNJgh/xvRjduhsXxXElN2?=
 =?us-ascii?Q?s2MbGkwjBGd8au8xj8fyUh5KS74wAymM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ay6wczU98X60PYOpCPjQcFxXl6a8QO56ZGkHsn9ULXeFiIJvl+hLyG6Q4OgQ?=
 =?us-ascii?Q?ocm5nPHDoFI5u1e/pZuS8UhU22ssXEw2hb4/f6q5GelDk4e0vjJK4e9EYEt2?=
 =?us-ascii?Q?VDpITUplni9ogsAl+kbAUfdsgRexAR7rXFfZlArwE+y/k2ytttNyJ5gttlq8?=
 =?us-ascii?Q?tVKqb5Ko3NCrXz7Ha26+sDFp0Fp3pDHeB5qe4gKFSwfCTEkz452mVGh9Z3Qo?=
 =?us-ascii?Q?TMDdj5kaQZxzuLIIcGrpIPFKMBXJma2/Chza9QEkx4oCFOUmTdearpj812va?=
 =?us-ascii?Q?6wHAPZpJxmlSc1jxpWYz3rtImci7ucOTMJmNBK4eIw06O3yJ+MbhU0bzp3gv?=
 =?us-ascii?Q?P5HCyRQQoa9Ed8iDam9XOyV7TCKAwFjRWNXNaiwMaiPEwfrLlc9p6gVbMozd?=
 =?us-ascii?Q?Q1xBeq9INf+SLkKE3j6MxY0CIYpIu/MQrHSfBZVxo6MtOKhj5g5z02nX0Kkg?=
 =?us-ascii?Q?9NY5FA7QXA/3LtHYAwSoJGocTv/DoXCtb+SJu83Faig4J71ECFyPUAuFNxLu?=
 =?us-ascii?Q?cVqFLjEFfVBgMDly6OjSYlGYxq855vHWZ9gn6InIfv5iXHXiBTfotWO4nCfh?=
 =?us-ascii?Q?Qb6T6RI2ghyumbAUo1zFrUnJljWQZkN+C6x/5FEArKfDDmkxerUpTBk1sj0r?=
 =?us-ascii?Q?sJWBp6YlGkUYFTNegTtkFtlUSBbm05BHCaKP25y+XoYzGTm18QvqBED+A8DK?=
 =?us-ascii?Q?7fj8G+tBB2+Gs9lguO5ItcynMrGCIunjr234bobRk9yjSwpHQHBJMYgmP3NP?=
 =?us-ascii?Q?SrBxihemPsZ1ovcRxMZj5sLLHUIs94Kq61bz888vDbw28VUMpXu5+W+H2RN5?=
 =?us-ascii?Q?VbOp9OD7GHpG03S2SmtGSwZSsZ6Lz2PppNLu57Wn0WGjb57MXdkCVWP695G2?=
 =?us-ascii?Q?9iiORKeo/hciMBtvggKlFqXOtgJmKvVaSVS/qKIe4/h9CYhmQzYrJ1whXFB3?=
 =?us-ascii?Q?DkE+xbh+yNDkIxzDbzPacTtM3i8fvWMe4D1IhPpu5L0Kd/aMsCb1v8/3V+hK?=
 =?us-ascii?Q?gzvCepH27Fix2SuwYUg1ImNJDXOu9uGUQckBWR4dQGPV4ce15mivBYG6eLNb?=
 =?us-ascii?Q?5K1A5cKbw07PXk+xJ/ewgZPonAtWe+AR4a3IoxuguDq6xVFtHDlftu5KbMkL?=
 =?us-ascii?Q?//6XUrTsi6Wqpckll+tnATX0ZnDWgzRcIINdYbqzECrjD76D+7TToBAtFgKd?=
 =?us-ascii?Q?HskaC4vU2KEztRTRPa6wf0KbkuiOy2ysl6pRWpz4wVdoO9P7hgnyVeolxCue?=
 =?us-ascii?Q?Ja6flCsycC+eEzQRKl8IB2htbgeeugI5+C20kSflpbtm+mElXbmxdxpJYZoK?=
 =?us-ascii?Q?I7Dumi5inighvRTl0xLVDtnLawppgPd/j+rxek3qPooOFFfMMineMWaA0vZM?=
 =?us-ascii?Q?+xAn4qskXQAuwoxp1s7ZP7YafY/bplxYMiKLYRqKvnLLBf/xXUtODoouOfPp?=
 =?us-ascii?Q?sQ5PthfEFLt25PSHLdVca6XktgHOCbIIvAO4VVhmAfWVOsUxmNCbhAbcuSOx?=
 =?us-ascii?Q?DgxTTQ/FpH3iQfiIVfprjJdLUIpAXa3trshzDl5HEpmRO+xUV9cfmj+UKNgx?=
 =?us-ascii?Q?IgDOw8sb+jkcDLxGH1Z82kAQeToe6SmdBA60j/q7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca22dc5-d7bd-4da2-65a4-08dd3eefaf74
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 16:28:51.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewHQ4DZ+L5dcGYMBEiFZrKeorfcPJcXH/v8+7vFxptC/XiumHzbQXNODEwj5iGz/EUNOuGnc16s5Jpbif3ga7gXP8lTYR9GvgsZiqaTxSm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

-----Original Message-----
From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
Sent: Monday, January 27, 2025 3:20 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop=
.org
Cc: stylon.wang@amd.com; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadev=
i.gandi@intel.com>; Knop, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sa=
meer <sameer.lattannavar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel=
.com>; Saarinen, Jani <jani.saarinen@intel.com>; Piecielska, Katarzyna <kat=
arzyna.piecielska@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>;=
 gregory.f.germano@intel.com; Taylor, Clinton A <clinton.a.taylor@intel.com=
>; Yu, Jianshui <jianshui.yu@intel.com>; Vivekanandan, Balasubramani <balas=
ubramani.vivekanandan@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with k=
memleak
>=20
> Hi Jonathan,
>=20
> I sent v2 that took care of all but one of your comments here. Please see=
 below.
>=20
> On 22.01.2025 18:09, Cavitt, Jonathan wrote:
> > I left some notes below, though there are only two required changes:
> > 1. Move fclose in igt_kmemleak_found_leaks to after the conditional lse=
ek to
> >     avoid undefined behavior.
>=20
> Thank you for that. Fixed on v2.
>=20
> > 2. Pass igt_kmemleak_sync as a function variable to igt_kmemleak instea=
d
> >     of keeping it stored as a global variable initialized during igt_km=
emelak_init.
>=20
> Fixed on v2 as well.
>=20
> > Once those are fixed:
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >=20
> > -----Original Message-----
> > From: Peter Senna Tschudin <peter.senna@linux.intel.com>=20
> > Sent: Tuesday, January 21, 2025 3:30 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; stylon.wang@amd=
.com; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>;=
 Knop, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattan=
navar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Ja=
ni <jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@i=
ntel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; gregory.f.germano@=
intel.com; Taylor, Clinton A <clinton.a.taylor@intel.com>; Yu, Jianshui <ji=
anshui.yu@intel.com>; Vivekanandan, Balasubramani <balasubramani.vivekanand=
an@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Subject: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with k=
memleak

[...]

> >> +{
> >> +	/* Scan to collect results */
> >> +	if (igt_kmemleak_scan())
> >=20
> > NIT:
> > Should this function also fail if igt_kmemleak_scan fails?  AFAICT,
> > igt_kmemleak_scan fails in one of two cases:
> >=20
> > 1. Error when sending command.  This should probably result in a failur=
e
> > because an error has occurred.
> > 2. No leaks found.  Assuming we're expecting to find leaks, this should
> > probably also constitute a failure.
> >=20
> > Though in the case where only one of the two above causes issues, maybe
> > we should add return values to igt_kmemleak_scan?  Perhaps 0 on success=
,
> > -EBUSY for a write failure, and -EIO if no leaks are found?  I'm just c=
hoosing
> > some arbitrary error values here; these aren't set in stone.
>=20
> This is the one I did not act upon. First we do not want igt_runner to cr=
ash or
> abort if something goes wrong with kmemleak. So we don't really need the =
extra
> details about the error. Currently if the call to igt_kmemleak_init() fai=
ls, it
> will disable kmemleaks on the runner. My take was that errors detected on
> igt_kmemleak() would either mean that the system is in a really bad shape=
 or
> that something unimportant happend. Either way nothing to worry about.
>=20
> Second, we actually expect that no mem leaks will be found on the vast ma=
jority
> of calls. It took me hundreds of attempts to learn how to trigger one rel=
iably,
> and with xe tests it happens but not that often.
>=20
> So I left this as is for now. Please let me know if any of this is nonsen=
sical.

That makes sense.  If we're expecting to not see any kmemleak logs in the g=
eneral case,
then failing on not finding the logs would be bad.  And if igt_kmemleak_cmd=
 fails, that
probably means one of two things:
1. kmemleaks was disabled on the system
2. The system was broken in some unrelated way
Blocking on the former doesn't make sense, and the latter should've been ca=
ught by the
system or tests earlier in execution.

I mean, we probably still want to report in the "unrelated system break" ca=
se since we
(unfortunately) can't make any assertions on whether or not the system brea=
k has
already been reported.  And if we wanted to do something like that, we'd li=
kely need
to check that kmemleak has been enabled separately before running the scan =
here.
However, given the explanation that was provided, this is just a possible s=
uggestion
and not something I'm particularly adamant about.
-Jonathan Cavitt

>=20
> >=20
> >> +		if (!igt_kmemleak_append_to(last_test, resdirfd, kmemleak_each))
> >> +			return false;
> >> +
> >> +	if (kmemleak_each)
> >> +		igt_kmemleak_clear();
> >> +
> >> +	return true;
> >> +}

[...]

> >> --=20
> >> 2.34.1
> >>
> >>
>=20
>=20
