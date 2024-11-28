Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD737D690F2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 10:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4F910E0A0;
	Thu, 28 Nov 2024 10:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXQy9Hui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FDB10E0A0;
 Thu, 28 Nov 2024 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732789542; x=1764325542;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VSeMh5T/KrNfQToDzpv+vCUyuqyOOtelcPpKc2SfadM=;
 b=FXQy9HuiyD6HnHV9qARnksnLXFG9KqgL1EWhUayrb8QvXEHv66lDo4l/
 sVCHcpPr4g+9FD3Kt4K3rZXciFOyocjjETe722OUA1ZkdUJM+lrYUc4Uk
 iqc6L7FiIUrHAE5kSdDKmrOz+Y8uQQRUDGQr4nI0uZxAALWV+LmsGD/mt
 0c93CFErLj0zk0Csk5FFHUzWLaB6lEybzCtAIc3wwa9yMKg3UchJy8bma
 9Sq2Zz4bQzobJw6luk/eID/CQjNjcEKpcSh7oRas+VlupxCi/DToIalH/
 cbgJbA5mywadFMv0XH7q1yXwR0dFziT7+2f62B59JYfSGv9qQGT752KLW g==;
X-CSE-ConnectionGUID: VZxux7PBS42nLAwvNPlnsg==
X-CSE-MsgGUID: AlaKIpeCS5y2ZG9jSi6Wrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="35879001"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208,217";a="35879001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 02:25:42 -0800
X-CSE-ConnectionGUID: wVda9peAR9qrjnMmlcT0DA==
X-CSE-MsgGUID: CWl1WT8IRTazpNXY4w4h5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208,217";a="92298967"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 02:25:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 02:25:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 02:25:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 02:25:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGcIzHn9aAXbNPRqZJypPDTocLRLbhCOlt7blEHSIyl1VpOw6uyJXFV0mWe2RcbT8sNp4onqoVhATF/uIPrEPzOmsMIAkwMcRs2zhwj3BZ4pfdw5zZeNfvlpYsOJJqNRngvDS3Xb2xS/nu0/3ueDfY/8cGzCJOdiqt1kntBEwPToF9fzUgHZkCTZ+L3Oh/zgxF+vjvsjBdhAah+e3Mbzlyuf8SOCnKtE7ZuWO23pu3YzIk1adDGnWUw3ckdaLOl3QP0Rc8nDhX+MefMClE4t6Oj0yV6u0F4BzTlPzAi/y1PKBS4voyNISj4pf/Ess2lPjA3P8DWYNv4tuImXQWCDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNhmTkTg1f2/GmlHOAZbMTlU4S6Zqmoat0P4+gHBSww=;
 b=HCyYri+iLUyYaGwtAaSTTKXqMgMZuyglQ50jVudmquYFvjUmqms+34oyAbWGBhAZht7MApoBIZw3IRY1SD17snhGwBwWIgeM84td6dll/MkTViHXZcW5K+V7aqazemexwP8iS//Au8O/uj+rGDQ0iQiSjr9G2bhH5L04g9JRG87CdADPJ8IwuS6UkJGqr+P/fxu2rlzqcN3RdXmWwYUDP64CcPEM38nuJF4ITsoGG462x2vVYx2eJvpurS63glllTF8dCbjv0NfkjINKvSS204l9hha2W4PmtCCZBWgxZWtXwTd3myLm9yAMIsoGZvtfj8wZ45ykrVU4mMtvf14Jhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 10:25:36 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%2]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 10:25:36 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>
Subject: Regarding CI failures not related to patch 
Thread-Topic: Regarding CI failures not related to patch 
Thread-Index: AdtBfkb7fBPxTQrfQH+NrYUddFJIIA==
Date: Thu, 28 Nov 2024 10:25:36 +0000
Message-ID: <SN7PR11MB74892734BC8E144BF7602F2285292@SN7PR11MB7489.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|PH7PR11MB6674:EE_
x-ms-office365-filtering-correlation-id: 254ed0c5-14ef-489f-aa90-08dd0f96ffaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qRVurmY0Hvbn7/1tKz7bS/cqUZCHFYFn2JCgj1NCeDwZlbK+QerreOggYu2T?=
 =?us-ascii?Q?bEzyYJAUlkADRTnG4bvD61moxdlrQxk+or+G9OkXxND4VjLZ2tFMFZfpHy+B?=
 =?us-ascii?Q?WGNP/6NZoGq7/idp0X9/CTlX1tVcxdFSGeBQK/1lcWjzzZura9j+sZHfsUA9?=
 =?us-ascii?Q?y3nrjxnt+VRMwPe5RaLnqAIt1xIVeUaV1lzwnjABv/uomfJAn0VG6fBAXB1k?=
 =?us-ascii?Q?wsFkYasW/5T1o9OUhf2wGYaCecewGQPbjZX45q5zn2pjo/ctS8Ay4x+hO/c1?=
 =?us-ascii?Q?b7UqqLOKepg+SeH3bbH+xhtj2vtFABxIO3tdcduxCoPARG8t5oHIvln9WoKt?=
 =?us-ascii?Q?1wDKrbsM3o5fvcwo70eZIgx/Z+AWyVKohwTzKkEzNGM0KUNNTY1YZKJjZosp?=
 =?us-ascii?Q?Deb6sn6Jf37NFaJOzeRv8f/2WI7pWW79MO7JmPGvCAMzIL20LEILcZCT2NXP?=
 =?us-ascii?Q?V2GC8rHEF/LNjyu3Bfwo0XbWxMT8X+kPP4nDhpa9bMRh3Hp/sFaktxsTC50o?=
 =?us-ascii?Q?z9vV9OrvtA+ixyf8Bu5KgEYKZHvw/eUA7VRDx2aivP9b0D+8HdKKDd5AJH/W?=
 =?us-ascii?Q?Itzvdk2KOdHtyC3dhfYsdPYDRLsKGFRcu62DP0eJnpr0I+VyQiLWmTfMHwDi?=
 =?us-ascii?Q?FuXFtKKvNiLUpa4Z+ekH4y4vh/pyftdSa//gqtcc/GU/D9umBFYHsTnivEKn?=
 =?us-ascii?Q?mdnSHABjCoZGC64mAkFmb9Wk74rvNvA00rvTOQwvRVT8CcMMat2Ls7MPYs3k?=
 =?us-ascii?Q?Z+kRpI3HT544ywFYamo/Ipq2Gst0xSJn909u7eoEg/zvXBeVqWF94ZbcjSbe?=
 =?us-ascii?Q?sHpCyCxD/L+t4daPjHZThuL463cjpfwRkNcE3Tg0nXgpFv3v8QXNx7f3B1Sm?=
 =?us-ascii?Q?WV2vacLw+inA2lbE22QNCPpEBuOME7ww2lmJfjGEtOpoNIyU3F5X8NqfNFRG?=
 =?us-ascii?Q?cQqoWSlNUYv1RBqAPPSBbNw9WONp8C0PDCWQrP9kKQU3rnaXgCH5SGMaDq5E?=
 =?us-ascii?Q?GMJqDBDeINDTuPHfPT670EDSi9Sfzf/+0t23fwALQ4gsYQzpGfk1HnM+fVcY?=
 =?us-ascii?Q?uMNQNETxITvtLwTXFPhAy2Upt8nXTGPrAC0/jgLk7o1TRuC3OX/lu/3XlaA9?=
 =?us-ascii?Q?XVGzmLOBLbSZlocjELVwywdRUznqA8kxbSkXdOz6PrNv1MOb56cG4yeZxTwZ?=
 =?us-ascii?Q?7+jAN1hAJYDrq/3oZT8raV1hxTjnXD9qjP/mxhHwNe0vwY+LKjiXz8TuKmg4?=
 =?us-ascii?Q?+TiD7jI70iNH0fnDRWeZYihaX/iRu9Cm6jHI0J3fhv4fbKndLIbfjijd/GjH?=
 =?us-ascii?Q?2/0NBWXTbQgNEcfhVuYdAA1h6/q7AxGpsQ71DtKq5qK8bt185Ng9kRFguiiq?=
 =?us-ascii?Q?yDhxVOo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2YW234mBEyQIyXJVJ8y6xP8HnIKh39hXCZBPqQ+dfFj07axMQXj9xiRq/JpI?=
 =?us-ascii?Q?ATXYpagLKCRMuS1YXR277HqA1aKq2/rWty6E89Nh/nd7hjr8Sm09GRoH9PHa?=
 =?us-ascii?Q?OYjMTagd04+ptm9YEoSYgR1n0E+jN3+XfPxAcrbLueplfjlZ84fZeMYwb28d?=
 =?us-ascii?Q?Wo2peRwH4tj4hCWUPP0RtrdVSkorxzTObpRr51EXPbUJETJh0zQuyVd1ZKqU?=
 =?us-ascii?Q?FJt+BrfgofG94ys0q4IIO4QtfTku30YpVw10ZbxeO3F0LhnUAhso5cBZdsYC?=
 =?us-ascii?Q?26wdbrC5JBQXV9tmt7dtlGC407/CU7nrLcc+vhQsgSBOzKO72RajQAz7EhNe?=
 =?us-ascii?Q?CjcWze7Nx1pbjUTz3ECCv0O5H0qAe61DySit5fAYZThe10N2KTwdWckFv+l/?=
 =?us-ascii?Q?DVCZgldlYSUCoajUElcCxSdcb29ha7l1RptOvD35u96/LEpZcwfLNrmB0F/c?=
 =?us-ascii?Q?Dc/IkYtOuqfsU7deS0kkGN5VIeiYuSdiWmyntS3uAsvVgsxTkLBSKFwwhgsl?=
 =?us-ascii?Q?50L34e60nn/c6f8x9qbKFG1QL0x67iZqOhWs+8LZB0uUXUfpxYhqYHfgGOwy?=
 =?us-ascii?Q?EOx7OjQNEjkfQuErRq5TasPHGqcNta100ozorD6bs0d6RfPquBbZRZAKYnFs?=
 =?us-ascii?Q?iT7ANkHQ/dcF/mWPNHodvQORk2K2mTr6ERoU0tBL4YR1zmkgOqc6BG/2RnCK?=
 =?us-ascii?Q?rix0maZwLr3qDf5B5JDQGtNdUOlq99eKEEcars22SLcC4i88+swkOyQ0UJAL?=
 =?us-ascii?Q?BnpYJU/WhWuA/wPUzv5HZhAjXPn8Ld4nXiVE+tjNMkns8+AqgbUJ/ZEm8dw4?=
 =?us-ascii?Q?bBeQfbIune5JdoljCH3ev5FWpJI++S1T2RqkNZtpYRFUd54ncmsZ0oSUJYsn?=
 =?us-ascii?Q?XUcVp8FGLOqxnfKzph0CbTaiOBJsscsJQlFFk0MWsSreaSAX7hamo6nKPLL7?=
 =?us-ascii?Q?/hsOi5GIuQI8N/Kk/f6JgwlDQi2cXNqu62eK1t6OHf6QdIMVafnsqtFwcUDb?=
 =?us-ascii?Q?vn/gzTAkpVUdQi09Yr/THBgXB4jmG2JbGzwwy6YYqVd8FrG+OSWOp+dDScmf?=
 =?us-ascii?Q?6mQe+kENjYFRrfryBqNbJMqZkYjKK7Fa7kUPIXDaCqCIAFS8xE4EU73cKVyU?=
 =?us-ascii?Q?2gYXVQRlRkYBLtsfGxduemBaaxR/3mYxJbTSYPB9dWwGy+Vec8qMiWMeIatG?=
 =?us-ascii?Q?G6LivZ4McFqlub+u8LcwWnRLRMjjESl+PFHcKjW1xo03NagQw8PK0VnS6mpM?=
 =?us-ascii?Q?UvHs6lOoE9wU+ldYJd5ubNA5Qjkubq4ceoMcZgpiboCGz3IMZMT59pC6UHq7?=
 =?us-ascii?Q?tt6d1uldc5LoN/s/l/S0cphFfsKQww28TZovNlZQUt/oO/B164GeUXG1jbQF?=
 =?us-ascii?Q?f2lQTpFZG/QpZGa8Fi8WQQAYa7ehibBoEpm5aF3N0ogakvgC4cuLRZfrGKZw?=
 =?us-ascii?Q?E8um0WbzC8Wndrt/JRQ4vTyqJJddSZFFP3KnqqKrC7luwOOX8+vn+mb2cKuR?=
 =?us-ascii?Q?JqK/CkVtD1vOp1J1HQknN4ewxEajn0DINk60U0wMj1tCB8y0wfMXAbYKAJU+?=
 =?us-ascii?Q?8GuUBChlVBrFy0dFsrprRObJyeSpiXZ2BQApyyIK?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB74892734BC8E144BF7602F2285292SN7PR11MB7489namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254ed0c5-14ef-489f-aa90-08dd0f96ffaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 10:25:36.4728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: icQ1i8+E9aILmb/Q+IZswCH08UUzh6YyXRaVhgJbTPhQObEtaWPRDFNcZZ1bk7kQOikosFPlhq6cN7X8en3KdGUFHR/M8GB5A4pmRlrrpRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
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

--_000_SN7PR11MB74892734BC8E144BF7602F2285292SN7PR11MB7489namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi ,
I am getting CI failures for the patch IGT - Patchwork<https://patchwork.fr=
eedesktop.org/series/140575/#rev7>, which are not related to the patch , he=
re we added new subtest i.e gt-mocs-reset(xe_exec_reset.c) , in rev2 , it w=
as getting passed , CI.BAT also got passed, after that just changed few com=
ment and description , nothing related to code or test , but still got erro=
r in last rev. So we are going ahead with the merge.

Thanks
Nakshtra


--_000_SN7PR11MB74892734BC8E144BF7602F2285292SN7PR11MB7489namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi , <br>
I am getting CI failures for the patch <a href=3D"https://patchwork.freedes=
ktop.org/series/140575/#rev7">
IGT - Patchwork</a>, which are not related to the patch , here we added new=
 subtest i.e gt-mocs-reset(xe_exec_reset.c) , in rev2 , it was getting pass=
ed , CI.BAT also got passed, after that just changed few comment and descri=
ption , nothing related to code
 or test , but still got error in last rev. So we are going ahead with the =
merge.<br>
<br>
Thanks <br>
Nakshtra <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN7PR11MB74892734BC8E144BF7602F2285292SN7PR11MB7489namp_--
