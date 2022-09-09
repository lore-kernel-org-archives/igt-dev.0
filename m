Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFD910E179
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 10:44:30 +0000 (UTC)
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Latvala, Petri" <petri.latvala@intel.com>
Date: Fri, 9 Sep 2022 10:44:26 +0000
Message-ID: <MWHPR11MB142313161D75EEEB8BAA6806DA439@MWHPR11MB1423.namprd11.prod.outlook.com>
References: <20220909074254.2032191-1-kunal1.joshi@intel.com>
 <Yxr9hjWf4LVsO034@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yxr9hjWf4LVsO034@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_chamelium: Fix common
 suspend/hibernate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>> @@ -577,19 +577,19 @@ test_suspend_resume_hpd_common(data_t *data, enum =
igt_suspend_state state,
>>  	for (p =3D 0; p < data->port_count; p++) {
>>  		port =3D data->ports[p];
>>  		igt_debug("Testing port %s\n", chamelium_port_get_name(port));
>> -	}
>> =20
>> -	igt_modeset_disable_all_outputs(&data->display);
>> -	chamelium_reset_state(&data->display, data->chamelium, NULL,
>> -			      data->ports, data->port_count);
>> +		igt_modeset_disable_all_outputs(&data->display);
>> +		chamelium_reset_state(&data->display, data->chamelium, NULL,
>> +				      data->ports, data->port_count);
>> =20
>> -	/* Make sure we notice new connectors after resuming */
>> -	try_suspend_resume_hpd(data, NULL, state, test, mon, false);
>> +		/* Make sure we notice new connectors after resuming */
>> +		try_suspend_resume_hpd(data, NULL, state, test, mon, false);
>> =20
>> -	/* Now make sure we notice disconnected connectors after resuming */
>> -	try_suspend_resume_hpd(data, NULL, state, test, mon, true);
>> +		/* Now make sure we notice disconnected connectors after resuming */
>> +		try_suspend_resume_hpd(data, NULL, state, test, mon, true);
>> =20
>> -	igt_cleanup_uevents(mon);
>> +		igt_cleanup_uevents(mon);
>> +	}

>What are these changes here? Did you (accidentally?) make the suspend-resu=
mes repeated > for every port?

> --
> Petri Latvala

Got you,
try_suspend_resume_hpd already schedules hotplug if NULL passed as port,
will remove these changes in v2.

Thanks, Petri.


