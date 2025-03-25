Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984ADC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 08:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12EC10E4FB;
	Tue, 25 Mar 2025 08:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NR1sjVr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683DB10E4FB
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742890185; x=1774426185;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bHb8kBkhEigO8AVkzqtwooYX2QTVr1+CtxS2rhYBFBk=;
 b=NR1sjVr7bAx9jlCv1tlrmoW2tG/3Nj9/qMcsiGjGaYRrJ59L7IoPbkrk
 9a6cx9OjzTgxHAjZbmQu7t/1pnJ8sOGzqmuNrt4nAW1X2w2z6x1CQRABO
 ywC7RoLcH4L80AO0vUbCTMTziISSmLi9622//mTofxtA/wOs/ihxOPHcU
 EVEaS5LWWGCNoNQPT4v8VPfXtASWBUwcXty1ojsKsuRUGcoooN+35mcb6
 MTT5ChwOZzXU5TbmO8NABF0VeRn7/iN6lRkChSCh/VuyV2p6kTFAjY8pX
 nLO/zHF8eNfDol4dCKcPJRGsLm9J/aX/Va1fEF1SEB3VZerwLZ7KGa2nF g==;
X-CSE-ConnectionGUID: EJzlpCMGTCqt3duHjONDFw==
X-CSE-MsgGUID: Z3AVeiylQkaCziaB16CwCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44140113"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44140113"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 01:09:45 -0700
X-CSE-ConnectionGUID: 9e9YYT17QbeC7wbZ4MKsNQ==
X-CSE-MsgGUID: LVXDAYmwS96V/UidPSyuNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124472018"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 01:09:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 01:09:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 01:09:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 01:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsCZVIwpRlewyh9k/q1s8zoyAtgbJAGX8rHnv659Ss3HIlH0Asi6JCn6CgLp4862IhMfKeEoCRdfkfYxf2sxc2GKln3KbIsbu6E4l/+w8IZAa/Kct/m6wg4lGnDhAWfJRuTQbUX7+9rSLcAETrwJLJlTeowl5zVtlt7NKNQNCuGnhJujOV2aIddHCH1CBToxG4zlTmLF35+rVUhYiw2irH9fLRPhS6vwwuulY/uEcfn5oMiNr7e0XmpFHR/JtSuQWHU8LJ8fxhj/xvePfU0Jw/eBu7kvdQYYGTfww2ZlN0lUAnh9Y6bh6jxKw6JZ/5v3dPynjTPuuSpSI+zAxrBKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHb8kBkhEigO8AVkzqtwooYX2QTVr1+CtxS2rhYBFBk=;
 b=LbHmb1LqlDgT4F1ovN2vqqSQhNTGDV9cIzEi18Zc0NYBkLWXvzKhDVsdPxICp7lzoINq9g41L4rtqBpNh8NQVwr9etsBk1C6eu73ykki9i4suPRsbkPYUTXJcrrGbq6r+IKnUZmRbSpV3cZqQHlqAUKiaw6MptjtzYcukKCDpArn5klVCC+8kPPcvLUbT9h/3jZDURPl/mbfvZlYreRzZWRTXKPjmsnstzIBAaT1hQhiHPwdKonW6B24MVgGZMLuX2UMUgMlW9ExsQtmPDRLS79yM0jVO0IBMeoMA7+g4n2XzH1ST5bwM6jMeIobQhPhmVJQho/tNHhaECk5oKg3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CY8PR11MB7900.namprd11.prod.outlook.com (2603:10b6:930:7a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:09:42 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 08:09:42 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
CC: "Saarinen, Jani" <jani.saarinen@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v1] lib/i915/fbc: Disable FBC in case of selective
 update in xe2lpd
Thread-Topic: [PATCH i-g-t v1] lib/i915/fbc: Disable FBC in case of selective
 update in xe2lpd
Thread-Index: AQHbmYiObmcVR/m0qUSS2YPwdTXqT7ODaacAgAAdywA=
Date: Tue, 25 Mar 2025 08:09:42 +0000
Message-ID: <de52bc11da8be17771026c5be6e5708d8400dd46.camel@intel.com>
References: <20250320110908.175867-1-vinod.govindapillai@intel.com>
 <851cac0a1f7a049560b8e2b8b411ad07fe90cfb3.camel@intel.com>
In-Reply-To: <851cac0a1f7a049560b8e2b8b411ad07fe90cfb3.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CY8PR11MB7900:EE_
x-ms-office365-filtering-correlation-id: 9d048782-3b19-46f6-2436-08dd6b7465a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bjdRUVdnNldtdlVGUDZvS2dhenFrSmVrUUxSMUE3VzlDak1KSXozUUVZUXQz?=
 =?utf-8?B?cDdNdElmRVBlUXBZdG1UNldXVEVYdmtJNk9OOWxKeXdDU1poSzR5U1dZQ1Yv?=
 =?utf-8?B?WUdzVnVFekkyREErc2g0NkdTaFl3SmxNZnVla3drVjRITWI0bWt5U1JmVjRp?=
 =?utf-8?B?ZVF3K2E2akxzRytldldvYVpIeG1ucnA2cTRML3RORkFMSkhHMjN3VkRqUXRL?=
 =?utf-8?B?SEZtT1hGbkNvQkZmbGQ5OVR2cXQ3MHl2Zzh3U3ZuaUtObndDdEUwZFdGVmVZ?=
 =?utf-8?B?YytXSFhFL0N6Q3FiTUdUYkxtcDBpRTFFeStWbWE5dEZEenNnamxuTWVGQmdR?=
 =?utf-8?B?bVdxNlFvWGFJbVFvNXNUQnducU1tNUJmdlN3NTFTRTViaElqeE9uY2kyQ0N3?=
 =?utf-8?B?Uk1jcyt5TGlXOStiaE1SRUNHMldtVkZ3YzJNWUFORFhrTFZNMEtLVU5LeVI4?=
 =?utf-8?B?MWtvV3VsTHJ4aHZrby9lWithQnllczFoYmY3YWp5SVFFTXZ2aGpOR3Fid3Vl?=
 =?utf-8?B?alRZREZYZEh6OGo1Szd3Nk9oMmgxT3hHbmcxNHA3TWp0TERGbzBxOVJ6enRM?=
 =?utf-8?B?eDBmK1kzUHY2YUZPRXZnbENHS0VJYUxHTFpJY3VoSWYrcnE2R05reU4wRGpT?=
 =?utf-8?B?d25JSXk3U0l5T243dS9YTmJrNEFXallVWGVEdm44Tk5uWDVNWlA4ZFAyanRh?=
 =?utf-8?B?cy8wOWZYQVhQNGNlR3Nma05rUENyMVBQcnVnWjA0TTZZcUJhVUFKTW9zSlJn?=
 =?utf-8?B?eVd1NW9zWVBoT080ckFpSVpIWXBKaTh2OWhZcFVUdVdaT21DUDkvNEk5aFJF?=
 =?utf-8?B?alhPZTdWemxhNXJ6dTRucm1TK1F0Vys5aXdrdm1lL0QvWkxFaHd6QVN3NDBw?=
 =?utf-8?B?MjhvNHZ4ZGJoSGFPd2RHU05nUDFWTFpJUFhwTndGbWJpc2cySXcxU2ZBZVVL?=
 =?utf-8?B?WmJHTkJpVG1wNngrUitPNWczVTNnOHRERER4cWJKb1p6VTZUNlY0cEV4aUV6?=
 =?utf-8?B?LzhSTjV2bFc5TkNEVGhHV2I1dU9JaEVTUWthZkV3eVpnNUxnQVQ0Rk91NUhs?=
 =?utf-8?B?YVpQekRqU3NlZk1qdXBFdlVkeXVLNU5EVkpUeEJ3NWFQeDZCWjU5ZUpYQnJ4?=
 =?utf-8?B?bzVnenNjR3k4VHdiRHUyOU1weCs3bnE4NTk2QUtMRkQ3K2ZKL2NCamR4SlpL?=
 =?utf-8?B?YUJnYU8vSUF0RUxlRmlPdUVwNFA4a1BVWWVnVHBrNmRNZ3E5Q3pvSEo1aHhO?=
 =?utf-8?B?S0ZqTFJrOC9STlNDUWkvK2xoWUJNSHhXRndkS21NOHJMMWwxeEx2Y0QwTGsv?=
 =?utf-8?B?dm1KZmtFTDZ4N25vNUd5SUNVQWxTM20rL1o5WHc1S0wrekV2eEZtZVFnM0Zh?=
 =?utf-8?B?bVBOY1NpNUc3QlY1RSswdWFBMzZiSWJEYW1sQVFyVU1QN3hCcjhoN0JzMWhq?=
 =?utf-8?B?T1psK21EZ1QxOHk3UUI1d1FXc1J0ZkhOVlFmY0dyREpuVm1uNTVFa3lSenBN?=
 =?utf-8?B?M0VOeFl2ZDBCNGZ5c0FOTDBMUlJ5Q0xYRE56RWVKR3hXYmFJTnFqTkJrVWRC?=
 =?utf-8?B?amtDdC9EalhSVEE1QXNGbmxuaFBUaktISk5sOGdCUU9xMDI0a2dXclZQK2Qr?=
 =?utf-8?B?L2hudFBRbWExdEJPaTArbjFWZjQ1RFRkQkJ2d1U1VUdZbWJtSFF1Wm1KY1Rw?=
 =?utf-8?B?dTRxVHlDcGt1N1E1VmZ4Zk5XT1FIeHZnN0pBU0xXQU5od2p6NkpXZVYzdlRp?=
 =?utf-8?B?bnFCRml6Uk9lRW5EUEZDdDJHRWg0UkZLTFJTeW1CKzRzck5GcS9IVnV2a2Ey?=
 =?utf-8?B?R0ZiRkhjOVVjQlY3NXV5TzZKQVZqTW94M3NrSTdnd2VuWVNhSlJGWmd6ZDVU?=
 =?utf-8?B?blZWSzdST3JzUlA5UDJHanhsb2VtMm14bm5VcEU5OVZIVkt3RUVBREpDQUNC?=
 =?utf-8?Q?KNun62X193s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2JaUHZaYVAybm1TRzlFYUZzQzZtYjVDanlGaWFMQmNrV3BsbEhhRzZXa3BU?=
 =?utf-8?B?VFB3cm1iTnoyRVdzS3d6QVhxWkE3N0dVTXBnVitxTjgyb2JoUlVHaEpjNjla?=
 =?utf-8?B?Ylh4aytjQllmbjk1VVZjTUhWblRVY2xBMXRsZm96M0YycTFKRTYwcm9MbmEx?=
 =?utf-8?B?Sy9IWmQ4bnZNYkFsenFrekNSU3ROSzloNUMrWldpeWF2c0M5bUtneERVQ2M2?=
 =?utf-8?B?dWo3WWpLQWhuSjJTOTlxN2F1RFZwRWtTMnZoMTBMbHd3Y2hONDI1QUd5dDBs?=
 =?utf-8?B?OEZJa3Z4d0YwSmZLZEZmVUtZYmNWR1J1Rm9ySGFWcnB3eER6VkZuV3JXNFdE?=
 =?utf-8?B?SG5oZ21TYWV0Mys0WDFaODEyRzF0TG1VTXlUV2luUWVFT0t6SWlkT213d1Uw?=
 =?utf-8?B?KzlJZTdWWHVPRkdwdjRNQWJGREJxTEpzY1ZGeXUxL3FGQWRWc3VTR2d5TVBk?=
 =?utf-8?B?MVk3MTBIUTU2Nzk1NllaVkg3Z1hJU1h4TnAyTVB6TmdJQnJkbVovWkxTV2Rq?=
 =?utf-8?B?Yk1DZ0pnMlBZU0tyU1B0a2hOMUZKbFB1aEF3bE5ESm8vOUVYTHNmQm8rYlpG?=
 =?utf-8?B?WmZFNmVVWHExcnp3b2tydmF4R1hONmxtUDN2SzdOeG4yREJrb3pWVmFlT0Fq?=
 =?utf-8?B?T0FlNk1za1pYVXR3U05VUjJBNXJBNDJtZEU2NFI3NDZRM1lBZlJFMW1OdU44?=
 =?utf-8?B?WTJ6ZzgwSC9tdjJDWi92NjRpQm9ldEdQbE80NWNqanlWSTEvRVFZNVNBNGhM?=
 =?utf-8?B?aUJjaU9aQnVIQU1pZFEyS3kvWVR3ZU90aW1Kd0hDUWRZVEowS0ZJek5KMG13?=
 =?utf-8?B?WEt0eW4vQjhrblNCUkNOejVoRGVMYS9kTThhSDJCWERmU1ZMVGhjWG15Z1N3?=
 =?utf-8?B?bVZoeWg5Z21aVHpySGpmcTRpVzJEVUxmUTJ3cXFIWDVnVzRuL2tRcURuNVB3?=
 =?utf-8?B?K3E5QjNNZUovb2FNSmYwQUdocnZFRnI0d2pYZU5sVnNzVS80Qi9FRDZsOHFr?=
 =?utf-8?B?eEpTRHBtRGJaUkEvcVU2eis5RStlMzg0TkJPSlR1dHM2QmFvdHcxQzZ2RFVW?=
 =?utf-8?B?VnRNZnZtckFzbkRnRWo4N0JLcGNTbDRwVk9Ra1ZDVSszZ2Ziak5zMWtnYjg3?=
 =?utf-8?B?VDBFM2w2YTN0T1hTTWFUUzdoSUxOYTNOUlJXUE9WUHB5ZHM0a3c2NFp2WXVR?=
 =?utf-8?B?KzJpRiszVnczWElqZVd3SzBxMmVaZ1hzL3RqWVB3cjQ4dWRoLzdPVmw2OHRi?=
 =?utf-8?B?dlRydlZqR1NHVVBCeEZ5dnVYT0JZMVZrbUQ4TFRYWmNuek5uT1BlcGVWVmRZ?=
 =?utf-8?B?UlhWYUtFUnNQT0VaV3lKWGhRTUlpdEZ3RTRFQWZtVk81bGxaK1BxMmlKQ1ha?=
 =?utf-8?B?ZXBHb1I3bkdpRTZIVzZEUHVpTjEwYUg5WXVOV2ZJem9JTjRZZnBYYm5CcEdB?=
 =?utf-8?B?NlZad0g4eDZvM0tBQmZTdkx5MjRmdmpUK3BTVmZMRWhmWkNsMUVtVEpjUEtC?=
 =?utf-8?B?NzlPSEw2VkxRWGNqVkpvajVVeFV3RmRpZmtKNEdJQUlzemd2b3ExYm5PYmd2?=
 =?utf-8?B?aU40Z1IxZVBxYzUxam1BTGxKM1VDaGk2a1JQaGFTVUNoVU5ZZnpxWG5vaEJm?=
 =?utf-8?B?VmxpU3pHL1VNZnlxcVpCRVVWQ29mNi9UNTRkamRVZWZHYVo4TVQycTdJSGd3?=
 =?utf-8?B?dXA0QUYzRUNBTjcvM0VnaCttNDVNam00b3Y1WGx0Rkl6M3JIbTJPVFp4endP?=
 =?utf-8?B?bU41ZHhFMCtsRmhRQktQYXE1ODBMVVhyMWJ2UWlLUS9HcU5rRkpWS3AvSmdK?=
 =?utf-8?B?RlhSK2s0UjNhYk9leXZ6N1VsNWZKbm05Uk43Yk9uVEtUaXl5QW5OWVVMOWlw?=
 =?utf-8?B?aFhxMXlwRzREbDVsOFpweVM3MU0wVXlxdUh2elpBTDRqMnFaMk5GemZ6d3Iy?=
 =?utf-8?B?eGhJRFA4YXI5SVpUM09PM25DQ2VPcDJ0MG9TNDBUTnVPLzhCRHZzWU15NE9N?=
 =?utf-8?B?eVVZRUF2S25KVkdKaUk3VjBwdjY0RzhreGFXYXN1YmowQWZra1d1Mk5ONkE2?=
 =?utf-8?B?c0pQY3JSU1Z4S0RSME9kZ0wyeDZSckNBQU1wVnhTV0VUeFV1VWhEblI2U0gw?=
 =?utf-8?B?WW84Y3QvSUlhcFoxdVBCeWZQN0tyQVkzek1RZHd2WVM0Q00zNFFLTkZOcWhm?=
 =?utf-8?Q?0anyeCWm1xp09ysYXMD3K0A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBCD65CE6577B943A581883F0E64FF0C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d048782-3b19-46f6-2436-08dd6b7465a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 08:09:42.1421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4zMd/69zKMNx/BcCZykCQusz4O70+eyJvs7MDyDcfcntp7B6YFgdhYhszQ4RtKmPfmneP4E01rvVtQEuN9ECMwB8+bF107nDjVrXHMk1qjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7900
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

T24gVHVlLCAyMDI1LTAzLTI1IGF0IDA2OjIzICswMDAwLCBIb2dhbmRlciwgSm91bmkgd3JvdGU6
DQo+IE9uIFRodSwgMjAyNS0wMy0yMCBhdCAxMzowOSArMDIwMCwgVmlub2QgR292aW5kYXBpbGxh
aSB3cm90ZToNCj4gPiBJbiB4ZTJscGQgb253YXJkcywgRkJDIGFuZCBQU1IyIHNlbGVjdGl2ZSB1
cGRhdGUgc2hvdWxkIGJlDQo+ID4gc2VsZWN0aXZlbHkgZW5hYmxlZCBiYXNlZCBvbiB0aGUgZGly
dHkgcmVjdCB0aHJlc2hvbGQuIERpc3BsYXkNCj4gPiBkcml2ZXIgbGFja3Mgc3VjaCBhIGxvZ2lj
IGF0IHRoZSBtb21lbnQgYW5kIGluc3RlYWQgZGlzYWJsZXMNCj4gPiBGQkMgaW4gY2FzZSBzZWxl
Y3RpdmUgdXBkYXRlIGlzIG9uLiBTbyByZXBsaWNhdGUgdGhlIHNhbWUNCj4gPiBpbiByZWxhdGVk
IElHVCBjYXNlcyBhcyB3ZWxsLg0KPiANCj4gQXMgYSBuYW1lIGludGVsX2ZiY19wc3JfY29tYm9f
c3VwcG9ydGVkIGlzIG5vdCBzcGVjaWZpY2FsbHkgcmVmZXJyaW5nDQo+IFBTUjIuIEl0IGlzIGdl
bmVyYWxseSBQU1IuIEFsc28gY2hlY2tlZCB1c2FnZSBvZg0KPiBpbnRlbF9mYmNfcHNyX2NvbWJv
X3N1cHBvcnRlZCBhbmQgaXQgc2VlbXMgdG8gYmUgdXNlZCBpbiBQU1IxLUZCQw0KPiB0ZXN0Y2Fz
ZXMgYXMgd2VsbC4gVGhpcyB3aWxsIHNraXAgdGhvc2UgdGVzdHMgYXMgd2VsbC4gSSBkb24ndCB0
aGluayB3ZQ0KPiB3YW50IHRoYXQuDQoNCkFjayEgTmVlZCB0byBmaXggaXQhIEFzIHRoYXQgd2Fz
IHJlcGxhY2VkIHNvbWUgcHJldmlvdXMgaW5saW5lIGdmeCB2ZXJzaW9uIGNoZWNrLCB3b25kZXIg
aXQgaGFkIGJlZW4NCnNraXBwaW5nIHRoZSBGQkMgKyBQU1IxIGNhc2VzIGFsbCB0aGVzZSB0aW1l
cyENCg0KQlINClZpbm9kDQoNCj4gDQo+IEJSLA0KPiANCj4gSm91bmkgSMO2Z2FuZGVyDQo+IA0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmlu
ZGFwaWxsYWlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbGliL2k5MTUvaW50ZWxfZmJjLmMg
fCAxNSArKysrKysrKysrLS0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9saWIvaTkxNS9pbnRl
bF9mYmMuYyBiL2xpYi9pOTE1L2ludGVsX2ZiYy5jDQo+ID4gaW5kZXggMzk3MWU0OTIwLi5iMGI0
Mjc4YWQgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2k5MTUvaW50ZWxfZmJjLmMNCj4gPiArKysgYi9s
aWIvaTkxNS9pbnRlbF9mYmMuYw0KPiA+IEBAIC0xNjcsMTEgKzE2NywxNiBAQCBib29sIGludGVs
X2ZiY19wbGFuZV9zaXplX3N1cHBvcnRlZChpbnQgZmQsDQo+ID4gdWludDMyX3Qgd2lkdGgsIHVp
bnQzMl90IGhlaWdodCkNCj4gPiDCoCAqLw0KPiA+IMKgYm9vbCBpbnRlbF9mYmNfcHNyX2NvbWJv
X3N1cHBvcnRlZChpbnQgZGV2aWNlKQ0KPiA+IMKgew0KPiA+IC0JaW50IHZlciA9IGludGVsX2Rp
c3BsYXlfdmVyKGludGVsX2dldF9kcm1fZGV2aWQoZGV2aWNlKSk7DQo+ID4gLQ0KPiA+IC0JLyog
SW4gWGUzIEZCQyBQU1IgY29tYm8gbm90IHN1cHBvcnRlZCBiZWNhdXNlIG9mIEZCQyBkaXJ0eQ0K
PiA+IHJlY3QgKi8NCj4gPiAtCWlmICh2ZXIgPj0gMjAgJiYgdmVyIDwgMzApDQo+ID4gLQkJcmV0
dXJuIHRydWU7DQo+ID4gKwkvKg0KPiA+ICsJICogQmVjYXVzZSBvZiBzb21lIHJhbmRvbSB1bmRl
cnJ1bnMsIEZCQyBpcyBkaXNhYmxlZCB3aGVuDQo+ID4gc2VsZWN0aXZlDQo+ID4gKwkgKiB1cGRh
dGUgaXMgZW5hYmxlZCBmb3IgeGUybHBkIG9ud2FyZHMuIFRoZSBkaXNwbGF5IGRyaXZlcg0KPiA+
IHNob3VsZA0KPiA+ICsJICogaW1wbGVtZW50IGEgc2VsZWN0aW9uIGxvZ2ljIGJldHdlZW4gRkJD
IGFuZCBQU1IyIC8gUFINCj4gPiBzZWxlY3RpdmUNCj4gPiArCSAqIHVwZGF0ZSBmcm9tIHhlMmxw
ZCBvbndhcmRzLiBVbnRpbCB0aGF0IGlzIGltcGxlbWVudGVkLA0KPiA+IGtlZXANCj4gPiArCSAq
IEZCQyBkaXNhYmxlZCBpZiBQU1IyIHNlbGVjdGl2ZSB1cGRhdGUgaXMgb24uDQo+ID4gKwkgKg0K
PiA+ICsJICogVGhvdWdoIHJpZ2h0IG5vdyB0aGlzIGZ1bmN0aW9uIGlzIGVtcHR5LCBrZWVwIHRo
aXMgZm9yDQo+ID4gdGhlIGZ1dHVyZQ0KPiA+ICsJICogZGlzcGxheSB2ZXJzaW9uIGJhc2VkIHZh
cmlhdGlvbnMgZm9yIEZCQyBhbmQgUFNSDQo+ID4gKwkgKi8NCj4gPiDCoA0KPiA+IMKgCXJldHVy
biBmYWxzZTsNCj4gPiDCoH0NCj4gDQoNCg==
