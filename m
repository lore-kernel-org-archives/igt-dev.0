Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03F9C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3A10E38E;
	Tue, 25 Mar 2025 09:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJALOryO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8C10E38E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742896710; x=1774432710;
 h=from:to:subject:date:message-id:mime-version;
 bh=V627M2FRci7z+4gW7lZEa5u8z8DiCVP0Ql0ya0s/f5U=;
 b=GJALOryO4HySr1IS/mxmm/qukz3KbCvo2bFKCQmasLZfS+I5KkQ7/HWW
 83fSVgs0ZDa3Dgb3v2j/aC9SFfRXmmoxOHJtIIki6vRjkV+ZytUvZmbau
 liWrXjzCiOCXjJDhMOkkCu65lgJ5v/K7ClaO7ouGgJkGJKTU6QI5HYb1T
 609/W1FVEpv6bWHOByAFcMnhdldNpgQ3Cl77Uie6TE90VkfYnbb8NdbXC
 mjCFkgDO5cxFX5vRnzvfEI8ZjljX3Dx/HPzXRzeAKhZzoAMTPxnwAt73i
 SSWuqHuNk+x53dMJsjmKf1xKInCvIsjxRmI5evoB4WnbSnW56Y1C5YAmx Q==;
X-CSE-ConnectionGUID: FBBmCxUWTkCLlThRTU7Ejw==
X-CSE-MsgGUID: 2LIIESoBTBmYDFGYsZzSgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47917010"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208,217";a="47917010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:58:06 -0700
X-CSE-ConnectionGUID: D8m53WoPSxmp/ZSJw88dRw==
X-CSE-MsgGUID: LRCkkjMJSKmR7u3K83eZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
 d="scan'208,217";a="124360272"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 02:58:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 02:58:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:58:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myRe1NowjoLypWIpLuOQSPzJBK70x14gT2Pw/cJKCk+BlF84UqskXjSeRWcXglEsRlAmtSeSnl5Ufc2biGaUyOwXM5F/aG3WQSsYgemNwPeYxtX1rtQ2/Pkd8miw4glYluQ5hRIZKEzkZfWpjMBk3e0Cz1EYpyUnNGXMJSRD9g5iycWw0kuCz+ihFPRHG2HUh+CIDul3KfA7rlH+B0yfydDDkinWdgaW6s8driIwX7UBMsh0nfbyr1HIOZZ6S9vx2WquKw5LcCTrd2r44HriE5y/AmteAIstjtWuicaSzIlAPU6EA2SgXnfraXpdpgy4YiJHvxj11f13z19Wb4RCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecOeqo8epjKbKTSbuTiH44OcmGOBxdd2EyojUJMVN1U=;
 b=ocHrErW71OmY6xQ1Im4Y+FEp5gQHStY5uZWcCgwbcjhAKEDJOVlxFlrPuuP9rNsIBga8Wco7LvuT77rOeA3YVE7mbSy5kQaY6FGF2++h9s/NBcBxrr05l4siC32Knp6l28yPp5Pii9LEDrMYZ+9PwXYXDWRfP95axI4uD4bvMZaFLfWhfE7R9D7dWAPOfpBdZck51YHMn27Diugjf9Oy5QWUquaRm6g8nioUGh9z2zinaTjGM9syPnmX271DDumxGAmOxifdejfSXL1levzHCIPxBr1qoEynKHfDCJLWufpPzfICqzCpHdUFJzHwCP0dFUcPH0MiwqpTvaenSz4Bhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:57:35 +0000
Received: from MW4PR11MB5910.namprd11.prod.outlook.com
 ([fe80::9b12:3de0:79aa:a1fe]) by MW4PR11MB5910.namprd11.prod.outlook.com
 ([fe80::9b12:3de0:79aa:a1fe%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:57:34 +0000
From: "Thomas, Sobin" <sobin.thomas@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Please review for code coverage changes
Thread-Topic: Please review for code coverage changes
Thread-Index: AdudbCgvmfJhDgsTQR6yLbDqaC647Q==
Date: Tue, 25 Mar 2025 09:57:34 +0000
Message-ID: <MW4PR11MB591077C1CEF3B4DA63EF5C7D94A72@MW4PR11MB5910.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5910:EE_|BL1PR11MB5285:EE_
x-ms-office365-filtering-correlation-id: 503507cc-0c81-449c-fe4f-08dd6b8377b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?03C7ZzBAMYB4ajm8OHD/8wz2ZgJ9OAfu5MEFVKBbjx6dsPushg1UWqPKgmWX?=
 =?us-ascii?Q?H83S1cjimp2r9GQ4QExH5maIMpkz3uejOhWG8f8iIUiH/hAFQLxP7xg73+U4?=
 =?us-ascii?Q?EwQ/z0cxljtvdTeafR97DDz7G+ddcTn+L+6s2cRymAcWz1f8xbsS9XOagVl0?=
 =?us-ascii?Q?4CFS8bxqEA3HOYSPTGTuU57UDlbTuB33taFPO/5O6AJteHE2Xbvur6eC3Y9n?=
 =?us-ascii?Q?pLg/IibnZ0qWmatjyLpg64m4QsYW7+aDIHqj+CBTlo92tf/qJMrzymL2bep9?=
 =?us-ascii?Q?I4LPYeONhp+cRJbBwjdcxIcG7/vJJWsZGW7GldTSXbWIPB0jFLs4UQvpz2TE?=
 =?us-ascii?Q?XB8EbWlWdYLWxWdyBKLQ/RzGOa0IpZ4lqQ1AG0LYKtHqvi1tqLa6Xp8kUgbP?=
 =?us-ascii?Q?dBk2jVlaWQ8AWRKBgFM6OL5JccCsNzL6Wx9VvrJgmwvvXqvqKfNR+L49cuxQ?=
 =?us-ascii?Q?LgWzMXKrdNTW+dnesbgJ0e2KPuhuVRlio/+B/2QtAzc4MNVzUv1cA7OPnd1O?=
 =?us-ascii?Q?htVIcXZKib1shOa6vDoLiH55Yh2X6s4tEFCp2KddX35EeYRBsEsAqMjQF2F1?=
 =?us-ascii?Q?422jYbXzvWAfZI/XaQsyF4FVSYp55mErGYJefPGIu8ZB1pCM+ZMJRxRRagS4?=
 =?us-ascii?Q?Z5oBv6k7oVgYEivX4BJJMzURiZ4j4al1kSlBWSY4OacwpydetihH9x7x+T0F?=
 =?us-ascii?Q?GKFclkmOC8oiq7vz1QJ4cdrB+paExp2HR42KlsViztoFvJMoMbHHieFXFTBp?=
 =?us-ascii?Q?B8zWwDG03h7wBe+60RHaujdiZlM9NnXYzTos6tsnwDY/NPMglskIXJX0uOFY?=
 =?us-ascii?Q?zecd6VdXn8ooTNMPtIImrhDjZGtz3CT8XFYyrXrJjS7yKKKzLfPH00TDhn4D?=
 =?us-ascii?Q?oOo40CLZoymNnYlZi69nT2naq5dSaiLwm7CLsVvFvf9AEvbTdk9rJOR/senc?=
 =?us-ascii?Q?ZsR/hc8T6+pDkIoAIqEl7xuRf8NBPHeqfBodNt7S2f7OtOFyWenCAWpWmhT5?=
 =?us-ascii?Q?7xM3NnzLLn34b9n/dDP6JIyEl2mf4vPH36lVLR3yRH0F24zNKXCpGqLwKLso?=
 =?us-ascii?Q?Mv6HzMqqC0T/NEQJTDaEijxXRQCh8NhDoVcPk5u8hLCho9ZlwF6zNojeZAJg?=
 =?us-ascii?Q?+lA9EkQTqZHvheBpoSnKXk2p/8IFIT3lWtTC+bglHsvsEmdTbUDW3EA3SuIc?=
 =?us-ascii?Q?dxS8K2HVi4q0X6cmFqnOFZVIynE6xKcgzYDOtG0rhTqusx/3+3sZhN9r1uGo?=
 =?us-ascii?Q?ABVrJ8onRW+LOWEMjXMjzgRLsOj+T33vYpILvoZWkVsqppMbguOgsHDzfzyu?=
 =?us-ascii?Q?QlWn6g6EqnQ4EYZ7jqIzt5AXOY5qDL5kePL9HHc09G/u6SFMZyQu6lEgKkkm?=
 =?us-ascii?Q?G4ESl/mO2p8FglSpRFCc4tlORdyy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5910.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8MVl1z+qd/HHXssaJtdjx6zTafx5zVNOzRU6HjsLzadbcs+di2MwMz2Zix0E?=
 =?us-ascii?Q?qDocwl+sMNLrLMIeUDZEK6izDurlMGBiMCEAFHc00F7jZ3GBRFmmzifp0fcR?=
 =?us-ascii?Q?aHFpkbs01bdefNWJOiMOhKz+p5xUOksndb66CfNr/18kV3KTUNta6aBnAGtd?=
 =?us-ascii?Q?IErtwBhq/d+22hArLBp/UayWsAyCK9qgDaSrxatseSVXwaSPVGWl/VjlllqT?=
 =?us-ascii?Q?vHTyzLnUv5JuE7LLxX7I4uiD9+77ItMEMuxkxKtOWls77qpGQVUTmNIGGMsd?=
 =?us-ascii?Q?4WqvDOmn/d9XpT18xFaQGFlDsuaguoL1w/q+gZZtGsgQYIXSYNot9dekSJ0c?=
 =?us-ascii?Q?nOoz02ZweR1bFyjIOXb3NbHE089uPVnVzjfBAIXjrdStyASa8boR7FcOPnkp?=
 =?us-ascii?Q?XMO0qWsgC/qGiGqYkvO1O691zfJ7kwwyo29wVj4eseONqyNiyYSCy0cyzBH2?=
 =?us-ascii?Q?LRSGOotRGrkKXnvqOjckx6QVqhJ6C66JgojNR0yn9knG6q8PCMES/GW6qe/l?=
 =?us-ascii?Q?sRTJlGM9S0ZxjJ6MKhajmfSXgDm0j+P4R55FAXygAtW9a7ae5tJDQT/daZY4?=
 =?us-ascii?Q?Nj2TcHBZZfW+ajsAki1S3ZvrfQdt1GO9hAk9vVk9i+witUiHjH2n47acGP2R?=
 =?us-ascii?Q?Qf/3ZTVnGVO6M/663Jen832xJ94KgwPZVoI2fYffDBkLbRwUMYumjIrFHDoK?=
 =?us-ascii?Q?NeVPvhzBCR1Vwppoi/TTHbBW8SRx3hkF7tTYoBLlIeiXTBA8FyrCvFTXV9fv?=
 =?us-ascii?Q?S7HSQ8tAYnV7TcEmLKkji/8S1s+rO7eWbdWDZzJ/hfk9GgliQ4ofJ+cFmpnw?=
 =?us-ascii?Q?bgRUwE95Qq4XjKVcU0WuWAmc1frkPAus6MVh4vGZOsESJ8iU2iIZSwWDu2nr?=
 =?us-ascii?Q?K7XeDcPAINbHEEQB77mImMZ3lKcTYDmxBhJtUQtityhar4kSbxH3UXhk3/tx?=
 =?us-ascii?Q?7czxMpOSTHmDKd0g/MuMw0pp6rfJXRgpj26D++5hzVAXnh31fJIJ3+guyQmK?=
 =?us-ascii?Q?TnIAd7DMvJpkbFWaApQIEHeTtzYR6ylcg8VieYsqSCZoOZe1ioOQZ7fwAyDB?=
 =?us-ascii?Q?cjTJW74CqmgzhsubIa/PPq8eSu+oFH1Y3TWQFuHTqktOaICcj8BVTvjKoW6f?=
 =?us-ascii?Q?OAksesclZr++++hhX37TI7klA4bwEutZqd9ZD2lRmUaZdnif/LQB3Y073Vyh?=
 =?us-ascii?Q?Qx8WCCfhpmHu55xpoiNU+rs76TrCrhXE5UYhLShm9uZ94VinTtSnZDGw5tav?=
 =?us-ascii?Q?Enfj92I5iKl5IUXzu/TwrXSEBELTQuw8ft0saD332tecjCcB1Rw3Onk7nY0D?=
 =?us-ascii?Q?RUf+WvB6NcdZAXzjGrgNFLYf846Mkcm2T8v/erbxj7JTnb+lGsWeDekqAbvx?=
 =?us-ascii?Q?cwDTSnmHac8Pj4TJSOivX7Fj7uwdwfpH5bvUfuldzMl9obp59J7/VyI8ukIg?=
 =?us-ascii?Q?BWpjzI3KJIX5DDWxjJWt7+qaoWXn7rYxanRl22K4uJDHaA1a3Am2IHCcf003?=
 =?us-ascii?Q?cCOOS7a3cby4VLn9vR2gdBuBhX1cVsTZeJ/lf9G9A+ObnhtwQyHWhMbNP1mE?=
 =?us-ascii?Q?6yy7F/h1CFfV0kDViq5zlUI51Kq/tNuRvqvMtE2E?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB591077C1CEF3B4DA63EF5C7D94A72MW4PR11MB5910namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503507cc-0c81-449c-fe4f-08dd6b8377b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:57:34.9493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMopmmcLWqWYsns8OsHaxLeAw3B7+fURSgAHRQOzei1c4OJ87Hg8+2hiw+dxzraeY+9iHWUKoA1sJL5VWx/OwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
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

--_000_MW4PR11MB591077C1CEF3B4DA63EF5C7D94A72MW4PR11MB5910namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Please review this change

Fault injection test code added for coverage of below APIs (ebe816d2) * Com=
mits * sobintho / igt-gpu-tools * GitLab<https://gitlab.freedesktop.org/sob=
intho/igt-gpu-tools/-/commit/ebe816d2047d39a363c5e1dcd9ae3128efbaf417>

This change is added for code coverage for the VLK https://jira.devtools.in=
tel.com/browse/VLK-70385

Regards
Sobin Thomas



--_000_MW4PR11MB591077C1CEF3B4DA63EF5C7D94A72MW4PR11MB5910namp_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please review this change<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gitlab.freedesktop.org/sobintho/i=
gt-gpu-tools/-/commit/ebe816d2047d39a363c5e1dcd9ae3128efbaf417">Fault injec=
tion test code added for coverage of below APIs (ebe816d2) &middot; Commits=
 &middot; sobintho / igt-gpu-tools &middot; GitLab</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This change is added for code coverage for the VLK <=
a href=3D"https://jira.devtools.intel.com/browse/VLK-70385">
https://jira.devtools.intel.com/browse/VLK-70385</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Sobin Thomas<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MW4PR11MB591077C1CEF3B4DA63EF5C7D94A72MW4PR11MB5910namp_--
