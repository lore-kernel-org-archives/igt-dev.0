Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC95CE7B1F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 14:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE22410EAA1;
	Fri, 14 Nov 2025 14:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGz+QboH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E32310EA9E;
 Fri, 14 Nov 2025 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763132249; x=1794668249;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=vwk8W/O8biKnLkh+MzZDsBZA6GRYWJv+AQ6LCjMBwmw=;
 b=SGz+QboHJqGZq8pUlae/KDmJD5OzU+IjgDe2nyjgetEyTnG7nYOO4A8l
 3tuIKCTxHNCSc3pBFA/09uOeElCksTIYq8Bu3KVPYZ1MPqwzy29lPrinV
 FRMA5qhjAisgNjOrZiWjOhg7aWxuGBdS3iov7QtnQNdRr4DmdKXA5fpnE
 Yag3oPcHBtMeVDc1ZCSilXngIcokCsO2Ji09VAKXmyve7qwyI/jjcTkTX
 CV1l9sMVrWMYUederRYZNk+aO/KTupFRcwbFYOGEIdD7zSmsDIQfFH1gp
 dxp0CnlEququN796kcWKe1x5s/y/jPoyiNrX6vD+XCWXAvAi3uHLs4XxO A==;
X-CSE-ConnectionGUID: W82cSCL0TTaVdZ4h/FqvjQ==
X-CSE-MsgGUID: NCbzM5lOTlCvWhHXdI6aew==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64432195"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="64432195"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:57:29 -0800
X-CSE-ConnectionGUID: xY3eP8I4RB+HrVtuFY26cA==
X-CSE-MsgGUID: oDpFFqeYS5eXbkNp+8MiQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194236484"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:57:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:57:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 06:57:28 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEFcY+iurvU3Jg71TSeSWG9zDcqMvgwMpAFoUqz+TJsi+CEOb/XM6RYcLzbfOqyEchLKJgXk0cAelRw9Z4ljyLsozoP2V7xeUocFqHJdpK8QdqPN47dkov2Ab1Tr2wIoUeuMoDoT6h0RwL/zIBMxDOl71joJ5+WW62WdjHlPs5194wHt/wpksMYtyX1lTHZuk+mR7gIfaYiHrLLpX8kJCUk5nAU0gq4ky2RhZIbZN7jw7H3YqwIY++pVY9y2Psg50CSBmEOvScGRqOQlNLv6yohuryhQn1qRqIqHGl3H4Zq60tzQw3P+RjwswhUJTED2aLj+2GVoC9YSTRMF/SDLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J3ZwengVf8h1GawOV1+I8uWIVCy1e25356YelRnkhc=;
 b=j2abBUh3ZmJ7R8YgQqeYh3PY6uvhaR+YwlEodZ8lcbRQxMPrOqsoO1Swi05M6Pm+468LtrjBtheEq60+e6jLp0NuC3Wk94p4i1gJDAU1sP1WDJtTJr4XSHy/89ncho/oMUUtWeZ28yuJfT+cp/4x7JqzIIsUiiEaa9L3b+aZKaxDOJDkk1/YlPpMrhBl636+nCmZWyMShfhBgq4nJys+w35jgGk9l9uT+8tqQOcn026JKrrVlecNUtAIGM+PTfUv5U06NvR9K8OihKUGMBsK64At+biUcl7uQBTBm9D085ns6j1g5H1/+aFd+8I+qfYBmEu7vpoonUeI03wu6/qGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 14:57:26 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 14:57:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176186542321.2568.6118375932854363162@10055242dc62>
References: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
 <176186542321.2568.6118375932854363162@10055242dc62>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for igt_kms: Rename igt_pipe
 member enabled to valid
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Nov 2025 11:56:58 -0300
Message-ID: <176313221877.3698.14641940805484775456@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 2154a4b4-d997-44d9-ee41-08de238e2015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGpwQ3pRY3owQ3lSMStDRkdlMi9RQ3BYZmZiQWdrSnAyVHpiblgxR0ZZa1Mx?=
 =?utf-8?B?U09waVlrU2puQnp0anE1ZWFXMnFKd05nU3AvcXUxQWF4QXhlL290MkdqTGdr?=
 =?utf-8?B?UFU4YTlycHU2ckF0dXZnWnliOUxGMVRSRFRrYzZhOTd4N0txLzBXWXdrY25X?=
 =?utf-8?B?TDVTS2lZNkdHN1FadmJyRW9nbHlGWU9ydkpMUjFSWEc1ZW1EOS93SU5pc2h0?=
 =?utf-8?B?VEZEMVVFaTIxMitDSnllNllnZDdsS2RhYVdFSUVQeVJpQzRvNGNOSUs3dURL?=
 =?utf-8?B?dHduck0wMkg3K2pmNzVlcHpxSlU0SDBGMitBaHBQbVl4bG9IeWNBd25Hc1Fo?=
 =?utf-8?B?U1ROdmJnYnVKTFlsMmVuWmlpZmNwK2dMYVI4LytmUHFnOWhrS0gwekxSNFIw?=
 =?utf-8?B?T0JTUkx6ZVczL1lmVjhOU215YVE4WWUwMGFkQ0pwK2tGSHR3MFdtSW9NRmti?=
 =?utf-8?B?cDJ6QUtyaXVmSVRIcmJveUd0cjJNYXlxdFdsb2tYQ1RJNHRnUm00T0pqQVEx?=
 =?utf-8?B?bG0xSG5DNVpWOWJNc3dSbjRIcVNnYUxPZGlKaExjblZuTW8rK0l5R1BVSm5w?=
 =?utf-8?B?d0IzRzU0ejRGNUp3KzJVUW9JTEFiNUtuQW4xMkY1Y0ZJbWZZS2toSS8yOUhG?=
 =?utf-8?B?dTVTRjhTSHZ4bHB6Z0RaYUkwbUprRkVQZ1V3S0xNbktOdk5MV1lQZ09VaDBB?=
 =?utf-8?B?Z3RtN2ZRbWFWeE5YcmdIQ3dYTERwWkdPZHJUQUdtTElyV0NLRGhXK2M2bm5C?=
 =?utf-8?B?RzMrQVRvcThaWmFxcGdiaStNaFRpZ25IWVdtTVg0cEg3NEdHWi9MYjd1MEJw?=
 =?utf-8?B?R0tVb3pIV0ozM0p0VVlXQW5QamM3c0xGaXg3QmZvWVU4WEZVZFI4endLbnhF?=
 =?utf-8?B?RmFsOW5TV1hheTZUK0IzakRQVDE1cEtmSVNUVDNPTGJRekVhL3VLem9KTk9D?=
 =?utf-8?B?MkpFbHUyK0FLbU1nLzhsRER6SUxOR3ZyZ0ZwMC8zNEdTMWs2UEVYWnVTT01u?=
 =?utf-8?B?cTY5S3dtYWxhVnYvZnV3S2hNU2dIMitUQ0sxaCtCT3o1SXFxUy9PTGZrY2Vs?=
 =?utf-8?B?RTJCOHV1bnBhY0dFdXh6RERRMWNtOWhqN1dzNTIyTG1YVU8wcFl2MjhXTmNk?=
 =?utf-8?B?WFNxY2tYTHlUTUljdnRnLzNPdU5xTnU3bDcydWFtZTA3eXJRTUxVQnVkUWMy?=
 =?utf-8?B?TVNJeU9CdmJicTMva1hMMFhjNytwdTA0TU0xQ0hjdWEzdzlScVdrb2NONjBP?=
 =?utf-8?B?SkttOFQvM0dUUUtONVBYZUpXdjV0VUJwSlNydHRDMTRZZ3hXZXJXMTR0SWV4?=
 =?utf-8?B?bHJmb2cyaVRKMDE0TFJjWEpVOWl5YURMQWVlUHRPSnpqZ2VpRWZQWm9FSE5G?=
 =?utf-8?B?V1o0UFdnRHRJV1JkbkVreStydnhQa0VPSTc1Q29kWFNxOTR4eGF1Umk0ZWhu?=
 =?utf-8?B?RnU2Y0I1SW9vaWcvV01GNVJEWm9KR2syekpSNGFJSjA4VkhjKzJoKytENTRB?=
 =?utf-8?B?UmYxYnk3Wk1FMnVXbTVYT1BKcEdmdGRVRmF5b3BxejRRVWFGdW1BaVJ6QmNU?=
 =?utf-8?B?WXQ1dERQY2gwRFV2TE44QVVPMHloKzM5dDNDY2xHblJQVjU1VnlGQktid0dZ?=
 =?utf-8?B?UEtnOS9BRzlPd0FOV3g2ZXBka0ZGMWxubEhMRGlEY1luUnFQZGFlLzRIZ012?=
 =?utf-8?B?a01WQXlVWTkwMUNpM3RwR21ZOFFtZ3VsbmNhaGoxRVc4ajRJc0tRZ2h2cnl2?=
 =?utf-8?B?blREN3RHb1NYdmZkSFRpV1VxSm5sQWdSMTRtaERqRnZxR3pBVmJOWVRxcy9K?=
 =?utf-8?B?VlFLWno4OVBlU21uYVVlNnM1UENpV2RMZnM0dFN6SG1nbnhQOExnSnFLMEk4?=
 =?utf-8?B?bXhNRDM5S0d0K2xSdm5QWkhUUEFHOVRCbjZwK29vQlJYZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkhkTStCUTZFNWpRdzB3eWlVR01QRmJ2Z1BHSGZzcEVsR0J4SXJLTFU4cjBo?=
 =?utf-8?B?QzBwR1l0bTYxbWJVbnFuampyYTFxOFplZCtvUmtjTDd2OU5QRVV4Q3hSNDZ1?=
 =?utf-8?B?TytmbVBKS3RuVlhncWV6RXMyT1FDTHZYREZkL0pUOGp3OEJWMW5VSlVseUhY?=
 =?utf-8?B?MkI0WTNGSFRzcXhKa2luOXRBQTFhQndwM1R3bFZCdURBZXk2cUhiY3pwZkdl?=
 =?utf-8?B?WWFuWVpEcHU5YzdPcXgxV2xNN3hqMk1HTzVOQ3lXc3JDMWRZbThxUDUvSXo0?=
 =?utf-8?B?a1VCb0JiTHZQL2FjQVlXdkNpWXVZL1JSZ3N6QkRVdjRKSFJYdkQ5UllMOURo?=
 =?utf-8?B?cmd6Z1NMZGlBYWlZTmgyck5qaHNxN2l2VStLRUwyKzduNDJjbXNaZzdXUElU?=
 =?utf-8?B?alN3Vjh5ektOa1JBU2JINzBNMCsyamNkYlRpbXpXMDFxa3Y2YktTTUNhaTBw?=
 =?utf-8?B?V3JocXFNbWNJM2czTnJyY1ZzQ0IzYVFNdVF5UGZFZDhIZ1lVc1ZRdmhyWmcy?=
 =?utf-8?B?UkJDMGZEZWIyS29oR3Q1UmYzdFVDZ1FrWkR5bTE0WkVMd0syejFwejNyczdm?=
 =?utf-8?B?Mm9WemRoWkF0TWlGRE1aT1R0ZllPRHBYbzljTU5OYlQ4cUlZMHZNMUcwNkF3?=
 =?utf-8?B?b1lHUGRCMVNVeDN2ZGkyamdaSkZidHVTVnFwOTdleDByQldFWFN0eTdpY2w2?=
 =?utf-8?B?dUxUR0tjSTNqSlc2S1JsTk5DcXRTTDhTRlRoWmUrV0lXbmtSVkFRWlJHcXQv?=
 =?utf-8?B?ODk3L3czZXFhb3BQYnI1WThtWnh6Y0dkTjhoSWRVQ1p1Rmc5OVp2RldIWHRs?=
 =?utf-8?B?ajJSNUg2alRWbmVCWFFJcnlEN3IvSWdIZXlqRDM4RUI1ZUR6ZHYvanhjOERu?=
 =?utf-8?B?YnZ5RGp5Z1VZdi9KNVJ4cG1HNkdnWXM2QnJpa2ljVlI5aFBqTXBwd2F0Mmda?=
 =?utf-8?B?czEzbE00SFpzbThwQ3p1aEloa1dmemFJcENzaHQwZnZxcWg5d1NFdW9QZW9x?=
 =?utf-8?B?aVp2WTNmMzYxaDV3QzRlQ2pzdG1KZ1hTTmgyR3pvTG01OGtFTjFNN3dLemRQ?=
 =?utf-8?B?eWs3TXg3eXpOYmJmZXFpc2QxNlI2OVZScTdLcUZPRzdJdEMrVUdUc04wU25r?=
 =?utf-8?B?TkdJTmhtZUk2elJRWkFoZytCeHV2dER3NVpZWUhSaktSUW85YlR5MFU0NG0z?=
 =?utf-8?B?MCtXSDhYUGRFckMzRU9QZ2pHSjlXbjVSRDkwQUoxeWVNSXRWSXJITHJTVCs3?=
 =?utf-8?B?NW5pK2FqLzZoUTFORU4zYXBaM2JPSHVvdmZBdXdFckhkaXdEdWZpNGRxUTFp?=
 =?utf-8?B?QVlSR0FTTEhlaDVMaU45M1Vud051cmY5NmRwR2NJVkZjNVJWWlIyK3hUb3FO?=
 =?utf-8?B?bUNSZlRGUlFrSVhFWmZWUmJHeVd0TlZMbXNPNEFjeDRQKzIwUURJZ0svQ2Y3?=
 =?utf-8?B?cEhPS1NaNHFrS2NzdWZoSWpWWW5lSU44SFdDUVlPblNyaGw2Qm0xc0VJMlZx?=
 =?utf-8?B?ejR0My9xMmVVbU5FU2FiWi9ZektmYmR4T2xTS0JzOGpUbnFjNEVJT2RpdnVB?=
 =?utf-8?B?cDgzYnFwMWlPcmFiV0FXbit1NGF6bmZzYWwxNVc4WVdFdTZSUzFkTExMNDV0?=
 =?utf-8?B?QndVZE5yMU1jYUZNckNCdWxlM2lmQ3JLU1JZQk9KYXRpbTZ0R1FEWFlXOGgw?=
 =?utf-8?B?eTQ5bmVCV3FPOCt5Wis3SllQeUF1VmFYU09LVExQdW5ydjJTMW9jU3Y3YWdN?=
 =?utf-8?B?VTR4alpncmVFUUp2aUVnb0ZZWnpTblBCMTRCd1Y4ZGZoQ2xGSzU4ZkxrYWt2?=
 =?utf-8?B?QlpGYzlsWkNwTkdDUFhzeHVTQVdJbVpUejN6OUFCMkpPUjZ6RVNySGFLUkdh?=
 =?utf-8?B?WTJubEhaWWJPKzJ2aEM5eTAya0MvMEk1Z3d4VUVwVktaQ1ZpV2NxdHdPMTYy?=
 =?utf-8?B?SzRFcytkcUIrZ1V4ajNmVHJzNEJnalZJakpsZ0w5MGFhZThaazh6blVNbG9Q?=
 =?utf-8?B?OFdVb1UrUXE0Mm9kakx4NEpPS3ZUNXIvYlVUeWFSQlNjOERWVmhNSHBWdmRY?=
 =?utf-8?B?TDlpbW54WXBIcHN3dFdtSitzOThUUkZUTVFiaVNGWGE2ZjFHd0FTdzJCM1k0?=
 =?utf-8?B?SFpmNzQwUWVoMG1TOVVERXNNazQ5T2VHb0JabnZ1QjNqOGFHeHpoSldRU29t?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2154a4b4-d997-44d9-ee41-08de238e2015
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:57:26.5571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nlufPHPA2IKDx1+UY8oo0ScTK7FYPIfc5MgU6QzRAmMd5SbWVoMukfuBjcL1XS3ppos+aI/f+u3YwRVqncjpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

Quoting Patchwork (2025-10-30 20:03:43-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: igt_kms: Rename igt_pipe member enabled to valid
>URL   : https://patchwork.freedesktop.org/series/156749/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from XEIGT_8603_FULL -> XEIGTPW_13964_FULL
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with XEIGTPW_13964_FULL absolutely need t=
o be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in XEIGTPW_13964_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 3)
>------------------------------
>
>  Missing    (1): shard-adlp=20
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in XEIGTPW_13=
964_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>    - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13964/shard-bmg-7/=
igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
>
>  * igt@xe_drm_fdinfo@utilization-single-full-load-while-active:
>    - shard-lnl:          [PASS][2] -> [INCOMPLETE][3]
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8603/shard-lnl-5/igt=
@xe_drm_fdinfo@utilization-single-full-load-while-active.html
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13964/shard-lnl-3/=
igt@xe_drm_fdinfo@utilization-single-full-load-while-active.html

This patch is a non-functional refactor that renames a struct member.
The failures above are unrelated.

--
Gustavo Sousa
