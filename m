Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CF6C5CFDB
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 11:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1210E3F9;
	Wed, 12 Aug 2026 11:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNVq5asN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113310E3F9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786533194; x=1818069194;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=p5VBxaGJdhlY6tMFz/5k51hycz/wHjPblM26jRmRBBY=;
 b=BNVq5asNTegfd+MPKhqh/umvDdP4RfMTxEMa8c4oZjs0O7Lj9/n0Fy3e
 27BgmbVHZnvJDwiE0hSl0RpnQR2aIbuIdXq5CCz0xxFYQDv1ziNJaK35B
 q6cfFf+VHr8abdX7JnmXLSEalUdxOeL8+p64hZSbtIl4YfLVUiX+WD3ph
 OggLqJ5FBkqn4WOuxX4xZt9ccKaK5V4XRFyyc/etQVYuLEv115wynN0eZ
 lusD9kDfxXM6YvciaY3/zAtfhUbMBzppsUypjIi5rFTUqCzoZg6VZaD8x
 PDn/ixsth3mtcSxXQa5U0S1bhxag8OZTh/QZ7JzpMNE3vGFqQ40dl9Kta w==;
X-CSE-ConnectionGUID: GhLD04QZRB241dBG6nsSLQ==
X-CSE-MsgGUID: rJElQvpTQ1CdpeykFtevfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97670946"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="97670946"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:13:13 -0700
X-CSE-ConnectionGUID: wf/Fc+2gTga+29dhmDgXZw==
X-CSE-MsgGUID: h+iQ9lomRPS0D67itc/rVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260298544"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:13:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:13:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 04:13:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkYBr48FA/vbbQ2V13PgKkAtjNyvbgkFT3x/oi+L+GWtVr//rKxkmQBzZETOWON6C9UfglKesSpXKDoJUgVWjp03NCFYelzhFagbY2Pz4LiujkC/RNMFumCeUXkSovNVNR55PQ+Wedldg+ax/yvdD/x0cYZYIJ8E8BP/lsO4PJ9O0J+T/JmlaG2FvB6jFNCslomxvKnoO4zanw8m4cXNa44pcCPaALyBnLZxXsVovypNj0fp9myZvj4aRtrY+SCBR+enC1xCpDYx+3onZdBZi+viywwxU7m4/h+eFJMC6oW7g8OEbTh9nrVnvtcPKReZTKdjXcFzpfvFhtkSM3cX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5VBxaGJdhlY6tMFz/5k51hycz/wHjPblM26jRmRBBY=;
 b=u94FFdqetbrjpvf+x4hbV7wKwnElFK8pD+z3tO6z4qUeNrApS5UnRq24RufVv/M2fwDW7YrGOqgwUDu8IkV3BGrI1CGm5A8p1tELi7aGJGqnofwDPXARhr25Ss4fCYA65j3vYaKeGcwJtC3s0HsMETNmIpbLKKrG8IxYMjR0j5R/vUFkOSPYNZ3zWdFOjZjPgy+oHbLBDSJM5CEPSEqlGh711zthqrXP1Lcot0B5FAtfl++KVlmSYrFl9otiAfWPNixUAyxgL4nnzysY5leDuhRlCpNY+N4L+ngkDS8i00R8/yn6nk930KfKu23lJDbZY9UGrc/KduKjpcQMeCC3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 11:13:10 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 11:13:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Aug 2026 13:14:37 +0200
Message-ID: <DKMX6XPBFN3S.1THJAO8XC7U74@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] intel-ci/i915/blocklist: Add sriov tests to blocklist
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <20260812094514.1362168-1-krzysztof.karas@intel.com>
In-Reply-To: <20260812094514.1362168-1-krzysztof.karas@intel.com>
X-ClientProxiedBy: DUZP191CA0038.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::22) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS0PR11MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbe0b75-3590-4561-ed02-08def862b187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: FHaZceFUdnLJtyDVlmbqJzzXGQoLusdllAY9CTwplWF++cblF2tcExX+NUNBnEY9hrRKUQrEx4kduSDCGWGMl8IUIkp2JXwGSBx01hfVPq2Vu2fkP6FtsAAPK8EVI83lA7Ia9fHE+D2CPA7ClwWqLh39h9YME+i4JN/sPk6xYbNtmeXizFTHZhxdqQ7RJ1dzvO3N3llv8WUAVtaxySK7Nya7JS1IHa1k2393mrzOUdpQmLvHywU3bbvIrkF1jejZIg3KgYL+a8V0YrI/ofcj4rmIJsI6+hEWUbl9OK7mvpIbkAu3DmX1hsrI72utGBuu2G7PQKe6GlwLF8JnAMvxQZt6yg3OwGJEq8mEr9q9OT/T2bui0yl3KprNV8Ax5Xur0i96IOFOjL6TakWCFoKAGBw+6SRL4YfwPA7BSJN7pj5rPgph7H1/Ik/7OPlR0OarMD0r45pNWKefSS1owwett4IAruVQt7tRrx8T3norU4UGDoyoQHQi7e31f8MBkSBK/ZGVgUYlJQ0Qffk9U0ehYXGUuDz/1gjN69+ryiflAPwXFcitnrJqL2Hi/CXyhbdWoXfChDHaN0XmfqeyGoLT5u8BcX2FrCqu2b0iuXrtfAmB3fIsaD+auhLw6SiNT8Dn0pmfw4QWHXK+8iTEbW/tqj+3+HJ8kqPYpxwdEIcB9z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnlNSHJKNlNzMXZ4WVR4TGpRbGNoV0Y4SFp0Ni9Ed1VHRFRvVjNLRXVHdW5a?=
 =?utf-8?B?SlZSZ0NMOEw4S2lJdGhnU0VUTGF3UUZSaytGdUQ5eHNGZWpuYzgya0xyOHZn?=
 =?utf-8?B?WEpiSld2VUdrbTZmZG9MOU9VSjZtb0paQTlsaXZTZVdQK29PRFlaa3JBK1VK?=
 =?utf-8?B?VDk5aCtoUEtVdjR2T1hMdGxhZlIwR1lhaGtTZHNGT0trUGxzd0krN2VmNjZY?=
 =?utf-8?B?dEU0TXI1SEltRTY5K3YvdktiN0RacXJvTm82Zy9BbTFOM0FVL0QrNE5WTjFo?=
 =?utf-8?B?dWFqTEdTakVGK1ZzYUg0UURJT3Byd0M3T1IrRXJhRU5yNXNZN0xlU2RWVUlW?=
 =?utf-8?B?WkY5WW5mMDhaeXR0QkVsMVV0RDFFbTdGMCtFaGtoaDg1WHNJSlNZNVJVcTly?=
 =?utf-8?B?bXVobU0zdXVWaWJUWkY2SlBiTXg5dUdZZENJNXIwSktrbEIzSjNPS3RzQ3Q3?=
 =?utf-8?B?TjE0TE1jMWVXUllTTVVtcERaY0NxTHZNWjhVa2Y2U2ExckoxdDhRcWVEazlm?=
 =?utf-8?B?TVlBZkEzdGNmeUxSOFhvdW9iNGFaOXp6WWQ1UmZ0Mkczd3gzWUtsSmRENTA0?=
 =?utf-8?B?NldkZnI0cms2NmJYeUJLeGdJdW1ZOWJCSUxxekdmSG1UR2s1cmpGaitTc3hI?=
 =?utf-8?B?ZUIwUmp3bDNvcWtBa21NbDRDdi8wZ2xzWm1TdjBibU5XWTJMS1RWTmVFUGtB?=
 =?utf-8?B?TTMzOEdBMUtRNzEvVjk0LytoLzRUOXcxbGxnUkdDNm4weDBZTUh6bURxVDdq?=
 =?utf-8?B?cERUUGcweU5pNW5OQmtrdk0rbi9aYkprU3YvT1d2SHBhelpjMTNxckl0dlcy?=
 =?utf-8?B?aFBWZGdFcUkvc2VqYTFXeTFkWmZ4SGtaaS9YZSs5Z21KSDZxQW43N0QwOXZ4?=
 =?utf-8?B?dFE3ZUVwWjg1RFlKN2lNcWhoZnFzZ2xvNlRVUTBnUUs0ZmIyQlJ0MmRVdWx3?=
 =?utf-8?B?SVpncFlqSEpoYmNRUFYzMFF0eEpLdm9nK1NkNEZ0WTFIbVEyanBhQlA4cGdx?=
 =?utf-8?B?Ty9aU3JXVjdxTE1JNFFYU29MY3ExNXhwRlJuQjRJQmtVaWNDbjBLZU4zY1Fw?=
 =?utf-8?B?Q0hmdzllRWR0dk5ZeExqT3RzWDV5VGh2SUJPTFNxNFpSVXlBRjAxeG4zUmZK?=
 =?utf-8?B?N01GZ0FHeXduL3hXZXFDaHBKVkgxMko0N1NmVkhhZUhlWnM0eG9qd1dnczdN?=
 =?utf-8?B?NDFqeC9VVzYwU1UvNVJDUml6R1RtcFlVU0VrbVd5ckFNaDErZU9sVEwyZHJY?=
 =?utf-8?B?OTh1cXZEbWNmL2lRS3VZYW8ybEZPNGJlWnNMaHd0ZytpZGtZMkpqVFg3YzZC?=
 =?utf-8?B?Q285TFI5bFExNUdWRmdKVm5QS1RhWktpVFdndWt2RzRnNGk4VUE5bzFGQTU4?=
 =?utf-8?B?YlVSVmNFOVp3YVNZeW45Z0wxL3RVL25lYWVPbXBWam9RRVpHaGFkQTNhVHJD?=
 =?utf-8?B?anViS2ROQm54MUc2WmlXT3hiZ2xHMzI1a1pCZjQ4TitXQVlLN0RsNmZ5VGt6?=
 =?utf-8?B?RktYalRlR2NnUkZheVZRdFI2dkVYaGZNZmdZbUl3VmlEc2hnS01wZTVtYVM1?=
 =?utf-8?B?WlhZM0dKYTc5c2VqL1FjNE1aRlNQOUlITFoxQktqWE4wYThMUHNxcFJhY2lI?=
 =?utf-8?B?TDJZMllaNzNMWUU2WHpQRlhObzdDOWNlczBwcVBOZ3RuTERCdmNpRGxsODBZ?=
 =?utf-8?B?Ulhrcy9iR1NJNmowVGNnZkh1cDBNMlJMNWFLSHRoeVA0NHl1anFHNklqL2NB?=
 =?utf-8?B?T21SNFFnaXlCUGhUQ2trNkJBd0hnY1BpczZsb0w5Z0xjeVFTZ25qQ2w1RTU4?=
 =?utf-8?B?ejd6emNVSkllRThMbVBBd2dlbVI3OW04MFdrY25abk9JR3FSNkNXOEZBeERo?=
 =?utf-8?B?R1JJZThhR0FTL2IwcUhVNnRQb2p4QVRMRjB2c1Rhd2FPRTQvNCtCTm1qYTFn?=
 =?utf-8?B?bmNjWXhVRElmRGJJT2lzRkltVDdGcVh5b2lENHlKZm5xUHBMclhVNUNOQzIr?=
 =?utf-8?B?Y0Zhd280R1FQbldRY09VZTU2U0w4aFowUGJ0YXlqTENpRjhTdHFLT0psNlpk?=
 =?utf-8?B?d3c5Y0dRZXozTGozN3R5ak91ZlVzdHVBM3NQcnNtdzdqeDFEZTNKbCs2cnlm?=
 =?utf-8?B?NXdVRHJLTlNEUkJaRWJsWHozelNETUNMckZrRWlkUUllVzNYUlBjelcyZzJj?=
 =?utf-8?B?Wk8zeUpHUDcxWkZtaEdwOGxXMXcxWWNpbUNwYU9DSXNiOXMrazcxVUVtcWlD?=
 =?utf-8?B?Mk9pWTdFQjM0VEJYdTdaVGJuWHhRUStDVEVYdDdEZUZ1VS9XcEduSjZwNGQr?=
 =?utf-8?B?cnlUbTFiUkRBS0MyejBmbjMzeEZML0ViL3RUVDJNK1lESThnZTRSeVJkbWVB?=
 =?utf-8?Q?SdZynubJNtAt4WfU=3D?=
X-Exchange-RoutingPolicyChecked: bzmF0kERgulXYzYxn6bNU3IE25Nfaxjt5i5eobe5Jtj9lfhYi43sKx5V8vXXfpe31x/mzQh0pi8r9m2lr83Z1v9OM9xgi0AKmLI5k7FzMyqc63r14ojZ1NkRXteo9ihmejJckOT0fomaJ4uAIilWiGEwm8CXbM7fDcyZvMmugGrkhOXaoGcATG3en1OLNQQmCRH7ClATNR/JOzIm+DMG5nadpMbeH2kveQPxw22OFBmcEN1qsCc33yGz14f3qTLj/UkogahtnXnIDBqOdC3K1c4JCV7pRN4E7WCgei+niNvaUVE+aWvMEKbKDP3wbBSaHg2bQr3vbWeEBflmaVSO3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbe0b75-3590-4561-ed02-08def862b187
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 11:13:10.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ0PyK7yPB56vV++8i7QGt0RnqFwB6HvKMIj+NYrSDwxy1Ch7f6hycU0W6Dk/ruakBBmTxVqjOxpDMT8aAIuj9963uWf0HEtFNfz/ovfuiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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

Hi Krzysztof,

On Wed Aug 12, 2026 at 11:45 AM CEST, Krzysztof Karas wrote:
> With addition of commit c9a41149d843
> ("tests/sriov_basic: Validate PF unbind with VFs enabled")
> a set of sriov tests was enabled on i915 machines what,
> expectedly, produces multitude of SKIPs in our CI [1].
>
> Amend the problem by disabling all sriov testing on i915.
>
> [1] https://gfx-ci.igk.intel.com/cibuglog-ng/issue/24557?table=3D&page=3D=
3&page_size=3D100#query_key=3Ddc51d83bc41c2b44b58762c6cd35195d043d85ce
>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

