Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5EC6E842
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 19:26:25 +0000 (UTC)
References: <20210928031100.34317-1-ashutosh.dixit@intel.com>
 <20210928065241.GA4608@zkempczy-mobl2>
 <8735pjf9rr.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <7167a2c4-e9fa-61a4-7ae4-5410931d005d@intel.com>
Date: Thu, 7 Oct 2021 12:26:16 -0700
In-Reply-To: <8735pjf9rr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Return allocated size in
 gem_create_in_memory_regions() and friends
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/2/2021 13:32, Dixit, Ashutosh wrote:
> On Mon, 27 Sep 2021 23:52:41 -0700, Zbigniew Kempczy=F1ski wrote:
>>> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
>>> index d1395c1605d..52794c1ac10 100644
>>> --- a/lib/intel_bufops.c
>>> +++ b/lib/intel_bufops.c
>>> @@ -819,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
>>> 	if (handle)
>>> 		buf->handle =3D handle;
>>> 	else {
>>> -		if (!__gem_create_in_memory_regions(bops->fd, &handle, size, region))
>>> +		if (!__gem_create_in_memory_regions(bops->fd, &handle, &size, region=
))
>>> 			buf->handle =3D handle;
>>> 		else
>>> 			buf->handle =3D gem_create(bops->fd, size);
>> As size can be different we pass we should update buf->size accordingly.
>> Look at few lines above:
>>
>> 	/* Store real bo size to avoid mistakes in calculating it again */
>> 	buf->size =3D size;
>>
>> I think these lines can be moved at the bottom of the condition.
>>
>> buf->size is returned as a call to intel_buf_bo_size() and used in
>> intel_bb_add_object(). This can be important for no-reloc mode to avoid
>> overlapping object on softpin and hitting -ENOSPC.
> I have a new patch reverting part of the changes done in 22643ce4014a:
>
> https://patchwork.freedesktop.org/series/95376/
>
> In this context I want to check regarding the above change again: should =
we
> be setting buf->size above to the allocated size or to the requested size,
> in case the two are different? Currently the code (even after the new
> patch) is setting it to the allocated size which might be >=3D the reques=
ted
> size. Thanks.
There are valid reasons why the actual allocated size is required by=20
some tests. For example, verifying that an error capture has captured a=20
buffer object correctly (and not saved too little/much data). If there=20
are also valid reasons why a test might fail if given the actual size=20
rather than the requested size then maybe we need another mechanism.=20
Either return both or provide support for querying one or both later on.

John.
