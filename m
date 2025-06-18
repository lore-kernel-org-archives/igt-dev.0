Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B2FC7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 13:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC1C10E83B;
	Wed, 18 Jun 2025 13:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sj/4iUXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DCC10E83B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750254362; x=1781790362;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=2kxVj/EeTohsQ2vCo3frEYmO3OLAUtyWbYBBdI8buDY=;
 b=Sj/4iUXn9ARKhsMVKn48YY2EDdR05IpmXSOSrkP12qC9ta3s8I6NcU3o
 ONUMyPmw5OsswxqXVvdJjXHuApi3j/g//FPvCaUSru3OGjbkIK6fgyG9+
 wXtD9AQKLrgYRYwy14BhhYY75ztITStqQU0uiPgqhS5KtCYExmZrr4KR2
 FxG1HGPIfHSGwn53Eqh9EFQjYoyuJwMeldTqofBBsssNjqRuyzXin2wo7
 AbCnPCHY/kgq5fBi2lhaH4UV1CLQ3ZS95P5V9W4Mj4DvZdzQqEfgVV0cQ
 Mu+h/eIy06pw73CjPsHh3HWKPaW//g7mXhX0eg0T2U+bZ4753r3iL6ax6 Q==;
X-CSE-ConnectionGUID: 3YrwlEktTjyjhMvm+xbxJA==
X-CSE-MsgGUID: sDqTdLpjTpWuWmlvBY2yew==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63825585"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="63825585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 06:46:02 -0700
X-CSE-ConnectionGUID: xk8DfCrPQEK3Ouc04tHRYg==
X-CSE-MsgGUID: dhZQJ/V8QSy17gkSYqmORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="180636338"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 06:46:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 06:46:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 06:46:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 06:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2cj4KkD0HKiFyQgoRx088ZustcuQcBC7txiEVvxYqwERE7KgwDQOKLeGksi7iN/cPH1STYUGLbQ0fsaJ5UeQaF87oUuNMUAQ4tOpAzlNBXOJNm+nMgUReJFzrw35auVglWlfqBdh9UBaOMsdzm1ef6gvGgsvD93V4BUseuJ4rIFr6egNBwNGE0vhpsWkIwlQoAkC4B9x3enDOCJ3mrqUSk+SU7n3n4F4WnzQDfAnnQMAfi3u+LOdEmTiRPg1lFDfLXdrsmn7J0+qFNguKD8fMHPX1LCcfA5DDuexNqVmbvzPVrH26//RR1XekUFGdTdK11yprM1LyMO7rFIfp48SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kxVj/EeTohsQ2vCo3frEYmO3OLAUtyWbYBBdI8buDY=;
 b=eVtFluBiEexLV5UYzv+GsnVgMUKUEfy6IxLjShaQn232G9XcRIN+uJCipZLyxCp0r/BHLiqIcRjWM7idFXqc5L3EY2bnCuldlm/ZUyovGfdre2It0XHOFLPDasKYk9IWD28FltguS4BYqnxa3m2lVf9t9qboYuY+TfYgS1pCt+uliByzgIEv9nMDiCtvU8d9wy9nPiUpzeAggMvsxUs/VQB50G52E1Hg+nxxO2m/llebCwv3OLCii/piWRlg6d600O5dl+Nsm+A3XajbmcTNlEOli9vN1qfg/cK4/YfGCOAftpR6ojwC8Wnbv481ChNeXBhYQhN6nYlmg/+8qLv8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 13:45:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Wed, 18 Jun 2025
 13:45:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ab750d76-d4fd-4ad9-aa98-25096606b4e4@linux.intel.com>
References: <ab750d76-d4fd-4ad9-aa98-25096606b4e4@linux.intel.com>
Subject: Re: Integrate kmemleaks and igt
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>
Date: Wed, 18 Jun 2025 10:45:52 -0300
Message-ID: <175025435232.1504.811184991466016276@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:303:8e::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: 7650e31e-f65f-4b78-3121-08ddae6e741c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QytUUU5aMTBpNk5TV1IrUUtCaHNVYUJKdUlET0FYV1BHQ3lNSnJ4Qkd0M2FY?=
 =?utf-8?B?Qkd3cmswU3h0TDAxbmdqZ2Nya0k4aWZZSDNEaWN6TWtLNXg1eWdUV3RRb1lW?=
 =?utf-8?B?NWh1Mnp6Sm44VTFJZDJTdlZEYVROZHJjdUlEdVpJVVYvZW9nOG1TYklnSlN2?=
 =?utf-8?B?UmEwN3VtcGV6aHZJcmtqTkxrOWNKU2R2ekE5WFJJRFhtMFJRR0dVOGZhUkdH?=
 =?utf-8?B?bXJFejdrTSsvazVXMFdzVlNqRTBqNDYvNnNGRVVZYmV3aUExOGk5UVVvSjdl?=
 =?utf-8?B?blgwV2NpMVJvM1ZVNlNoSWptbGQyd1JGT0JoY0NHL1ZYL2QzV09GQVhZOGVH?=
 =?utf-8?B?aXhwcG5YcVQ4NW1hUWFSY0JPd01LZ3RNZzdZZWxhdFhHaDBKbDZmeldSVzMy?=
 =?utf-8?B?UG1GdWtRUzZyWGpZZDdJUGFBZnhVRmZUMS9hTkIwYUJ6Slh1d2hxRnE1SUlz?=
 =?utf-8?B?OE9LTmwrcndacWZUclpmcVJTeG9jcUU1bE4wMUpoYTBSTmg2NEpXd2RZWmNi?=
 =?utf-8?B?UWVDQlRTOUwxZkFiMTdPQU5Cdlk1c1hCVk5SWWxRZzMzZThjZjdWRUpraXU5?=
 =?utf-8?B?Z0dnOEE0SkJLV1F2T0ttMlovUkpBdEJjTGY2ekxOZHkzZTRtMUdBU3RsQ0R2?=
 =?utf-8?B?M252UmRKOS93U0JDcWVzbHltYWp2ckJ3Z3RabW5nODd1UTQxWHpxMzVXNzNa?=
 =?utf-8?B?dVhuRmZvMVJWMGF2RlR3M1ZNemtzNXdrcUpmQ1VxYzd6OVQ3SldGUm1Wdk1R?=
 =?utf-8?B?aVdXS2NDY1ZBTlRNbGRVLzhQQ0ZZbHhBYW5CRENUUUF0b3pWMVZJR1pla3E3?=
 =?utf-8?B?MURsVlNsKzRzMENOdVVlQU5Cc2lrZFU2ckE2UjdwUmpmUGxRaktXeXNXVWJm?=
 =?utf-8?B?bzdZQm4xZkIvcnBuUUpXaGdmWm5YMXhBTTMzaWRUK3JhMDRwVzBITHlxVGY0?=
 =?utf-8?B?NndJd1N6Szhuay9QT0RSdkNPdmNVZGdvZk5CSUtiM25EaGFqa3BTSldtVkpT?=
 =?utf-8?B?cFdvSTQwajNyZ2NueGE2Ym5iTjhNOVBTK3djSm9MM1BuYjdwamNtTnNFQmNW?=
 =?utf-8?B?clVTWjYycEZwN1pWbXlnU3hnbmYyc0xlVERnTTVXV1RibTBRdEpDZlh4OW1U?=
 =?utf-8?B?dDdiODZDcERuSitnMVBNOEFzY0Y4d3htTjgwbFgwTDlxTUZ3YnpnejhxWFZt?=
 =?utf-8?B?MDZLMU9mZmNWa1VZeTRxdDJ5UzFJa2xVOXE4ekFjc3QxVVExWDR2TmZrZE1N?=
 =?utf-8?B?L3hqbzlhSkFtZUQzMDFtci9qOVJBaFhud2srQWRxMUpyVHF0TlNMSTdjUUdp?=
 =?utf-8?B?WXhsTzQzVUQ2YzNhKzBPcS94SEt2Rkg5Q0Z1RUlSSnlHVVJITjFncnFwb2tC?=
 =?utf-8?B?N2N4OXc1VlhQNUlsQkZ5bUJNbzRFQWJ4R01oMUU1dmhEWmlNOEsvLzdrVW11?=
 =?utf-8?B?aW1QN2MwVHFsSzBEUHprazBpRzNmQmxhNkJPRkxWb2xPeTdiVzQvZkpmdk0x?=
 =?utf-8?B?Y21IYUttNGo2ellraWxqZ2FnSURGNkZrcndxOVhxc3AwUGhTZFZoeC9kb2Zz?=
 =?utf-8?B?R1VOK3Q3NW8zenlYMm5aZTBiMWcxdlBQM0Vud3dqekt4aFdlQzZrUzF1bVNv?=
 =?utf-8?B?WEZyd1ZLbVpJVUxqb0xSUzRFKzc5WXFpbUl6OHFhMmdCdW1oTUYvN2hOd3Vo?=
 =?utf-8?B?Mi9mUzlHejM5WmVpVUNQSFpNaU9zN2ppLzBydnl5eXpVZzBUTUhFamlkSU9u?=
 =?utf-8?B?UU9rVjd0MS90VzlFM081VElFU09qWklFVTV4STYwRldScFpWTXUwaUE2azM2?=
 =?utf-8?B?UWZEbElWWDlLYWNtZ0p2U0tFV2RNaFBKNndBMlZiclQ4b3R4cTUzTjlXQkpB?=
 =?utf-8?B?MGFOM2NOWEdGaHJ6V1pFTld0Y0tnOEdNdkFTNXkrZCt1Ni9jTDd0aEJTWTlK?=
 =?utf-8?Q?dpCxBV5/pKI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cS9lUUx5OW5iaEgxYXNxWFJNS1Y5SUlKdEtwL1VsaFRFbXNxUWw0VXJ1empU?=
 =?utf-8?B?OTVxZzUxWWxQeFZobjUzbnVFb0M0V0wrUTNpYTdCOFVNNGs1emZSUE5VZC83?=
 =?utf-8?B?V1hoVXZ6SDlqZTF1MFpMZzNKUE1LaGNvc2NucElQbzN4SS91ajYzWXJaWTZJ?=
 =?utf-8?B?djNqcG9rZ2lWMXYrekRlRXVtelRhQTNFVmZtNVY2b3JxVi82dG5sN1hDekll?=
 =?utf-8?B?QzJtWlNsMWs5NUE5RXYzM0Y2VVFva05vd1gwRE85U1VzWFhSVFNqQUExc3M2?=
 =?utf-8?B?QTduUlFwSUFMZ3lsbkg0QzY5UG9VdWlxQXNRWGM0c0piVlkyc2hvUE8yMGdO?=
 =?utf-8?B?RkFFZEtyZzdtYmpOaXFTdlJFV3BHdWtlL29RcXJwWnh0VWJ5SzE0ZjNYaWh4?=
 =?utf-8?B?a3Rka1VsNk14YVpPUk9iKzVOQWs3cTJrcENYUFdWY0dBTGdQN3Zqc082bHZ1?=
 =?utf-8?B?dFd5L2hEbkY4VVZQSEV2MDExZFR6U2ExdFZ4SlN3V1FqTjd1NjlMbVNvR3la?=
 =?utf-8?B?U1NUTWhqQTNaVVkvdUVvZnFSb0s1Z0tMUlJUR0VMVjN3MWRXVHZxQmw0Q1Va?=
 =?utf-8?B?cmsvZGsxQ3dQcmFiNmV2Z0pWVWNWU2V1QmFzU2FrSVFKcW13MXN4T0EzVEpL?=
 =?utf-8?B?VTRUZFNNNFhlcG1VZHZrY3Z1M0RNbm04eEFPSkNDRHJkaGNnYXM3QWdxRkR1?=
 =?utf-8?B?dzdEMU5jZ29BdXN5eVozd2lIRDVHUmJ5QjJtZzdOSEFFRzJHOVBPclIvQ2Vq?=
 =?utf-8?B?Y1YyZjZVUHdqV0xhaDBxZzlOVXQ2cnhZdWM1NWlBaUFyQ0t1eCtyb0dKUGFn?=
 =?utf-8?B?ZlJZRkxnWDRIZHd2UFpQaVJqb1lQdWtzQ0Z2VHJvRHVWS0pVaC9FWkFzcFJv?=
 =?utf-8?B?UEQ1eldvakVQUEVLZU1BUkxBVVE1ZWlkb2Rjc2ZmWnI3ZU54WUczZERiMytR?=
 =?utf-8?B?RzBlVTZGQVpGYlZlSlA1MG1SQlZFQUNHMStaR1o3SjZ4Rk9TZlZERnNJbHdn?=
 =?utf-8?B?bENsRkVjODkrMHJYTklaMUhGSDZIajl4VXpsaVhSaGRCUkdhWFl6UDhCZHk2?=
 =?utf-8?B?YnJ1SS8wYmU3WHJFaFdwSmtNUmovbjVzOGZ0Z3BjYXdOYWtQWlBFLzBOa1hP?=
 =?utf-8?B?RVo3cG8vdkZWSmVPalRVTEJJdGdWRU5Tb3YrNjNpbTdQbTMwSm9JWHJZNG52?=
 =?utf-8?B?TDl5U0pGaytoYUpkR3FoeEVSSnJmNnZ2VVFSRWN5TEJ2c05EZmxMeEhNTzhv?=
 =?utf-8?B?OTMzYVBNdjE1eVBMU0JqODJFU0xtdldRRTZhckxnVHVxMG9DenNWN3lrMTI2?=
 =?utf-8?B?VVh6Q2VxWGFqNjJXZ3piMlBtOUhIUzUrSzJlVGRRNXFPQlFTRWRIZkxGVG5R?=
 =?utf-8?B?S1dqRW9ybGpKME1iVElLMmlFWUNjemJHWlBlWCthakhpeS9UdytwM3JFN0tQ?=
 =?utf-8?B?ZTQwT3dNdnFKZ3pIRm9pSTcyak1wMnpCWFNLeDROVW5tT2tYbmd3Y2xmc0o5?=
 =?utf-8?B?Z2NncktxRzVRZ082L2gyV25pSkwyZUZnQ3p5bHR5aDdzeVJBeWJJNGtGYXhR?=
 =?utf-8?B?dWRMVlFjc2o2QUNKNTZvVStFbUd4SmY1aGdZK0p5d1ZrdEwvWTFsSDVuQVNN?=
 =?utf-8?B?TmZBRHduQmgyWDlrNWZpYzJBYzdDeTNLYVBvYlVBTENIWG01WmlLak8rL1Nu?=
 =?utf-8?B?aWtVRFJ4VktSZ3VMMGNmQjJCRU5Wai9PMmN6MG95UnJSZ1IzNyt5UnJNTVlY?=
 =?utf-8?B?WjhQMFVMaHlqSnorYnJGV3lQMzFpWFpwMld3QUt2S0lBNkZIRmdYNklKUGx6?=
 =?utf-8?B?MW5DNW1oRXZDMTdFWGwzM2R1UDBpSVZDQnhoaGlDc1d0bEhPV0RDQUdiNWJy?=
 =?utf-8?B?Q2dDQlozVGl3OHVYanZ5aFZWalJNR0dCekpjNURoVkx6dW1sY0Z2Z1hZZDJF?=
 =?utf-8?B?T1VLb0wvK1BOT3ZXSVJVRDNKbWxHcjBjUnE1VGtjY1ZYdElNWm5YR3NzdVpO?=
 =?utf-8?B?dmJHb0tQaWJyeWxTc1BoRk5mdXcvRGFSQ0liMlM4Wjh0RGpiMVlnc3JnYndT?=
 =?utf-8?B?QkhWN05QOXJnNDdpVmNKdHY0RWlsZ2xaZ2x4QjZkT1FMZExsMWdsV2pwbUFp?=
 =?utf-8?B?OWVETFBCaGh6UU5zbVo4cUd6bEt5Unh3THZjaVVmNjVnallzSXJ3ZVJsTWJ5?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7650e31e-f65f-4b78-3121-08ddae6e741c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 13:45:57.5276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32CJV84mJrf9e0HJ8qcwGo64QzGAeA0JYdlIlRXrU5iRhmvAznSCnCE5ZgQPIbP+xi1ZnzeUh1r0U/Qri7qFRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
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

Hi, Peter.

Quoting Peter Senna Tschudin (2025-06-18 08:58:07-03:00)
>Dear Gustavo,
>
>I am reaching out to you after Lucas suggested me to contact you about
>integrating kmemleaks with igt.
>
>Currently igt_runner has the -k option allowing the user to choose
>between running one kmemleak scan after all tests, or to run one scan
>after each test.
>
>The problem with these approaches is that running once after all tests
>is not very useful, and running one scan after each test imposes a large
>performance overhead, making it not practical for our CI.
>
>Lucas suggested an interesting alternative: Run a scan before module
>bind and another after module unbind. This way we will add a relatively
>small overhead while strategically running scans when we are more likely
>to catch something interesting.
>
>The problem now becomes how integrate kmemleak scans around bind and
>unbind operations. Lucas suggested new hooks IGT_HOOK_PRE_MODULE_BIND
>/IGT_HOOK_POST_MODULE_UNBIND as a potential approach.

What would "bind"/"unbind" mean in this case?

>
>Two related questions for you Gustavo. Any thoughts or preferences about
>collecting kmemleak scans around bind operations? What about these new
>proposed hooks, do they seem like the way to go?

For the first question, I think I need to understand the meaning of
bind. :-)

For the second question, yeah, using the existing hook framework would
be nice, because we would have a single implementation for attaching
functions/scripts at specific points of execution (a.k.a hook
events).

The current hook infrastructure only accepts strings provided by the end
user, which are executed as shell scripts. To allow internal usage as
well, we would need to extend the implementation to allow attaching
function pointers.

Another thing to consider is that currently hook events work at the
"test process" level. The runner will forward hook options when calling
the test binary. So, depending on what "bind"/"unbind" means, we might
to also need to extend the implementation to allow hooks to be used
outside of test processes (i.e. in the runner's process).

--
Gustavo Sousa
