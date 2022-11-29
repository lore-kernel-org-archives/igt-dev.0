Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F79910E07D
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 10:02:45 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
In-Reply-To: <Y4XYGG+X8qFZiIsf@intel.com>
References: <20221129084710.1151876-1-jani.nikula@intel.com>
 <Y4XYGG+X8qFZiIsf@intel.com>
Date: Tue, 29 Nov 2022 12:02:39 +0200
Message-ID: <87a64a3wow.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: decode VBT MIPI
 sequence v4 native flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 29 Nov 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Nov 29, 2022 at 10:47:10AM +0200, Jani Nikula wrote:
>> MIPI sequence v4 has a flag for native/non-native GPIO.
>
> An naturally zero docs on what it actually means. But looks like
> we're just meant to poke various DE registers for the "native" case.

Yeah.

Related to [1] and [2], where I'm trying to poke said registers, with
varying success.

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/6131
[2] https://cgit.freedesktop.org/~jani/drm/log/?h=3Ddsi-gpio

>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  tools/intel_vbt_decode.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index a63bfdda142a..94a910b5c107 100644
>> --- a/tools/intel_vbt_decode.c
>> +++ b/tools/intel_vbt_decode.c
>> @@ -2049,8 +2049,12 @@ static const uint8_t *mipi_dump_gpio(const uint8_=
t *data, uint8_t seq_version)
>>  		number =3D *data++;
>>  		flags =3D *data++;
>>=20=20
>> -		printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
>> -		       index, number, flags & 1, flags);
>> +		if (seq_version >=3D 4)
>> +			printf("\t\t\tGPIO index %u, number %u, native %d, set %d (0x%02x)\n=
",
>> +			       index, number, !(flags & 2), flags & 1, flags);
>> +		else
>> +			printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
>> +			       index, number, flags & 1, flags);
>>  	} else {
>>  		index =3D *data++;
>>  		flags =3D *data++;
>> --=20
>> 2.34.1

--=20
Jani Nikula, Intel Open Source Graphics Center
