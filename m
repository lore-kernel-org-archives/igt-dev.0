Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB3606A321
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gsfhExNB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AF810EDE4;
	Tue, 10 Nov 2026 06:00:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFFD10EDE5;
 Tue, 10 Nov 2026 05:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794290394; x=1825826394;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=fVAu7nzFKBCbKGP72UYzCAgtRNxmnv5HOvOO4NaG41Q=;
 b=gsfhExNBus2gfpdIyFBuSkC+Uy2xv/TrWjkMGvWyTpYOvtGAwS+2O3z3
 J0maAQ2DHV+ZdZ8zMdACRhZlTIIcdoiHgHSUxd46jZ5h8jKqIhpqndl5E
 Ij+wtMV14C52jzI7wOVnE0RAFztq+5ovNSKW2UVyOJeYZB9zBoCG1F/8T
 iAm8bANS3L7Nm6+zgiLTLCyIjpTnm4noZnCt8mWS27Y+420Y3u9lHJaBI
 vnC45VAEbm2Z1P3vhM238xYMH6lvO3wVNoC5pSMPeQV9hVxRM59J66vd0
 YkpwQ7h2R8sLCAdv+qdjHZmgJ4AqtGgs5NNKb+T0CAyNlfQQ9xtDlwDuB Q==;
X-CSE-ConnectionGUID: DAs5O0u0RVefLOdBwcND0Q==
X-CSE-MsgGUID: alot6yOYQIaLCd5izVYUbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3041647"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="3041647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 21:59:53 -0800
X-CSE-ConnectionGUID: dEyB8zniRIqSaXLbR+bz7A==
X-CSE-MsgGUID: a6DHuGdDSaSIKowKnQQvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; d="scan'208,217";a="8492456"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 21:59:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 21:59:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 21:59:52 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 21:59:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5T85xU8BqEscsf5yGfd8SgaQqAK2tKTpw0u4RxKm5BODoVtz9bfQgefSwr3mKAripVBpHmDWr3YE5K47S7msN2Lpv/oW/4b/fxIAxhcN+ZWR7WUCz5/o5wGpShSP6abuioZrSui46nCd+EvZ0WEBu5gGn7f2ePm2p+BSMGUmNbl7QGajQTejUY+rWR7laRt6XgGZr+d6/KWbG9NJGb2gs+3vbgMON1fZuWeUYVEx5k8y7yMS/0zXBYY86FcEEWQ5fk2yHb2R+H4ZRs/fhY9NmrjI+tD8UOv+yejFQL5ziILEUCoq+OEHzTOZ1vCM592DQENkRlgemgP4hnrZnEFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYKuTAthapqq5GJ+94NuLltvb5mozOfjODY/5FFR+E8=;
 b=X00YaGhzwgRGSJZHiudN9/WFKdJUOotoyDkDrKTAoj3TnDWPfzC/9Q0oybgmu4fJn7kb8PTi+HGon+Zel8NM9fHPMP+5rBmmTkPbSv6VvO14fWzM8t193yCR10fACAetkJTR9iumIn4Nt4izHV72Gx4G1ZdcRnx2dG90nDTQJKYp2RnXwlSooQnILrDb/VP+zvQe8Umv8SD5CL7ZBJZsHAIMIbKSksescAcHKR2ePjqIn4WzE0+XWuNo9GOfjVIFL/t6GLtqOcCpUPed1c6dSG4/CtHCxxTfaj7+852C4U2uuZpUELT70hkqsyTxjtuBnfe5W28uMErVAquG3sZy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 (2603:10b6:806:538::23) by DSVPR11MB9744.namprd11.prod.outlook.com
 (2603:10b6:8:352::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:59:45 +0000
Received: from SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841]) by SA3PR11MB662844.namprd11.prod.outlook.com
 ([fe80::cd9:c00b:a7aa:e841%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:59:45 +0000
Content-Type: multipart/alternative;
 boundary="------------GoCVkkSUicWpiXmOArGCTb6F"
Message-ID: <485a4c1b-6951-4322-b198-ef2eadf39c0e@intel.com>
Date: Tue, 10 Nov 2026 11:29:37 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fwedged=3A_Add_cold-reset_wedge_test_=28rev8=29?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20261105123002.1368655-4-sk.anirban@intel.com>
 <179396244596.131701.10125068638083303910@221881a7231d>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <179396244596.131701.10125068638083303910@221881a7231d>
X-ClientProxiedBy: MA5P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::11) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB662844:EE_|DSVPR11MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6495d2-8fa9-4d36-ee47-08df3eefd199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|10067099003|13003099007|8096899003|11063799006|5023799004|4143699003|261102123227099003|261021133027099003|261028144727099003|261022115727099003|261022105027099003|261022113327099003|261022075727099003|261021135927099003|56012099006|261026140227099003|261021121427099003|261021130227099003|261026135527099003|261009223027099003|261021123027099003|261026130827099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: dn/1WbYs0AugylhlGdmFmnndkigQJx4DACbMu9NDc7ZinlpS14LRm/nTjwIFmN1jC+Axcso9fh8MWjCruih4TUdznTSPsSvM20d136oqzJtVb3c+GOeog6rfxckxXo7Jbz/7L1Bh7dGsqbeVeAHrbQOOlN2I7qs+R0QximVe491MM76Bn+kjYDidnWQL1ZK8zdG0fYE8qLN5t/edE4IBcD0FXuxogHZRglMj7BvBcQPTvueKn1tEngJz637k5qzZpblxJZSmf/umlCIQ0DkSPH8opmiBgyO8SZfXDsf1PSFSGtLeComsMt6GycW9g9AtPKODcyZuaoVd7Mwf9URg4L3gsiOWLNxzRWlgJs7VQ9W2S8g2K6DJp5mMtq/fvG34DeqyKVDaJ9NFceVMI3ByzaNBtS2om4aQa8LF5bJsag/qQnLbKLN7UKTrtXVse/eO7MfopQ1yrisQS+to+IiXBQ0l371KMOM7zPQzWTolW3QndrmvidmZYMAkUIZuxk/sOS66GLKSrRdrEI+ilPXBM4/DRCVMPKGhiHiRNWTIU7na/LcoFUOAyueqjcfmXqo2zJuwn6lNBrz0HRnFbfwW+cAqxDaRbe7wkNupd/xzne0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB662844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(13003099007)(8096899003)(11063799006)(5023799004)(4143699003)(261102123227099003)(261021133027099003)(261028144727099003)(261022115727099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021135927099003)(56012099006)(261026140227099003)(261021121427099003)(261021130227099003)(261026135527099003)(261009223027099003)(261021123027099003)(261026130827099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENKYmV0Mkxxb2pTMERWL1hjOHFJdjBRdlRHVlRIK1dsNVN4R09CZ0k4STJp?=
 =?utf-8?B?SklML3NqT2I4b1BYZ1hMTDMybklzRVJCK1ppRWZFaFZXR2JBUjRHNEZSQStS?=
 =?utf-8?B?L0QzdlgwZ1F1a3Jhb1BoV1FsWmN2RGdlcHRxYnVsbG1xc1RLTUxGZTV2VHNM?=
 =?utf-8?B?Q0hwRjdLdUo4aHRiUmc5T3p3WVZSdm1jTWRJSGk3amJPZHF1ajNmRDN1MW9k?=
 =?utf-8?B?K2p0M1J6K2kwMmp5TW5pRzhIZGZORVRsTzByWE1Nd29SV01HVVJjd3l4cklI?=
 =?utf-8?B?Z1hWK2RQblUvaEVGWGVqS3JLTW5DeGxyaE55c1VSYzhETHlhc2FuQVFpb0t0?=
 =?utf-8?B?bkZOMk1WSTdzamRDendnaGxvaWNHdjJLVndJbkVvblByZlpHNldHeU53NzlM?=
 =?utf-8?B?Vll3NWJkNWZEdGZzTjBFVGdZSFkyejBpa2RLQmdCUjRiZlBKN0ppMmtRSXJN?=
 =?utf-8?B?ejNTbWNJZkZZOWZ5Tkt5T0JGZmthQU1WSTg5ZkdNc3haYitZTzQwdmtTZ2Rx?=
 =?utf-8?B?UUY3S1YyTUkzWGtTTWR1M2VoUk1ENW4zQXNhQ3Q3KzJ2TDE5MlJ1UGVMWENv?=
 =?utf-8?B?TVRZeVVmNFFIQUVnSi9JU0taU2tRajhzanllcG83V3R3bjNKL1g4TmVWMits?=
 =?utf-8?B?c3lMSEt6Nkk1eFdhdmJXNGFKT3U2Z1BJalp5aFRWNmdaWXBwQy9WWnJFa0Nw?=
 =?utf-8?B?RTJQMFRmaXNDaUpQR3ZOQjhydG1vRlVXMnhZdG0zdDR3Qi9RTk1VUldId0Yy?=
 =?utf-8?B?T2NKZm02MncwTkw1YW9FR2ZpM3BoRE5SRENMRnVWNjdDS0Zqc3RUbFVNa3BX?=
 =?utf-8?B?bWFqbm5PUXB3bjZ3MXZrZkRqbkY0UndQRmxjbHcrYlBSZU5TZHZmTUYxdE90?=
 =?utf-8?B?ZUkxRVNkWVAzRTBJckNPbmExSml2Tk84QjdjeFdPWXZpb2JIbFh6UHZndGE5?=
 =?utf-8?B?M1NQcFdwNitldzlnVE9vTFlPVDFnTU1ORjd2aDlTbnB2Zk81QnVqQVpmUWI4?=
 =?utf-8?B?RS9RN3FGMWRRVXBxTnYyTE9wUXlxbjcrcUZoUkpTUUhyVnQ5cklZRnNXa1VH?=
 =?utf-8?B?TVNOMGdjUWdXbStuS3FKOEtsblFyc3d0S1R4aCtlbHZyNHY3RUxBcG5Lek9E?=
 =?utf-8?B?bkdUV0R0RFF2L3d2V2s0UFBpZmdYUmNoSlplYW5UWjg2V3hIdHJSLzBIeE5M?=
 =?utf-8?B?ZC8yZDEzOVdzbGo1WUxBa2VrMEJCOVFJZnhMVkRidjYyMUhOMUNCUzAwNzRk?=
 =?utf-8?B?cHA3MytJQnRORUdhbFVzZmN6bk5UbEpncE4xU3hKektPK1Uyd1hHdElRTW1i?=
 =?utf-8?B?RU42eTg3a3YrOW1aamxDSnFRYWU1WStjL3J2V2V0RWtZU2JHYW5KUWhKU20y?=
 =?utf-8?B?aThKdlUybGtyeDZSMnpFazFzTjl0VEtSbmJZV0dyNDlQZjkvM3VGRjNBODFT?=
 =?utf-8?B?Z2k1UWFnM2pCUmh6U0NZemk3SXZTc0QwL2kzTUxDMWdUSkZXVEhOa2lNSVJO?=
 =?utf-8?B?Q0U4RE9vUlRORWgwams2UldONEd1bjk2S1hFU3BIOFNVNmZrMXlVRkFyZTI5?=
 =?utf-8?B?eUM2Z3NwM3pFeVdPY0dTUUxtcHBmSnYyRHY1OUczUzQyUzk3Y2V3aWJIazNv?=
 =?utf-8?B?a0plRzVHN1hJVmhJOEl3dDFweFpheGRQYkVVSmpucGE1VURlSXh2ZS9mTzNx?=
 =?utf-8?B?aEZ3RUQ4c0RmY1l6dVpqbVN1U0pvY0lBbG9DRHlxbytxME9VVzZGL2YzcHNt?=
 =?utf-8?B?L25xc2lLK2RqRkk4Tmh5YjVZL0I0dGNrbWcxT2llRGFWTXBBYzI4M2Riak9K?=
 =?utf-8?B?SE9yL1lqQ3hRNkNhV0pPR0lXbUM3cnpndS9RVVRHYjJrdG1OZDVWbkZManh5?=
 =?utf-8?B?eVNuUmlhTGdNTGw2TkxTNEp3QnNPdTdOYTgyODdXSjd0eDZ4MkdwVHF5TDVQ?=
 =?utf-8?B?KzJuL3hPVjQ3R3JydmVYY2d4VGdWYVJEOU1hd053RUJHZXBEUDJEcmVmYlVz?=
 =?utf-8?B?WW5JcHpsMmdVa3dMZHo4TGtJbnZ2b093UnRqcFlQTTBwMHNiWmY4NlROUDB2?=
 =?utf-8?B?eHdXZCt6b2JCRTR0d3RNdUd2bjhlT1ZqaVNtVFl4NU90OWZ0Z0lnNGgvWmdE?=
 =?utf-8?B?ZmMrL2QzNWE0dkJIbUFDSGdISzlrN3ZmM0RCWVNPdTV4SU5LbnRXbG8xWGVB?=
 =?utf-8?B?aXlIc3hXMmp2L3RCcjFQbU9qLzVrQnVOakJiY2JMcGg1Zm9kcXgzL3Zqay8w?=
 =?utf-8?B?U0NSQUhSV2hjVkZNUGlzeE94T1N1OU5rUTNkV3BaWDd5dUR0RFljSGZsbnVS?=
 =?utf-8?B?dzZwVGpkUlBmYzRiTEUvWWxmb2hJS29Ub3VmUVNUbzA5WVlocVpaZz09?=
X-Exchange-RoutingPolicyChecked: arhXZ+jacO40HSLHdS8Fm0QDITzN6HpgTzqxno2vP++48SDXc4UmHHsX2cECtroofFqK/FTZ6yEOsdyxDl+Qz9fCg0+YJ2PFy4eDRRZLOgHqCSjBNy7UmQb6UHUrWT0+lFlflp0IOob9+l7S8B4BVtZkvEW/G22bZEpA+n0ds/2R0YW6b2JEnPl/aiyR/46gc/c16Vpv2WMd5HoDfRSvmO2vIDMM1ALwQ3KWY8MWIyx1nTOvlgix5ncLIptY7RC4v6pRHLgEPeEruEuOTE7iWSOaWf+sYDVnhvk5ZeHE37sdJ6AA5EK7b6g6mMaSenQXKp6xKPd+iQetGPPDozI/eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6495d2-8fa9-4d36-ee47-08df3eefd199
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:59:45.0242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSK/NRhySWW64M8cT2WWoJFZ523Xr0CHwOfZ96zQwzxl5RglW9l0+RP5wwQoN4x5eY8mNrjqiUitoG4YhD3EtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9744
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------GoCVkkSUicWpiXmOArGCTb6F
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
These failures reported here are expected skips, could you please re-report?

Thanks,
Anirban

On 06-11-2026 16:24, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_wedged: Add cold-reset wedge test (rev8)
> *URL:* 	https://patchwork.freedesktop.org/series/175755/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/index.html
>
>
>   CI Bug Log - changes from XEIGT_9177_FULL -> XEIGTPW_16110_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_16110_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_16110_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_16110_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_wedged@cold-reset-wedged (NEW):
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/shard-bmg-4/igt@xe_wedged@cold-reset-wedged.html>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/shard-ptl-5/igt@xe_wedged@cold-reset-wedged.html>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/shard-lnl-7/igt@xe_wedged@cold-reset-wedged.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_9177_FULL and 
> XEIGTPW_16110_FULL:
>
>
>       New IGT tests (1)
>
>   * igt@xe_wedged@cold-reset-wedged:
>       o Statuses : 3 skip(s)
>       o Exec time: [0.01, 0.03] s
>
>
>     Known issues
>
--------------GoCVkkSUicWpiXmOArGCTb6F
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      These failures reported here are expected skips, could you please
      re-report?</p>
    <p>Thanks,<br>
      Anirban</p>
    <div class="moz-cite-prefix">On 06-11-2026 16:24, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179396244596.131701.10125068638083303910@221881a7231d">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_wedged: Add cold-reset wedge test (rev8)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/175755/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/175755/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_9177_FULL -&gt;
        XEIGTPW_16110_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_16110_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_16110_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_16110_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_wedged@cold-reset-wedged (NEW):
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/shard-bmg-4/igt@xe_wedged@cold-reset-wedged.html" moz-do-not-send="true">SKIP</a></li>
            <li>shard-ptl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/shard-ptl-5/igt@xe_wedged@cold-reset-wedged.html" moz-do-not-send="true">SKIP</a></li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16110/shard-lnl-7/igt@xe_wedged@cold-reset-wedged.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_9177_FULL and
        XEIGTPW_16110_FULL:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@xe_wedged@cold-reset-wedged:
          <ul>
            <li>Statuses : 3 skip(s)</li>
            <li>Exec time: [0.01, 0.03] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------GoCVkkSUicWpiXmOArGCTb6F--
