Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD145606A8A8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kMCZtUqw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4410F984;
	Thu, 12 Nov 2026 08:21:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D7110EB7C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794471579; x=1826007579;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=zIjyeYxngFGaAVfqqUmc/8m+YOUQVYN3Tz210Y9hewE=;
 b=kMCZtUqwffoLZGbFahue/IyLQran8PUt/SNXRzRx3Ewhw2WTY/Z02dsc
 DGceBx4GX+/yMxkB7AppqTPivwoQ4qDBsOXfeC/WHkpPQR7zdjWdb5v+D
 HG7Z9oC3MES+skJfNpeP/lFG0YJoznhaAXyPTVQvwqiSXgm9oMDCpMJZa
 22BkValEX8oBiUefQLU5sWOFuNYLkzPA6KuNl5Dei5O23Sbp9GimkF/WU
 MabownfTt6KCUtDhDeTuAlnOG2DfovN5xCvk/9z4h6i/8zULVbPPm3X/a
 awDr+C+0R84Ke4huSEu1t+g7XflaXn9guVsmy4daLjV2CY7dTXAE5O1oV w==;
X-CSE-ConnectionGUID: aU/MWm9WRKmgBJmXOqhGuA==
X-CSE-MsgGUID: CInCIsXZQZaiQBptxSxQUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3159295"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3159295"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:19:34 -0800
X-CSE-ConnectionGUID: wOti5Nt7Qkmj5dLGXSOhlA==
X-CSE-MsgGUID: JNG23m8BTsOFucOcB+QnMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8944756"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:19:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:19:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 00:19:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:19:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQKpQZrbQUFgErW2xb16qmuutajD96ELEnDqvJJJzPoJCapduincTC2Co7I70gp2k+Li429+S6dN1Ii1io65tDLxB5OEi3Yl2QrK4MT2dZbL5OI3Bhes/4hIH4KzttNKd54bvH1QW+UoJdWRlj2hw3RCyj5aj3A56j9oxlOXL0WW3FCo3FyltdS4sRWeTj2JiNVTrwdC61cLXsK/se1Mwyw8lA26161ZytMJtb60a0Yq2S7GIwn3SOJOomx+rytHxQ1+L9KbBojvY9Yv0gyLaKHqN3OBuCbtdxAzF5EIKdDB/iWd1AiRKtnm5DX8WJ34WMonWkvQbArXZgoQIEpXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIjyeYxngFGaAVfqqUmc/8m+YOUQVYN3Tz210Y9hewE=;
 b=Rp4hm5wmIhaIJwlrM1xcawDWW2bjiNQQIV+Kn8/vCEsEO8XYVo5IKTA0swGzeTfcI4mQaYGkCHOoIaNy5FV/xW9lhCpcICVLC50Sajg1wP0fgnX4bYejGknOvsDQZK6ynsBCRIyqHqZ6CMTg07NHtm4OoCnSD4YCcjJl6w2/MqFNu/VxkrCk9Zjj0OOympqLiKeFcLoGWQtdqyBmzhBzHFlt3rhEDcS3xsHlp9Kr421+RUbJ+hQl3RPYXokD52SLbfbmpGJalbKkv7YrK936YPxHF0xMIUVBgh7/SCuquSoklbPdrOP/vzgm/xiPUgqYVHFBKWK8y3iVx2SdlLSUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by DS4PPFCECA32305.namprd11.prod.outlook.com (2603:10b6:f:fc02::51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:19:13 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%6]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 08:19:13 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kahola, 
 Mika" <mika.kahola@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Thread-Topic: [PATCH i-g-t v2 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Thread-Index: AQHdbF4Mo8MyKY814EiOtRBnFbUobLcqJEIA
Date: Thu, 12 Nov 2026 08:19:13 +0000
Message-ID: <6721148a317b37b9b9ae273f961cdd7cec231fc0.camel@intel.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
 <20261104130737.2549248-4-mika.kahola@intel.com>
In-Reply-To: <20261104130737.2549248-4-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|DS4PPFCECA32305:EE_
x-ms-office365-filtering-correlation-id: 84d8f00f-5846-4c3e-8bac-08df4095a2bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|4143699003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: nokNi10DgzxwlI6mehZaBrwOEHpRqsEGqLZXpS3wgqbqFk+W4vazHVPoN2RtxQJAywVYhznG9vmbjGwjiCuz563HFaFu+5FbOH+7RjMTiDL4xjGiQ8bef08mVUa+izwXUdv5XxCRlxJ8DzQYuI4CiDaZcog4jDqFebqzXD0upCPmrhJjUtsLBRzVH+ykhQmeuvw3/A2CEEd9Xa44cILIoXVrh68NreFlkmcDDZfYCmS0Ii4FKinnrjHcipPZEulesI9S5CXbb4DglMeWhqdLc6QVubp6CVL52XnBePfi5Ueg52tZNIYH1W54vahPdCYofATWM/3TAPK5V0PwZWZU5M+QereP0ChcukVZY8Yg2qHTyGxt8oDMuE+JRLPHikWkGvRxahnWhmbfUDwZWL2SJxW2GryjE3LZKMHBjIUZtmDnT/mAunhIBxJEJfQ79yPQq0FyO1Tc4LlQeHa5evHUj1MIr90WZvbOi9j93W/ALlBonzHbB9lY45cVnmXkzIlHWwlRwcakTydU/hh+dEb1HO4pqZbasgvLC0tge4xf6biDzxk+Z8Kr6eJdGXXn2GEc0oPitKP79Sayowv4G0WVxt5a6e1mUFJZO01gDMfBDt/xxE+C1RhkjBaf3Es15luZMHJ/DW0Z0Y9gEd4XQ00KEzALdSPVJgosNfsE3k5togRRZDg4s3wT0YbwgzoQ3q7DpMJHV6DrhPlYhKjtm7igQ+qUCdQQYdROktIirQW3t1c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHVrUk5BNXFmRm81TE0rNGhTZ2FtZTVSZEtlNE5UVlh2aW1MVEJvd3hZNU1V?=
 =?utf-8?B?OGt2ZDlNekhGY000VU9TTHJLeXJxM1o5YUJpdXI1NW1PTStFcXZsY2h4a0Ev?=
 =?utf-8?B?eVpWdU5qaXFQU0hnRUpsSVoyUGRqRVROcnJuR0pZODkyTUEvdlVpcS9sZTda?=
 =?utf-8?B?SEE2Wk1WdEdVRlZWcVQzNnVBUXlmZnN2R2V3Znh6RXBXSEhUOTRQMVRYSTNY?=
 =?utf-8?B?bktIeldJbzliV0h3T0l0eGx1WmFoNEJUUGo5T1ROcTdSMG5hL1lFckZUTnhr?=
 =?utf-8?B?YUF6a3lBc0hvNnFlVFM1dUlub0t5eDFESkJrUjFoVEMwU0MxdE5NajF4NmhY?=
 =?utf-8?B?UllPTU5zZE4zTUlYNzdGRGl1TXA4U25aSE50aHc1RU9hdGpaOFFLNmpnTllQ?=
 =?utf-8?B?TFJsVXpCTDRUbXZMTzZpRjdmWDk1TjNwdXV5TDN0aTI5dXl5UzhaY2RXOUEz?=
 =?utf-8?B?MUxmWUF4cnAySUxYS2RwUmNHR2Jjcmc3c2dOWEZLa3I5Nkc1UzJ6UEdzeXVz?=
 =?utf-8?B?dW8zSWdKNVJSWjF1SERkZWVoV3BsTW9DdEMwYzBZN3JvTHBlWnpBWW9DazVM?=
 =?utf-8?B?T0MyK21PbWFtbkg4di9PRFZvQjdJMEVXU2RmR2xIR0ZNbVNwRTF2SVpQZGNo?=
 =?utf-8?B?S3lpU1dhS1p6TXIvSzdtdTYxYlZlZEJOVWExZWhrU1lYUEZqQXIrWHRoZXlT?=
 =?utf-8?B?QXBPR1l1dUV0MmJ3bmZaQlM1UDk1Y3prUjRDMlRwZTE4bWRPSnJnYW5waDBx?=
 =?utf-8?B?UER5RzdZNUZtTXNSeGNDdkQwMjhiR0ZqTW9TaDNaY3dsbjQyalJQOWtUL2Z1?=
 =?utf-8?B?Sld2TFp2VnNvK3RFdFgrNnlUQ2Y4UEZDV1pBQ1R5NXl5bDJWdVEyTHFCR3Mw?=
 =?utf-8?B?ZVROUDZNaFVpT1hyaU9DeDlmTVFZUTZWdjR5R255Z2I2S3FqNEtxOXNhVVNO?=
 =?utf-8?B?RzBEU2RXMDJkYzZsb2drdDB6K3JFa1cybnVVN1RpS3E1ZmZPWjFCTFRLZG55?=
 =?utf-8?B?TklOaFZsdElQVkJFMWxCTm4vd010NWVpZlk0ODJ6VjdvZFNMc3NRZHNGN09Z?=
 =?utf-8?B?eDZSa2ROclNlUld3MEkrb1dPNXJLeTV4WkhkRFpGL0poZXJPMUNDbmhSN3JM?=
 =?utf-8?B?VHBhVTczOE9zYzk1U1RxMFZ1WHhZNG1ZYmNzbFJUZis5VCtUb0o4SUNlL1p2?=
 =?utf-8?B?MW8zNllCV2IzeG8yUzhMRFRjcTJhaUcrd05XemsvSjZxWWxLd0xlYzg4Mklo?=
 =?utf-8?B?MEZjekZERzZvcDJTWWdzQXFTZ0cvdmsrN1lWQjlBVnJOaUpXaUVPM2tJaU9h?=
 =?utf-8?B?MmJzdHJ1VWhTc0RhT1hrSERRNW0wcFFwb2djNXloby9BdnVmTFJhVkhCdzlo?=
 =?utf-8?B?L1JWaTVESlM0VGFkNllLWHZnZ0ZUbGhTN3A1UEY1WmloRW01STFmclhTendF?=
 =?utf-8?B?eWo4aHY3V2R2UHNuMWJ4YXoxWGVNZzhscWVuai95NGNaT0xQUzR0bzdtRngr?=
 =?utf-8?B?Yk1lOXFNcXpWUU5RTHJkRkZGSUZwT1hnTDZGMHJiVmxzZWJ2YVhZQnNXdkhB?=
 =?utf-8?B?MUp4c1ZMTUlqeTdqSXBLMVFGdFN1QzJtSmlDcjBxRzVTVU5RcTlLZlJ0S0tn?=
 =?utf-8?B?aWR4VFdWdXdMQjJEU2xkdW9GbUFaYXZOZjVtVHExMzRGOW9xWk1ZNTdrcnpX?=
 =?utf-8?B?VFdub1dGRk81MWNQdkpFRXZOVlRmVEJGWFR2eXg0RE1jNUlmQ0RwQVBHOWdU?=
 =?utf-8?B?NVhzVWVVZkQ3WEFnbzRSbFl1bFV6VmgxZTVjTk9MZmxZR1JhTVR6cFZROTVZ?=
 =?utf-8?B?UmRZSWNLY1hBRXk0WTcwallLcjN0Ukc1czlEZFhMbStrRjlDNVZaYnhIbGlx?=
 =?utf-8?B?RlFVeDh0UHNmUHBTUlZPVE5aSk5LbldURURqWXUwYVgzWG1QdGFqOG9HYWhU?=
 =?utf-8?B?OXN0RGt6Y2QwRlZFMU1VQ1I4T09iNTNhMmltWk05a0VKczQ2YTVaaHhyUFNz?=
 =?utf-8?B?R2E1bGxRc1ZDdHZqUENHS3pzVHUreGZvN1JTM0J1ZXl6b1dqNmFGc0tySDQy?=
 =?utf-8?B?eFVqbmZSYkQzdTRValpBcGVqcnFHeXpYU0JoYVRmSk1mWGszakdHaVM1Rno5?=
 =?utf-8?B?QVJXMXVnTGxLVHFGT3Brd0dYZitVNHV6QWY2T0FQekZFMUtLV0RoeVllSDV6?=
 =?utf-8?B?SWFFN0FZVzJYbjZYMGhXc1lUNk5tMzJLU1Zkc1JRRjQxbWRCbWw2anZ4bFFC?=
 =?utf-8?B?Zy9sVU9kZ093SlVEN1JSY1Y2b1RsQTNkczdUd3dVWmwrblJqV2gvQURaS1VM?=
 =?utf-8?B?aitkc1QxSCsvbkFVaWE3Vm1lV21RaHhYR1VibElzMml0bkRFbm5PMlZ3Nmla?=
 =?utf-8?Q?1bDH0vK7vvH19Nw0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <710249BF26CDFF4E9DB7FE28FF3934E0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DeIqH09nwMYkPz0ZR0IhFQI2S1HLaql+HDdiNv2wzAfLocWye0N4HvchYlYvoi+q7nI1XFbxK7Xrnr8HD54mpnAFPu8uJ22dS365GlxQInF2mIVVV5ktyGxtzR8JSht3g3PtAz+5aaRXc+RMLiRNKkZ16IULwMtI0qMja+INTMI6IV3p71HRtVFWN1xdw9CpyPcBpw6D+pliof0y2zrutUl9UfAmYWnVKva/vRYrPRPyFGejoJuZEVW5aJ8ELfrJkKdvPEer00mtiduzB+PtdH67azZpkVybMzJSoCFNlBoWcOXLVHpSDF8rkmRs0ZCPDtv0xkct+mf7ZI9zoLyhyw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d8f00f-5846-4c3e-8bac-08df4095a2bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 08:19:13.4329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40ntoMhfewziAO7HCNDzbhChia1BrSmgulG/vVxnRfN6Klk12wbyZ1kkMFKG1Qp1CcLghOOoW/V50XDlDDMvD3rRhuyk6dkBgylyVxx45Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCECA32305
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTA0IGF0IDEzOjA3ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
UFNSIHdpdGggam9pbmVyIGlzIG9ubHkgc3VwcG9ydGVkIHdoZW4gdGhlIGpvaW5lciBwaXBlIG1h
c2sgaXMNCj4gUElQRV9BfFBJUEVfQiwgc28gc2tpcCB0aGUgY29uZmlncyB0aGF0IGRvbid0IGxh
bmQgb24gdGhhdCBwYWlyLg0KPiANCj4gcHNyX2VuYWJsZSgpIG1ha2VzIHRoZSBrZXJuZWwgZm9y
Y2UgYSBtb2Rlc2V0IG9uIHdoYXRldmVyIGlzDQo+IGN1cnJlbnRseQ0KPiBjb21taXR0ZWQsIGFu
ZCB0aGF0IGZhaWxzIGlmIGFub3RoZXIgb3V0cHV0IGlzIHN0aWxsIGRyaXZpbmcgdGhlDQo+IGpv
aW5lcg0KPiBzZWNvbmRhcnkuIFJlc2V0IHRoZSBkaXNwbGF5IGZpcnN0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4gLS0tDQo+IMKg
dGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsL2ttc19wc3IyX3NmLmMgYi90ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jDQo+IGlu
ZGV4IGZhNzA5MGNlOC4uYjE1NDg4Y2E2IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNf
cHNyMl9zZi5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMNCj4gQEAgLTQwNyw2
ICs0MDcsOSBAQCBzdGF0aWMgdm9pZCBwcmVwYXJlKGRhdGFfdCAqZGF0YSkNCj4gwqAJaWd0X3Bs
YW5lX3QgKnByaW1hcnksICpzcHJpdGUgPSBOVUxMLCAqY3Vyc29yID0gTlVMTDsNCj4gwqAJaW50
IGZiX3csIGZiX2gsIHgsIHksIHZpZXdfdywgdmlld19oOw0KPiDCoA0KPiArCWlndF9kaXNwbGF5
X3Jlc2V0KCZkYXRhLT5kaXNwbGF5KTsNCj4gKwlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5k
aXNwbGF5LCBDT01NSVRfQVRPTUlDKTsNCj4gKw0KPiDCoAlwc3JfZW5hYmxlKGRhdGEtPmRybV9m
ZCwgZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0+cHNyX21vZGUsDQo+IMKgCQnCoMKgIGRhdGEtPm91
dHB1dCk7DQo+IMKgDQo+IEBAIC0xMDQ0LDYgKzEwNDcsMjIgQEAgc3RhdGljIHZvaWQgY2xlYW51
cChkYXRhX3QgKmRhdGEpDQo+IMKgCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+
ZmJfdGVzdCk7DQo+IMKgfQ0KPiDCoA0KPiArLyogUFNSL1BhbmVsIFJlcGxheSB3aXRoIGpvaW5l
ciBpcyBvbmx5IHN1cHBvcnRlZCBvbiB0aGUgcGlwZSBBL0INCj4gcGFpci4gKi8NCj4gK3N0YXRp
YyBib29sIHNlbF9mZXRjaF9qb2luZXJfY29tYm9fdmFsaWQoZGF0YV90ICpkYXRhKQ0KPiArew0K
PiArCWRybU1vZGVNb2RlSW5mbyAqbW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUoZGF0YS0+b3V0
cHV0KTsNCj4gKwlpbnQgbWF4X2RvdGNsb2NrID0gaWd0X2dldF9tYXhfZG90Y2xvY2soZGF0YS0+
ZHJtX2ZkKTsNCj4gKw0KPiArCWlmIChpZ3RfdWx0cmFqb2luZXJfcG9zc2libGUoZGF0YS0+ZHJt
X2ZkLCBtb2RlLA0KPiBtYXhfZG90Y2xvY2spKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4g
KwlpZiAoIWlndF9jaGVja19mb3JjZV9qb2luZXJfc3RhdHVzKGRhdGEtPmRybV9mZCwgZGF0YS0N
Cj4gPm91dHB1dC0+bmFtZSkgJiYNCj4gKwnCoMKgwqAgIWlndF9iaWdqb2luZXJfcG9zc2libGUo
ZGF0YS0+ZHJtX2ZkLCBtb2RlLA0KPiBtYXhfZG90Y2xvY2spKQ0KPiArCQlyZXR1cm4gdHJ1ZTsN
Cj4gKw0KPiArCXJldHVybiBkYXRhLT5jcnRjLT5oYXJkd2FyZV9waXBlID09IFBJUEVfQTsNCj4g
K30NCj4gKw0KDQpUaGlzIHJlc3RyaWN0aW9uIGlzIG9ubHkgZm9yIGVEUC4gU2VsZWN0aXZlIHRl
c3RzIGFyZSBydW4gZm9yIERQIFBhbmVsDQpSZXBsYXkgYXMgd2VsbC4NCg0KQlIsDQpKb3VuaSBI
w7ZnYW5kZXINCg0KPiDCoHN0YXRpYyBib29sIHNlbF9mZXRjaF9waXBlX2NvbWJvX3ZhbGlkKGRh
dGFfdCAqZGF0YSkNCj4gwqB7DQo+IMKgCWlmIChkYXRhLT5kZXZpZCA8IDE0ICYmICFJU19BTERF
UkxBS0VfUChkYXRhLT5kZXZpZCkgJiYNCj4gZGF0YS0+Y3J0Yy0+aGFyZHdhcmVfcGlwZSAhPSBQ
SVBFX0EpDQo+IEBAIC0xMDUzLDYgKzEwNzIsOSBAQCBzdGF0aWMgYm9vbCBzZWxfZmV0Y2hfcGlw
ZV9jb21ib192YWxpZChkYXRhX3QNCj4gKmRhdGEpDQo+IMKgCcKgwqDCoCBkYXRhLT5jcnRjLT5o
YXJkd2FyZV9waXBlICE9IFBJUEVfQSAmJiBkYXRhLT5jcnRjLQ0KPiA+aGFyZHdhcmVfcGlwZSAh
PSBQSVBFX0IpDQo+IMKgCQlyZXR1cm4gZmFsc2U7DQo+IMKgDQo+ICsJaWYgKCFzZWxfZmV0Y2hf
am9pbmVyX2NvbWJvX3ZhbGlkKGRhdGEpKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gwqAJ
cmV0dXJuIHRydWU7DQo+IMKgfQ0KPiDCoA0K
