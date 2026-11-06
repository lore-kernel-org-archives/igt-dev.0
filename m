Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE48606A338
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bt4JvS4q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAB410E129;
	Fri,  6 Nov 2026 18:31:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11610E453
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793989854; x=1825525854;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jCqC6BLKLJ30lwrO9Mp5QDxe/lIBkXgzYOz2xBu1lt0=;
 b=bt4JvS4qvy2cEdaBWoQhvDsjzTax9d+qwrnHuT+5/t0r/SGMSqzXXUxh
 OcX2nsDEnkp6DAJtpUY8ZAas94hgybcQPQAm0Q5o1nDYP/GL29RYyhXyM
 Ac3LEvgIl57aRa25phY4FBzbZ54mWfW/3TAk4rH6vAT4YRDI1T0bXId67
 aayCpsA+k+e9BvBCVx2ZAqJq3XszYvAYG4QD8HPcwGN56ya+HvXvxbb3F
 cw24j1lfPTyLszoKQcfLdWnUHGUhh0/hPm6sZZiDrqPgpZKalZwyp1glG
 jAzwQZeU6kjE25TVAX847djKsxsCibmfZPoCB3A+6cbFAtulVSmR7SDdV w==;
X-CSE-ConnectionGUID: 0rWce6KdTTO8u4Gl/F9+og==
X-CSE-MsgGUID: QHfD43+MT4q7AO3meV4eoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2811004"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2811004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:30:53 -0800
X-CSE-ConnectionGUID: 9lL5URoqR+C1KXap81JJ8Q==
X-CSE-MsgGUID: zGA5MhyVTSyURPTAk8Z8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7681734"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:30:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 10:30:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 10:30:52 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 10:30:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8TVkoAp/NlMiJpZ/NtCHSYORLFiq+pStqChJe2Bgb6+3aTIm/8vzHzz6g9APWpopHoWx+pGmF3b9yD1laMsjgztTWompnCV/PWlETm9FbV2K3ziZcdtnAR2AolTUyyh88mBZMX70liY2QUtdZ0vFdHgfPHCNuiG1n5+aavi5pWRYpDbxZtD+aBuGvrdvXaEmkzvfg4rWP4XHF8pYvGSpg35incf43YE3O99xlllZYrt44EWAAAZekytd52UKtHRNfcPS3qWlVXykjHuPQI5FD5pIAqGmGdMQ9DjIXNvSoEJb1kV3VrKiNgi3WW+QYHYM5NZe8CfGhpwrX3oyHVsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbsJBQAHwIAbWqWaWrYK/183C2pRbPLXJdNXahWiFKk=;
 b=EWucsJznPcDQXVS490rt/3f9jZMH8vlGchPRrxqjFjEX1D3qj9FCSCKA8K2EhiahnhSF3dv+T2dDWtE8VGYDR8lSavE92LjPq8VKomdLFLoE4ncC0R6Vrjpl/cUjZzuabvgQElSdhdCMGOmeKEueyc4mgV3gb2SvXVui38dZMv92t9mBdRH+uki4TrjYIl26Kjqx+4PL9BAhe0UY0qbbbtCpAblREop2TijwvLx8yk5AX0Bm07+p+vE3pQApxcOeXh09gpocsZai8vUKvQY01poCqTlp3T3S3JOLp3ebNey7rtQFl+xfXHCDieDpzJn1ovv184b41tlinhVq0P4L8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 18:30:48 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 18:30:48 +0000
Message-ID: <98d037be-9de7-4653-8c06-e425047d849a@intel.com>
Date: Fri, 6 Nov 2026 10:30:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 3/3] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
 <20261105184242.14910-4-jagmeet.randhawa@intel.com>
 <au1GKVdjKPj0Lj2o@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <au1GKVdjKPj0Lj2o@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: ed40e9f8-811c-43ba-7767-08df3c3413c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261028144727099003|261026121527099003|261022105027099003|261102123227099003|261021121427099003|261022075727099003|261026140227099003|261021123027099003|261022113327099003|10067099003|261009223027099003|261009221227099003|11063799006|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: BJNlzmyE4J6/FCSRavSQpG7HF4T5B8NzgM6K+88zTddJr9cZuhuA5Es2eIO3+7wrzVTWBWEM3PiwJKSMNmGE1JmoITeJk4dgNeqvWqi4aidZBOqGYqDpG0pnHAPytp40P56bpBghTJrlm77CF9TkMYU+UR98/Sw0sna55V9Mdvqzp/JTSKKq2jNB6t4HZmUzRuVLyR6erBwIorJlPX1jnDlmdvkJ6hcX3h2Sb+qI/grCJn9UJRzJsbfjsap6MIB11pu0frI+QNl+qu5niwHSgg/lhlL6w0Z54cp0D28ARgTw06TcXseRrLQDUp9UKQdZ9aFM7fnuzlGC7uoFyjxV+tA0MGKCXL5zaWZ52ycW8pQymwH2TDrcJsxc5ZJdj5tecmyokpwx8WYSnnQQTBejn9SBMo8ti733le9jvcI5S7TGxsb16A798mSD5YzQBO3o8xbGDbGUdJHbAYC577c5z/BdMo+0KK/XgXFIJUsKwLZKJL1pq0iJ7PQTRae1SqbxW9Vrm9kUdcvA2FtOGk+h8DV+/idLlFnGKpmu/bONmAeLtSAri6NDeMCNurlelrS9Khm4YX0Rke0u8on9HmlGgs9FLz5PsXqItBV0+22crAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261028144727099003)(261026121527099003)(261022105027099003)(261102123227099003)(261021121427099003)(261022075727099003)(261026140227099003)(261021123027099003)(261022113327099003)(10067099003)(261009223027099003)(261009221227099003)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEE1ekdXYjNVMnh0cnVtSEZWejRKcDlkZytRU1RDVzJrbndGYS9JTjdEcU9j?=
 =?utf-8?B?N2hHRm5iaVc2UGU5UEhGNERid2tkUkJoeVN3ZEVOc1VyZCtwUkIyYWp3ejZL?=
 =?utf-8?B?UkdyU2E2MXc2eEpFbGtFVzFzbFc0T2Z0ckVseHZCS2pNaTNiM0JjS0hyYVEx?=
 =?utf-8?B?NHByc0htMUQwMDNSWVBWdXVBZXRybnBYQmlSb0J0dC9OVWxZRlVBZFlqdjZ4?=
 =?utf-8?B?ZFRaV2pqU2wya3NoOEtqNExIaE41VnNoejZPWVEzTDhKbXVtazhPRWlpakpN?=
 =?utf-8?B?eVg5MUZ3b0UwQWhvR3ptWXdFa2VrQ0FMbWJyNGNOWTVheDgxNXpqTHE0MVZW?=
 =?utf-8?B?dFhFejNSbWpBK3JIejFtTzF6Q25sRUROOXNYZ3dsV3ZkRnJuYjZjYmErSGQr?=
 =?utf-8?B?dldmMHdJTFZ0QTFwR1ZJQXdLdUcwSHUrQnRQMG1URWxGbnFGZnR0eituRXJz?=
 =?utf-8?B?b291M1dCQWxIM1ZWUmpnSXE5K3FuZ0pyZXVCRkxhZGVxWUFFVWU0QmJNeEps?=
 =?utf-8?B?TW9OYm0rSWpMbklaVmtmVWpWL3hNTmZDS3hmR2JBNnE2VTZ3S05XNmtXRW9D?=
 =?utf-8?B?anVjbnZIMkcxNW01cG12TGFjU2ZBWCtUYlh2WDRwOGFuRENPOWRyeWpjQ2N1?=
 =?utf-8?B?Q1k4OVZ1OW9YWHV6RFlLcmlibEhHK1JxNVo5a0w1WGZDcHZJajZkVVR3cEc3?=
 =?utf-8?B?TTF5LytwUVdzTW01bEF1SWZGSGtsZUd2TmUxQ2JOTTE4ZEFBZVp4T2tDdFhD?=
 =?utf-8?B?WklIdkNIK0F3MFdZSVNyVlJJOTJxN2pJemYzOTJibjJzYkN6UUtKQ0N6eWtD?=
 =?utf-8?B?dUY3OTE1RllKUUlMWjVMVWJ4cG91U08wVlZTNEl4c282bkJjbVlreEJXcHNG?=
 =?utf-8?B?anpWMHpvcmVqaEhyWlJWdEJBQ3JqdFNiRkY4NSs3cFV0YjZaeG1Oc0w5cXN5?=
 =?utf-8?B?VGxVaG0xdkRiR3oxOGpFcGtyTFpia0VRSFF5MG1FU3lGaHJLSnNaY0hkMWsy?=
 =?utf-8?B?czM0RmwvdlpRNWltcmxJUmxWcVE1azM3L2hhTmJYZFRaZi9zeCs2RlZidW05?=
 =?utf-8?B?cHloMnpONHN5K2huMW5Ma3UrL0NxakhFNXNJRTcyVHk4dk9GdkVGS0hFcVhO?=
 =?utf-8?B?KzZpVG9IVkJpOUxpQjNrZlRMZmc4NXgxb1Z3aDlneWRqZ0w1SnFQRGRNQzJz?=
 =?utf-8?B?b2QxUzBLR1VoalhQaTJzSFhOSXJhQ1U5U0xKMnJ6amwvbDQrR21rbUQ4LzVP?=
 =?utf-8?B?WHBoUXVUWjFhTEJ0TWE0aHBLMVJrTEZIZ05wOFV2anJZcmtialZ0RXpiQjVO?=
 =?utf-8?B?ckJmTXM5bjJEMjdlOERZNUc3RFEzVUV1YUJnblRIQStOOCs4aWRXcjdodjJP?=
 =?utf-8?B?U2xDUFR3TFJQaTFOWm0vdU9ZK3VlNlZSdU5JeHpYMnVqZVlCRzFQV3JocjE5?=
 =?utf-8?B?eVRiT0xhaFhSUjRYVzRVK2lWWXdoYnNlNkdDbXYwSDVMQzRJcEpIamZwWnlr?=
 =?utf-8?B?ZTdMSFdpZnFZVFFkMHJydDJVS01LSkw5MmhKY2swQjkwbGxCQjllUzRDYTFk?=
 =?utf-8?B?cVVwWDVPUlNBQW9NMEJXUTNFZCtnVUw3bzF3UTRZL2ZKcWFSMnhUdHQ5NjNF?=
 =?utf-8?B?eVVMZ3FXdmMyUUp6UWRCbndOeFVmQW1OUG5TU1Z5TTlwdTJoUXUxRHBOdE9O?=
 =?utf-8?B?aldXclYxTFJGNHYraGI5enBIVVhrRkY1aEtyRURIY1h3N2Z5U0hpRXFUQ1lG?=
 =?utf-8?B?a0dHVGZEM1FXNjZsK0wwYXVPRlpDRFVVZnFXUWh5LzJWSnRQVTN1MmVyNXgw?=
 =?utf-8?B?U1NLbUN0aEUxQjdDMmNxRlpzQ1BFSUllQ1d5MDBWV1BOWnJwdmx4Q210ZjA1?=
 =?utf-8?B?ZmFOSnhvY1F2TzJMeFAxczhsaHUrenBCaXo0N2FQNWgyb3d4QjFBcEpMamV5?=
 =?utf-8?B?eFBZdGtSQzNsVTQwMU1KcDg2RG5KWUJIT0FYdlFZb0ZkN1R6RDRhMlBwRWNG?=
 =?utf-8?B?NEFQdmduRzhpdEhjbFl0aTBXRkdLWjNRQkVkUk5SMTlTeExFWHEzOHhwMnlR?=
 =?utf-8?B?M1RiaTBLUWV4eUhFR0VuQU9XakpQWkdlakJqRUJnV1I0cWJTL0lwWVV3SnFT?=
 =?utf-8?B?VTIzUGZ0MWN4bXpWem91NmJ6VDljVTFHODkwSjdDNzRNUW4xNFg4R0JkdS9s?=
 =?utf-8?B?dkRHNXZzMWo4K0lCWStzMXZzT1RsRGJFMy9HTVFENitibm5MOTBUUjY0TVRt?=
 =?utf-8?B?Ykd1S2o1TXdjcksra1U0ZHNERkpjejNVM0JSWHhRTU9uUkJIN2hmeis2TXBu?=
 =?utf-8?B?aEJmR25GanJBeGFnUC93UmNvcHloTVB5QjhPSmdEdENYaUtrYnI4akYrWFVD?=
 =?utf-8?Q?3t/xjsufEE3M1TJM=3D?=
X-Exchange-RoutingPolicyChecked: vlosdM/wYRHi7vqUDFCMKdt9QxiD9ntCtQJaGQAaus0lsimG4QUPGJhapkLPMkPp+4SZ6g2QWdpgL9kk9tziuYtvZwloYb6hUo1wddn2zf3ZyNqUb5LLOBdhkIO05bFbhF9os4T1RT1Sxy3ZbKYY+D+u07DO3gYEp4HX0fpUdEa9RyppugoJhl0R1dUp4c47Z8WnERZ63t1FmNXniHLzcOaKa0XptPeE9KW1CFZbtHB3zTR/pol3DtSpxHI0TxqYbOWgeXkXl4OrPH01X9sxTuJyqw0Je7huf7p0l+WMZ1ehboyPOcZoZzW6wEkFq5w6iN/rZmIjiWAgDrpPl9eakg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed40e9f8-811c-43ba-7767-08df3c3413c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 18:30:47.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pu/N40KUwXaE300mKs91lZNopDGgr39eXs0c2ovECk8IgaFPoR6FxNm16pBk8RzUGwZtYt1JYO+vJ/wcT0Anpysr6gJI+ZdtwMfcHT7L4no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
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


On 11/5/2026 7:14 PM, Niranjana Vishwanathapura wrote:
> On Thu, Nov 05, 2026 at 06:42:42PM +0000, Jagmeet Randhawa wrote:
>> Add coverage for the replay paths introduced by "drm/xe/multi_queue: 
>> Handle
>> lost message during VF migration":
>> https://patchwork.freedesktop.org/series/165324/
>>
>> A CGP_SYNC message can be lost during VF migration and is replayed by 
>> the
>> KMD on recovery. Exercising that needs a CGP_SYNC queued or 
>> outstanding on
>> a live multi-queue group when the migration lands.
>>
>> A group serialises on one outstanding sync, so both CGP sources are 
>> needed:
>> queue creation for registration updates, MULTI_QUEUE_PRIORITY for 
>> dynamic
>> ones.
>>
>> A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
>> queues than that spans several groups and registers them in parallel. 
>> Both
>> the legacy and the compute mode paths place queues the same way, so a 
>> mixed
>> mode run spreads the groups across both.
>>
>> Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates 
>> after
>> each exec, alternating the values since the KMD ignores a set to the
>> current value.
>>
>> Add three subtests built from these sources, repeated under
>> igt_until_timeout() with a bounded wall clock:
>>
>>  multi-queue-many-groups        registers several full groups in 
>> parallel
>>                                 from multiple workers per engine
>>  multi-queue-mixed-many-groups  the same across legacy and compute mode
>>                                 workers
>>  multi-queue-groups-priority    drives dynamic updates on those groups
>>                                 from a single worker per engine
>>
>> Registration and dynamic traffic are kept apart. Driving dynamic updates
>> alongside many parallel registrations makes an update wait long 
>> enough to
>> exceed the KMD sync timeout, which bans the group instead of leaving the
>> update to be replayed.
>>
>> v5:
>> - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
>> - Move the dynamic array allocation to its own patch, it is not specific
>>   to multi-queue.
>> - Place queues the same way in test_compute_mode() so the group limit is
>>   honoured there too, and add multi-queue-mixed-many-groups.
>>
>> v4:
>> - Keep the multi-queue extension at its only use site.
>> - Mask instead of dividing in multi_queue_group_value().
>>
>> v3:
>> - Use the MULTI_QUEUE prefix.
>> - Drop the many groups flag and derive the group layout from the queue
>>   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
>> - Take the worker and queue counts from the section rather than deriving
>>   them from flags.
>> - No subtest destroys queues, so the churn flag and the queue recreate
>>   path are dropped: registration traffic comes from the repeated runs
>>   under igt_until_timeout().
>>
>> v2:
>> - Drop the secondary churn. A secondary cannot be replaced within a live
>>   group.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_threads.c | 77 +++++++++++++++++++++++++++++++++--
>> 1 file changed, 74 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c 
>> b/tests/intel/xe_exec_threads.c
>> index 6f46781d8..969e845ff 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -50,6 +50,30 @@
>> #define MANY_QUEUES    (0x1 << 14)
>> #define MULTI_QUEUE        (0x1 << 15)
>> #define WQ_STRESS        (0x1 << 16)
>> +#define MULTI_QUEUE_PRIORITY    (0x1 << 17)
>> +
>> +/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
>> +#define MULTI_QUEUE_GROUP_SIZE    64
>> +
>> +/* Enough queues to span several full multi-queue groups. */
>> +#define N_EXEC_QUEUE_MULTI_GROUP    (8 * MULTI_QUEUE_GROUP_SIZE)
>> +
>> +/*
>> + * Multi-queue priority updates issued per exec. The values must 
>> alternate:
>> + * the KMD ignores a priority set to its current value, so a 
>> constant value
>> + * would generate no CGP_SYNC traffic at all.
>> + */
>> +#define MULTI_QUEUE_PRIORITY_BURST    8
>> +
>> +/*
>> + * Workers per engine for the registration subtests. Registering 
>> several
>> + * groups at once widens the window where one queue's CGP_SYNC is still
>> + * outstanding while another queue waits on it.
>> + */
>> +#define MULTI_QUEUE_THREADS_PER_ENGINE    8
>> +
>> +/* Wall clock budget for the CGP_SYNC replay subtests. */
>> +#define CGP_REPEAT_SEC        5
>>
>> /*
>>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>> @@ -362,6 +386,18 @@ test_balancer(int fd, int gt, uint32_t vm, 
>> uint64_t addr, uint64_t userptr,
>>         drm_close_driver(fd);
>> }
>>
>> +/*
>> + * Group membership for the queue at @i. A group holds at most
>> + * MULTI_QUEUE_GROUP_SIZE queues, so a larger queue count simply spans
>> + * several groups.
>> + */
>> +static uint64_t multi_queue_group_value(uint32_t *exec_queues, int i)
>> +{
>> +    return i % MULTI_QUEUE_GROUP_SIZE ?
>> +           exec_queues[i & ~(MULTI_QUEUE_GROUP_SIZE - 1)] :
>> +           DRM_XE_MULTI_GROUP_CREATE;
>> +}
>> +
>> static void
>> test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>           struct drm_xe_engine_class_instance *eci,
>> @@ -446,7 +482,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>             };
>>             uint64_t ext = to_user_pointer(&multi_queue);
>>
>> -            multi_queue.value = i ? exec_queues[0] : 
>> DRM_XE_MULTI_GROUP_CREATE;
>> +            multi_queue.value = multi_queue_group_value(exec_queues, 
>> i);
>>             exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>         } else {
>>             exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> @@ -691,7 +727,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>
>>             uint64_t ext = to_user_pointer(&multi_queue);
>>
>> -            multi_queue.value = i ? exec_queues[0] : 
>> DRM_XE_MULTI_GROUP_CREATE;
>> +            multi_queue.value = multi_queue_group_value(exec_queues, 
>> i);
>>             exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>         } else {
>>             if (!(flags & MANY_QUEUES))
>> @@ -789,6 +825,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>             xe_exec(fd, &exec);
>>         }
>>
>> +        if (flags & MULTI_QUEUE_PRIORITY) {
>> +            uint32_t prop =
>> + DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>> +            int z;
>> +
>> +            for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
>> +                xe_exec_queue_set_property(fd, exec_queues[e],
>> +                               prop, z & 1);
>> +        }
>> +
>>         if (flags & REBIND && i && !(i & 0x1f)) {
>>             xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
>>                        0, addr, bo_size,
>> @@ -1237,6 +1283,12 @@ static void *thread(void *data)
>>  * arg[1]:
>>  * @multi-queue-basic:
>>  *    multi-queue basic
>> + * @multi-queue-many-groups:
>> + *    multi-queue many groups
>> + * @multi-queue-mixed-many-groups:
>> + *    multi-queue mixed many groups
>> + * @multi-queue-groups-priority:
>> + *    multi-queue groups priority
>>  * @multi-queue-userptr:
>>  *    multi-queue userptr
>>  * @multi-queue-rebind:
>> @@ -1518,6 +1570,9 @@ int igt_main()
>>     const struct section {
>>         const char *name;
>>         unsigned int flags;
>> +        unsigned int repeat_secs;
>> +        int n_threads_per_engine;
>> +        int n_exec_queues;
>>     } sections[] = {
>>         { "basic", 0 },
>>         { "many-queues", MANY_QUEUES },
>> @@ -1764,6 +1819,13 @@ int igt_main()
>>             USERPTR | INVALIDATE },
>>         { "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | 
>> COMPUTE_MODE | FD |
>>             USERPTR | INVALIDATE | RACE },
>> +        { "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>> +            MULTI_QUEUE_THREADS_PER_ENGINE, N_EXEC_QUEUE_MULTI_GROUP },
>> +        { "multi-queue-mixed-many-groups", MULTI_QUEUE | MIXED_MODE,
>> +            CGP_REPEAT_SEC, MULTI_QUEUE_THREADS_PER_ENGINE,
>> +            N_EXEC_QUEUE_MULTI_GROUP },
>> +        { "multi-queue-groups-priority", MULTI_QUEUE | 
>> MULTI_QUEUE_PRIORITY,
>> +            CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },
>
> Almost there...
> Given that we support compute mode also now, it would be good to fully 
> support it
> with priority brust also. Currently, that is only supported in legacy 
> mode.
> Add that support in compute mode also, and change the 
> "multi-queue-groups-priority"
> test to "multi-queue-mixed-groups-priority". Also, as priority test 
> also uses
> many groups (though with 1 thread per engine), probably calling it
> "multi-queue-mixed-many-groups-priority" would be better?
>
> Niranjana
Done, and renamed to multi-queue-mixed-many-groups-priority.

The burst moved into a multi_queue_priority_burst() helper next to
multi_queue_group_value() so both paths issue it the same way rather than
duplicating the loop.

On NVL-P the subtest takes 5.7s and produces 20913 CGP_SYNCs, with no 
group bans

or GT resets.

Jagmeet

>
>>         { NULL },
>>     };
>>     int fd;
>> @@ -1773,6 +1835,11 @@ int igt_main()
>>
>>     for (const struct section *s = sections; s->name; s++) {
>>         igt_subtest_f("threads-%s", s->name) {
>> +            int n_threads = s->n_threads_per_engine ?
>> +                s->n_threads_per_engine : 1;
>> +            int n_queues = s->n_exec_queues ?
>> +                s->n_exec_queues : N_EXEC_QUEUE;
>> +
>>             if (s->flags & MULTI_QUEUE) {
>>                 igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
>>                         "multi_queue is supported on graphics version 
>> 35 and above");
>> @@ -1783,7 +1850,11 @@ int igt_main()
>>             if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
>>                 ignore_multi_queue_hang_warnings_in_dmesg();
>>
>> -            threads(fd, s->flags, 1, N_EXEC_QUEUE);
>> +            if (s->repeat_secs)
>> +                igt_until_timeout(s->repeat_secs)
>> +                    threads(fd, s->flags, n_threads, n_queues);
>> +            else
>> +                threads(fd, s->flags, n_threads, n_queues);
>>         }
>>     }
>>
>> -- 
>> 2.53.0
>>
