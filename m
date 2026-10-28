Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52592606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=my/zCrgO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CC010E06A;
	Wed, 28 Oct 2026 09:23:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B3510E5DE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793179382; x=1824715382;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dfCFk/RJA+pu1fz6Pth9bmWMJFmvFZHH8Tpl2jZ3JGQ=;
 b=my/zCrgOp9UtwVzZqlN31WO9jiejBHX/H4TF3/2BopHrT0xHfvmyogGx
 fuRIta2/wdVELajKviMhFBugbubPfxFf7FFyODIEpropXUbyENH614ZTJ
 WgPEAbOUfnXktOO67vxgd6mu28bvWUwg01RQhrw70ue7MV4MfT6UhgMXF
 LLd0MzzXPgmhVwDugsKohA46Ib13j1V/GKaqoCXihYEnYcpXSiHNYhDh3
 ISGwOyi4OFbmM5IjA+RnAUX7qL2iFW43Im7ojr2eIj7LI/KwNx/oP4DRR
 hcTTmoEXrWB/FJYFe0LpE/++lNZ5IMYL/W6kjYxDG0R+7BhcS7M8CpNwq A==;
X-CSE-ConnectionGUID: z4TwSo/2R/usKAPRSBxv+Q==
X-CSE-MsgGUID: s5NDOucvTBmVNofb5+Tptg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1787247"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1787247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:23:02 -0700
X-CSE-ConnectionGUID: iYzrh2OnSeqRLss0I72rsw==
X-CSE-MsgGUID: d/NE44voR2CtUJc9AXZ8Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5314703"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:23:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 02:23:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 02:23:01 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 02:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3lVjTT9bv069IbtIfe03TW7WkzCYIMSwB8ZHK45kWQlQ2AsA9VTjbQ0AQZbKMcVtt08wCZ7YtMjNZU1815cC1942CImLws6Q4W8pmwn+RUqCevK2O+kRrXAOaJYsJJAGL7FXk7yp56tO/o1Fj4bGbp1vx2YiLblNrWqMgtyEMrK4aARHHjq5ITBDJxHnhBZvbIm+nFn3E4kmWaQ6IjOw0BiPdLpKlf5vf8Pqm2ggO+ja6Q6Hdfpe4D9nGtwzxuO5AmJjxlcXtP7bi1Fqw4EYAAeiicD5yC++VBBrQlXkTODlqjARYsc5RDx9OhObqwGo6dii8lKrqcL01X9CdM2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkHCOeqpsA38ky+LO99pN+9Bb2H7iCn1GRYPLNPzxtQ=;
 b=aWIOi0y4xZNiznAvXFHWSmYR8HvqMtGlOOmctnLdQWjmmOTb0JfgBvrAzlAunjOtKtwoj9+efmr2Qf/bP+OoUglQabEWSHedOKaUprKyEUCdcuUBn19jFH9RFMImH7cNNIDtsp05tGZGAzLxMl8nJ20/dj7nf1YewkHYL8Mxn1QfQ67MbfscmfV3aqRq4hCdtudRZgAEtQY5GF1R1KiU5KrzsQtBU5W5PGWOygbXo3gG/ATGSPo7fjea9jNbRxCiCO7J+lfZ8i/uK4/bm4Leo6VJFpFg38psnDYw/CWxOOU99115GBUINgXpoKlvJRoB9k3rA5gtVNbQl1U0Iyq3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21)
 by PHXPR11MB9661.namprd11.prod.outlook.com (2603:10b6:510:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 09:22:59 +0000
Received: from SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3]) by SA2PR11MB5035.namprd11.prod.outlook.com
 ([fe80::9418:cd60:8ece:69c3%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:22:59 +0000
Message-ID: <5d7189cd-9e1f-43bb-9015-be712d2333e4@intel.com>
Date: Wed, 28 Oct 2026 14:52:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld#
 nodes are found
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
References: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
 <PH7PR11MB6053FF9ACDBB32795BFDA3ACE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <PH7PR11MB6053FF9ACDBB32795BFDA3ACE76F2@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::16) To SA2PR11MB5035.namprd11.prod.outlook.com
 (2603:10b6:806:116::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5035:EE_|PHXPR11MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: ae329b75-806b-40c6-dcea-08df34d50d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|4143699003|56012099006|261009223027099003|261022075727099003|261022105027099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: j6evJygkUdmg+Z1hVpMq2E9HfrD4+GSFiK1ozYeYwKFnZHAYLw36k9magebeGQASjR7kc/TVPEhQL2kLQ3h/6WYyfhbTRH+s/jJQ99eqiPhjzJC5lqQyAw5vSBXnUMKknP8W550cqpe5s1brHrsMUHJE+5LgxihMHINCk84SD2qdLqTCs8u0VZgVuhmvxc4vqq+aPEeR9znfTqhkX565a7xiAnvG2+1C7SLk9u2YTRFHrvqrf4sBb1zeZQ5Hq9ftphcIcxCZM5VdCwB5i9W846P3KxEE0tj0VOph9GRTdg2bQRnY3UxjDUjQOvE3MfIG0QoOBkGyYTbMR3wTx6/8pG4CH09ZX//TS6+aXaycUC3LPe18AQHAKQs0tHUzY2lzBGu7iWCsiLFpdQT2kb/Yg68ak8QdPOPTw+H4n59iisTPrvIfnIdZUVD4WSeqg1cJ2DRZE9/8ZlS3ZKUCejRiYUisrWV1W8Uan/YKM7Sopyr1FpdKnAACC2t5W18tFh0Yl+7eCYcYnX8ZsSh7leOT1EEZUGuVqa1/WUsQ3pKBtr5j+YB04TMkEKSN7iLeOp/d53H8dLdBWufpYH0jhAq/KSc7WBI640BMd0uYAydCPaAVW+FOuwF5o23d+Bv2I0HFR3SXeVhHxGNQUpQu1+ClSD8IzUdv3TtIgDjPXBe1c5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5035.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWtnZWo4VXFqYkhuWXRlS053V1JIMEdubTdWYWlRbDNkSHVGcEJKRmIrcCsv?=
 =?utf-8?B?U04zK3VpRXl1RzIwV2NIM1pxZFBEWTArL2VEekc0SHlNQ2VPMXdpd2FrWVhj?=
 =?utf-8?B?UUNpc2ttWEZ4TE5hYVBJSFZKYytxOENhc0ZXOEV0SEkyeUJFMEhLdzRKbzlY?=
 =?utf-8?B?K3ZaM2RROTEvakFRODdyVmFSM284bHZsRHo4ZlVVNnZoWThHRnJHblZBTG02?=
 =?utf-8?B?YlpRQ3prM0g0d2pYZEs1b0xaeVltU0NEWGR4ZzVXcWRVSFpNMnJwbVFjdngr?=
 =?utf-8?B?T1RLL0xFakFXaHh3QU5raFJMMVEyaHdBakJoYmY0UmV2c2FDQ0lNZ2JDejdp?=
 =?utf-8?B?dUNlWWVsZTNmOEphNTFmb3YxSVJFYzlEQmhENlFZMVg4RTRZMEE1dlBTaDVP?=
 =?utf-8?B?elllbHZzdGFuWlZkcG1LaGJSV3VhTWlMUm53N3kyaDZVREhpenZSbU8rUWIz?=
 =?utf-8?B?bjVpOVJ0YzJIZ0VmVnpVOWgwSUREK3hubGxSaWRtcGVaRllmZXJqdkRVa0ly?=
 =?utf-8?B?YVd4V2tweWd1ZWRteVkzN1JxeGkwcWpxS3cvUnA5L2EwcGxBSUk0Z0MzMGFE?=
 =?utf-8?B?YkwxUkhrWnEzZ1VWamhMbjg5VkJDOUVycUpDOWRKUzcxdUNodGJQeDJxRXBl?=
 =?utf-8?B?ZW41aGlvRWhXWTRaUlZYaVVsQ3MvanpIT0pzTHB6V2lFWFllU0xWV282WWgy?=
 =?utf-8?B?REM3b2xkVGY0UkZOS0Y3WGpZdGJDbnV0b25jeVhVck5vazZyZkMrcWtSdmls?=
 =?utf-8?B?K2k2VDJUSTMrOFMzRkhBUy9aRWdlOSt4Q0JOaERGRkVXQTAzU0NOYnZnVEhH?=
 =?utf-8?B?MktqSXM5Si9ONEs1VTNkTWR6MDFoSzFFWVNES2ZlbDdPR09uN050UitmaitZ?=
 =?utf-8?B?Q3NjdVg2YUhlSktIRUpPRE84VWpOYzJMZzFKZXpkZ1NKWTJlZjJHWDZ4R0Q3?=
 =?utf-8?B?RzUzdktxV3A2Y2JxaWZLOWY1NHErVEQ2V2dieU41TVB6N3E0ckxWOFF5ckZX?=
 =?utf-8?B?cnNmUFJlSElHYjhXdjg5OUZLV1lvRE8yUHovV3lVaDZCczFjU2JnaWpJamIr?=
 =?utf-8?B?MjNtV296UmZuR3RZK01maURTWEtsUS9ObFYvbWovZVZhTFVNdncyQmFNSjM4?=
 =?utf-8?B?Q25oK0d1WnRzUWhOcjNKdGNUVGlPVC9JVi8wMDg5Z0piL3FpUDVuVlNiZTZ0?=
 =?utf-8?B?NkQyOFJNYlNOM3VLL0JGMTJBbWw2YmtEZmw1L21UOUZEYW5GeWwweE9YZ0JG?=
 =?utf-8?B?L0hjcVZhK2JvdUJPMWYyZzQwQUZnenVZYjhRRDNmRUNSZVdrTk5VK3czZjZu?=
 =?utf-8?B?ZkJZRHZubHNHcG5LU2dKSHY2RFJ2Ky9ZaWMxQ2t1Um1HVmFldWE3d1l3RjVk?=
 =?utf-8?B?cWpoaktHLzQ4aUlnQ0tLZE9YU1c0OW9VTVZ4VlBRazhRTDE1d3ZjVi9TTFNX?=
 =?utf-8?B?MDJGdFRNbm8xaVd6SWtQeVlpSEZGWUlTYTRMWGIrdDRtWEZ2TmpmRzFXSXFp?=
 =?utf-8?B?RDFPajZwNElDSndNaHFhWUlVUDVkbElDclh0Y0tJdDVaRGYxOXpQMFo3Rmxm?=
 =?utf-8?B?NEl1a3JKeUdMSVlGbk1GL3NLdkhoVERTeE9GU25qTy84UHZNc3YwTGdLVG43?=
 =?utf-8?B?cFVQWStZZ0hVOGtoOG5nVU5XaGl3S09kZFVJT2FTcjN4RHNoczBxWENtNUtP?=
 =?utf-8?B?REJIYy84R252QUlRVUtOOEJzT3B0enNFUU5uTXhxSm8rTm9rREFodWVZam1J?=
 =?utf-8?B?SXJTd0JMd3M0dFZIZHorUmpsVnM4VkJTS2tVbDUxNnd5L1krR092RVE4Y3Rx?=
 =?utf-8?B?Y1hBOGFsdVlVcUpjbzVvOFZvM0V3ZGxyY2V1QmwzTWJEYVRaZ0RRQXlFbXlF?=
 =?utf-8?B?YkNQS3Y2NXpYNE9WWTlzV3JnYVc2WlE2cTQxZ0YrdFZwSVV3aVJPdlIvVzVq?=
 =?utf-8?B?aGFwNm5wTXpUeTQycW5GUVlsWDdoanBCSWI0Q1o2SnN3U2JsYjdhVngyRHVS?=
 =?utf-8?B?US94QXNocWkzVTRtUVpXM256Q2c2VnVWSXZ5cU8vc2VIVGVmUW9qKzd0c3FL?=
 =?utf-8?B?cU9GZnQ3K01mdDBhNGMzZFM5Qnl3WWVwNkFCMVU2S2tCbjdWMUhvblZPMFJu?=
 =?utf-8?B?dUtxUENsQ3hGblNabU5Qb2hleFhXUEJXVjBsa3p0dUlWVk9KRTI2eDZDVWEv?=
 =?utf-8?B?T0pkcWdhYmVINGRRcjRMNmwreXQzTmU2cU40SDFJRENFdGNOUUFsOHlUS2Fq?=
 =?utf-8?B?bDZNNkoxWURlQXB5MFZyczBwdDdJREZUZk5hTGlRNCtvQ3NKZkRvRzUxdFhp?=
 =?utf-8?B?N3loY0N1V3ZPZVAyNERYYXpkQzdMUkJYSkkvdjlTdXYwNzcvV293bnN6Y1or?=
 =?utf-8?Q?KNk6TtNs0p63Vdrs=3D?=
X-Exchange-RoutingPolicyChecked: XmoBREKTLLt0+PGrv78uJm2m+ynpIfQgBrnMrE8GUHULOMvHj9QKOI+K72iRdQRT4qfx7lpCrPqal5PiZxP/ksJ4WiU7dusuDmIvytNQShEynJewvGLvs/L36yl0t/Z3/b6eiGbNpS6WTdHnBOfTUwFPbYWSaOtwgITTOysLrogT38SCXQwX/6AwRgKHmvF0J9GEnmWU8f1ZfNV/DoZF1FKPRkxyeFpAzDjJnB7C0S3Y6Ly7Tcvh7FRBTc6zI95TDJnpVGyQncMSAUZu1lzoUDxGQD64ORSQCRYEd80YWHswLt14VCQFSQsHYwxL3OsRxWH8NoqcyM834QtvNrjizA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae329b75-806b-40c6-dcea-08df34d50d2a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:22:59.1147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 229cTQzb2/t9NvPZgB+69e75g7MxVqWO0Z7rBOomgO8yaOLCKQYcU4+KhT/3089VhrgADopgPG0o00WuDfztOXDPksrgArAu+10fyJ+UD3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9661
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/2026 2:23 PM, Samala, Pranay wrote:
> Hi Chaitanya,
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Chaitanya Kumar Borah
>> Sent: Thursday, October 15, 2026 4:56 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B, Jeevan
>> <jeevan.b@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld# nodes
>> are found
>>
>> eld_is_supported() silently fails when ELD procfs node polling times out.
>> Log module load state to identify whether audio drivers are loaded when IGT
>> attempts to read the ELD nodes.
>>
>> Cc: Jeevan B <jeevan.b@intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   lib/igt_eld.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_eld.c b/lib/igt_eld.c index 896ab0e6b..bfb83a213 100644
>> --- a/lib/igt_eld.c
>> +++ b/lib/igt_eld.c
>> @@ -36,6 +36,7 @@
>>   #include "igt_aux.h"
>>   #include "igt_core.h"
>>   #include "igt_eld.h"
>> +#include "igt_kmod.h"
>>
>>   #define ELD_PREFIX "eld#"
>>   #define ELD_DELIM " \t"
>> @@ -301,8 +302,15 @@ static bool eld_has_nodes(void)
>>    * for a bounded amount of time before giving up to avoid spurious skips. */
>> bool eld_is_supported(void)  {
>> -	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
>> -			ELD_SUPPORTED_INTERVAL_MS);
>> +	bool supported = igt_wait(eld_has_nodes(),
>> ELD_SUPPORTED_TIMEOUT_MS,
>> +				   ELD_SUPPORTED_INTERVAL_MS);
>> +
>> +	if (!supported)
>> +		igt_debug("No eld# nodes found; snd_hda_intel loaded: %s,
> 
> Use igt_warn/igt_info to log in CI logs. igt_debug won't log without --debug.
> 

This is not needed in my opinion because a test failure already triggers 
a debug print in our CI.

>> snd_hda_core loaded: %s\n",
>> +			  igt_kmod_is_loaded("snd_hda_intel") ? "yes" : "no",
> 
> As per my understanding, on SOF-based Intel platforms (with DMIC/Soundwire),
> snd_hda_intel still gets loaded but aborts its probe, and SOF driver bound to the
> audio device instead.
> If so, this would print "loaded: yes" even though it's not driving the hardware.
> 
> Would it be better to check whether the driver is bound rather than loaded?
> 

AFAIK, our CI system never loads the SOF drivers, let me know if you 
have evidence to the contrary.

==
Chaitanya

> Regards,
> Pranay
> 
>> +			  igt_kmod_is_loaded("snd_hda_core") ? "yes" :
>> "no");
>> +
>> +	return supported;
>>   }
>>
>>   #define ELD_MAX_SIZE 256
>> --
>> 2.50.1
> 

