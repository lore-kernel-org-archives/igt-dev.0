Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F74CC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 05:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A593A10E0B8;
	Wed, 19 Aug 2026 05:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jStK9SHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AED10E0BF
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 05:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787116608; x=1818652608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=H3JgA/pmX9CXCQDcDKJlFvawx+vkZiuHEX0QRZs3G3o=;
 b=jStK9SHKOa+tIK4H1Ab9DhF310gT3S5Tg8yPMlYrPLIu91EQNR3E8q5y
 5Buyet/tkScy02G9JJesTd7Xq5Q+aO9ipvHqC5C8/CJTX77aXaqTUXGrm
 +tFL7cbkx8vnAsHJBMD7N5Ozc/efP1H7IG39AmVKw4/uLkvlO4Atnljqt
 LxYz2oknDwMlzTmFfx0KFs2LGCF6B+CP63y21uAWOvht+EbmOoT1n5OUp
 ujcb+/xIPx7V1U2BjDdqtlHrhaqXg/DWAIzinCPyH4u7rkQd/0LOogxaE
 dY8OGapEQ2svxjYsdD9sTuMfTTwVvER6Ry3qegL+ATL3IU7aWbldL5lMc w==;
X-CSE-ConnectionGUID: FGMd+ruNTseVYLzBYT55ig==
X-CSE-MsgGUID: t328VxvxRsCVQpyRvteuXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91492356"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208,217";a="91492356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:16:47 -0700
X-CSE-ConnectionGUID: bipzFQGjRcK9GvnJLS37kw==
X-CSE-MsgGUID: FUti1/WlRC2am3v6ugT+NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
 d="scan'208,217";a="290249732"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:16:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 22:16:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 22:16:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 22:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFGpI0K2TfdhXxrdc1/9x3YHg2i6K6ZxSVH11a2d2eoW1RL+mhe431RdfqGGoTchbJUsNbvYdpGdwk+ZUIE2LlHZ/XXMlb3fLiU++07kFLPYtsWqrs8saJ/g2KVIJUSwAF8TTXvePgamFeW++rDWhvsWpa3Cb8KtkIJToFN7jeINyUllbOLBdlczHNYj0QRfwMmN41vG5qvjF5raKWq+3isv9p28ZsbiN2pnQe7mQbSO9hJ9sIXxm9BEAopwzDR0FT2HHyfoCOGc+bD5FWBC7cT1mjFoBSl+tKb9G3DGXNOXq/+uSWijR9gR27rTKq2zMvxgvvLkPWXiFtlmUB10IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdVsYn+/Sf+9PbQryEcnIRV6zt39KmfuGPI8ckGdD5I=;
 b=CqBEEyveamcEe1n983xrOprU6IijF0WAoNxKGWSarHWZPstJrLOV31l0VLAl2Wenf1G8uGZyWXlkU2Ffk67QM1HVrFpsxsyaAw4bs0qXGHlIGL2qB4rB/IMSdt9184icdItd5StT3B0lIvR9SzWFXDrDysqNX72sjTZCTxMA85qETc99FCR4kcDcu43rgU3a+c7nwuXj9zWRSsbHt1iAtFTRE+xBYSQ0eFPCYfbC8topDsjLfLuLkKP2425R8tCua/YgaMBcVSTvBsfCi69efnQ35qRoXON39HY0X4lFGPrzIP4OEuccDfw33j3GiN3F7uXLxg+YlfZAyzLz0VEavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 by CH0PR11MB8088.namprd11.prod.outlook.com (2603:10b6:610:184::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 05:16:41 +0000
Received: from SN7PR11MB6827.namprd11.prod.outlook.com
 ([fe80::5f17:f25c:383a:a5e8]) by SN7PR11MB6827.namprd11.prod.outlook.com
 ([fe80::5f17:f25c:383a:a5e8%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 05:16:41 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v5 4/4] tests/intel/kms_dp_linktrain_fallback:
 commit display reset before fallback
Thread-Topic: [PATCH i-g-t v5 4/4] tests/intel/kms_dp_linktrain_fallback:
 commit display reset before fallback
Thread-Index: AQHdLiIfFgi7xLFIc0WkTipIi/9lZ7ak1trN
Date: Wed, 19 Aug 2026 05:16:41 +0000
Message-ID: <SN7PR11MB68279C2060035BA849ADAEDDDAA52@SN7PR11MB6827.namprd11.prod.outlook.com>
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
 <20260817082612.1101382-5-sowmiya.s@intel.com>
In-Reply-To: <20260817082612.1101382-5-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6827:EE_|CH0PR11MB8088:EE_
x-ms-office365-filtering-correlation-id: 62e71f03-eb13-4fe7-f175-08defdb10d81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006|8096899003|38070700021;
x-microsoft-antispam-message-info: 9jG33Px9WiErrZMNNcC1b+gSdd8rCOWzRpHF6faWLVSXzcjv6ImrcqXLZ2i78BKsfhs85bRDlg5D1iLON4fNK9ZNnTSYLMRqF2AX2vwXjLI4bya8bhDjHCyZMIR9ZMZQ9ghZ3KO8ihqRispIbSXqLb35Bz3YAFc0sV467uUWfTvxGfRVTGtUj72itOxws4w+0h4RJxz53r71YHJWDKVEpXWwPPrjo8oW4OpP7c3wRFd6YKrbUUwVlrWkJENOwkEPjAY05VUDB2jzWtAVPO6DMQpS4JYSYqira12fv2D6fiU7PX3ODe7jTpJj29O7TNMtsM8WQzK2IZhAghcW4c8kMaR7EjpZOiu3pACnx+RXmeSgOp7v4AWFwn7D/sdGW5Lwn1cLoyaCp8SiaxNXpWvX2j2gM992/u/4QzUFIvyW0Se1DDlO5z4sbkESigj+T09H6kmq/goJNGX/RTB7CNFVwcr6Mg/6E8KWiH7WOKvYh/Yo5ol759m5q3jMwn7Ex67gIVc/rZbBLU9HRvojVxNaKrkQtdNFOQdUOH5a3x3nhjgxmgdGuhrzwWnaDngwl9t1g8wndID9OP8TG9qy4nNttDPASmDItJwWSXUUwQqTkvK6aX6QfHfEjLdVvN5QvRjH15aV3vY23CZiQveWt3eU+8trdQfi/gOIZDlNs0Vg7oogrsv8YtSr1gxmTD6smIsrsGII6MEpu2NA8Z5eJHVf3lI90d1AFy2LzpqEIunwX4w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6827.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(8096899003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UzMKMc9/Etj/oupUxTlQwqZ5+475x4Jl/oOIWPrZEuzvBWze+NG1kgRNg0?=
 =?iso-8859-1?Q?44RMLOaRoHfRxwxURR4S5dTsKeebvLP1S8yiuJEGwCoJiRawZOb7csNCHx?=
 =?iso-8859-1?Q?074wQ2VphJwFu2mrMVg6ni/Pjl3w8gBcyAl4FknORMg/Cp6xtUTmCfryv3?=
 =?iso-8859-1?Q?yn9MrRpLU3PSNuD3NrMKIQk4+mw+/psQVMQeC7rypDMw0ypN9p55AIT7Ny?=
 =?iso-8859-1?Q?IhCEjwnuenghsxYR54XPjuCDuVymeVp6MJkULuuM2AjX7q0mH5s1F+lVNj?=
 =?iso-8859-1?Q?36oigAIQ1nzf/awXrU8uUf4a7T1J86ToGprW8qi1muqtuUBMuGYsDW6Df2?=
 =?iso-8859-1?Q?GUo43iB0N0YKJ5Osy8JGXeqEiwa+I/OUwqpp5T/Bwvp92fWfSMnFlebzSd?=
 =?iso-8859-1?Q?MhNt22ZvdjwOkixFGGM2Z3WRzu6OSuaanUJk2OcqaLMynMbuIwB25IiRGh?=
 =?iso-8859-1?Q?wMOmOMWo0xynkP8CFL08LvzPsonmN6MKb9jjmFJlepQGcfHISSNa8EFTdZ?=
 =?iso-8859-1?Q?QBHmd8B0H1fYaxDb94Jecao54RWHBC+FjSdF/s9moXa9x2wcENXc7YuPAb?=
 =?iso-8859-1?Q?bZaUlMgBo0OL6OpYrxvyIIVER/jhAJnGoJLyp7r3USNGZbGL/ewutrClRC?=
 =?iso-8859-1?Q?s7cQF3GTqxWxGBE0G6XCFuD9katmkv4y3TKyAOsd7uODCJi82bwoN/r+lQ?=
 =?iso-8859-1?Q?q7Vb+jUkkK3Yjc5/cdvZ7N11pXanHTBDaL1q2LS7VDlnzphDgwbLYqjcj4?=
 =?iso-8859-1?Q?SWZ/OxQd7ZW0U/aZ7CiPm5k8X7uLDcxKTKkiUfUMZaAIUEDpmnVkcVCmxi?=
 =?iso-8859-1?Q?D5xxkIVP3KO2cku7mo0cYmav5wTE7S0jN1Sew8WT+JNVudbEmICsEzhqK7?=
 =?iso-8859-1?Q?+piqusSqtXndNzNLVSgTbYlSBqDgofZ6iKDB6jEF3WZFVKuRJ2F/zH49r5?=
 =?iso-8859-1?Q?pO6GvpGRlE589mtsHzUHRSwoJLhRyNDiUGJK2ByWw39Gbod2CU2r+OiOAB?=
 =?iso-8859-1?Q?sUbvlpb8lJ6iyyxzEqzD3s3TxaJvrlqWZo7vysVmClv2GZw00dgGxFuPs6?=
 =?iso-8859-1?Q?4RffS0hzXdrdO7v/fn65KIf+EiOW62rrg8IF86/oQ4/0a2ht/9NPi7lB3y?=
 =?iso-8859-1?Q?nrkEPB7Ru/XuIYzJVJc/zVFG8X+SN0Umiq3a3TiNE4n+mFoshqeu2NKUaY?=
 =?iso-8859-1?Q?IddiI18Y9ut6/3/ZioQWfRoDpaNEs9uafOcuIxe4iDJAkZaursJOKT7xCQ?=
 =?iso-8859-1?Q?gmG8Uc73CNzg5B9msf8Ov2Wm4J5gRKSa6gCtGMZqW+ji5iyCVYkzYWsXmc?=
 =?iso-8859-1?Q?l86Y1iiXHgEOXGXQAsiomChI3KpPx0X1j3XgJ7uZvDecBiWb39J3JNT+lb?=
 =?iso-8859-1?Q?33duBA2jzaGQOQlXW/baZPpLTfPI/ZmzzBEJmcYXOg5ieHxUP+yev/taK+?=
 =?iso-8859-1?Q?ptI98NkLhZl/briDZGdNMoR5VyiiZd6k8oF7Lkj/EfOy9z9XJFC+t0XEX0?=
 =?iso-8859-1?Q?7zw//EWkS2HS9QfXibbLl3df4oHZcK3GyntWLai8PNnZSOSZ2VtftNfSti?=
 =?iso-8859-1?Q?Id1OankZJK0AL0x7dsOw+qnfJeRRQo5x/lWCpMIdcPq45fyKHvQz6bhXZ/?=
 =?iso-8859-1?Q?/8WRTuAaNRttkUrjBUBC8iIGbq3EhraLA1x+ovOvlI9lzdzJRWniUUqese?=
 =?iso-8859-1?Q?OjoOpC2/ZwwmYr7gW6bUBfgY4WMGE5tbnKWuix/0Ws/oHZ+3LdeiPDM4Uc?=
 =?iso-8859-1?Q?5WcAg4vSGi5QPHdvBr1QFlhUWIPeOoIRkXpuEZh8qVFjloyXPztlm+oqMz?=
 =?iso-8859-1?Q?Ql+f7KYfng=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB68279C2060035BA849ADAEDDDAA52SN7PR11MB6827namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HsxuGwr1yXStDwI+sUyU0fD8LkCMQ+HJ8v4kSMgBDbmLkZx458Wvjpl9a3ZUWqE7yzenN6oud6KonTqcoBxU39PzOFCDO+knWghnaNp34W5SI7xyEkfPj8nF9NIO6LKIsYK1RHQzXMmSoSmaFBnEY+Utg5Vn2Rhnl9gT3TQ/Z+70GrO/s1MeTxTK6BQ+k7SvwukMi8eLL+LNWD1nFKwFPBulg4ej0Oa1OFQmQAPye/aw5zc6Y9k4VmAMxkQ3OIS6W9PHcg6ql9nX3Tob3KnOC+FIy/829XGU4a9OSVAXO7RspUI5mpozmbfoTITuhm200ny3OBbvUiIoF66MdUUw7Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6827.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e71f03-eb13-4fe7-f175-08defdb10d81
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 05:16:41.0487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjG5JhVCgzPA8Ajt09s9q9ezntH22KGKxpkidBw/PQ3Qts1kqKZIP2/mX7/XN/C49oKeh95WrekhB4J60Wy87Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8088
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

--_000_SN7PR11MB68279C2060035BA849ADAEDDDAA52SN7PR11MB6827namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Sowmiya,
________________________________

+       igt_display_commit2(&data->display, COMMIT_ATOMIC);

The reset commit is the right fix, but patch 3 introduces the second
run_lt_fallback_test() run and patch 4 only supplies the required reset aft=
erwards, so at patch 3 the new subtest fails with exactly the "Fallback uns=
uccessful" this commit message describes. Please fold it into patch 3, or o=
rder it before patch 3, so each commit is independently testable.
No Fixes: tag needed unless there's a separate reproducer against the pre-s=
eries dp-fallback.



--_000_SN7PR11MB68279C2060035BA849ADAEDDDAA52SN7PR11MB6827namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">Hello Sowmiya,</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;dis=
play, COMMIT_ATOMIC);<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<blockquote class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
The reset commit is the right fix, but patch 3 introduces the second<br>
<code>run_lt_fallback_test()</code> run and patch 4 only supplies the requi=
red reset afterwards, so at patch 3 the new subtest fails with exactly the =
&quot;Fallback unsuccessful&quot; this commit message describes. Please fol=
d it into patch 3, or order it before patch
 3, so each commit is independently testable.<br>
No <code>Fixes:</code> tag needed unless there's a separate reproducer agai=
nst the pre-series
<code>dp-fallback</code>.</div>
</blockquote>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
<br>
</div>
</body>
</html>

--_000_SN7PR11MB68279C2060035BA849ADAEDDDAA52SN7PR11MB6827namp_--
