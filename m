Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28D489E33
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Nov 2022 18:21:34 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id j2so11589319ljg.10
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Nov 2022 10:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20221117225907.793-1-99danilt@gmail.com>
 <Y34IK0CfztnHIXks@kamilkon-desk1>
 <CAAdMht-S1hZ1a3Yef+PDqzFFh9_E=ueN5PgoYmwfmpm8EM_TTg@mail.gmail.com>
In-Reply-To: <CAAdMht-S1hZ1a3Yef+PDqzFFh9_E=ueN5PgoYmwfmpm8EM_TTg@mail.gmail.com>
From: Daniel Tatianin <99danilt@gmail.com>
Date: Mon, 28 Nov 2022 21:21:21 +0300
Message-ID: <CAAdMht_O9Ff3TK28VV7R7EUCJ47Bgqs_SYqS-CBarD=BQqY0GQ@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Daniil Tatianin <99danilt@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e442ab05ee8bf08a"
Subject: Re: [igt-dev] [PATCH v1] tools/intel_gtt: stop confusing GTT and
 BAR sizes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000e442ab05ee8bf08a
Content-Type: text/plain; charset="UTF-8"

ping

On Thu, Nov 24, 2022 at 7:11 PM Daniel Tatianin <99danilt@gmail.com> wrote:

>
> On Wed, Nov 23, 2022 at 2:46 PM Kamil Konieczny <
> kamil.konieczny@linux.intel.com> wrote:
>
>> Hi Daniil,
>>
>> On 2022-11-18 at 01:59:07 +0300, Daniil Tatianin wrote:
>> > The GTT iteration loop would erroneously check "< gtt_size" as an
>> > indicator for when it should stop, which would make it exit the loop
>> > right after dumping 2-8 mib of address space depending on the
>> > GPU generation.
>> >
>> > Calculate the actual size of GTT in 'gtt_max_addr', and rewrite the
>> > iteration loop to use it. While at it, also make virtual addresses
>> > 64-bit so that they don't wrap around at the 4GiB mark.
>> >
>> > Signed-off-by: Daniil Tatianin <99danilt@gmail.com>
>>
>> There is only one concern - this programm assumes 4KB page size
>>
> Right, I think this entire utility assumes 4KB page size. Is that not
> always the case?
> I think that it should be a separate patch if we're going to get rid of
> that assumption, as
> it basically has that constant all over the place.
>
>
>> and uses unsigned instead of unsigned int (or uint64_t).
>>
> Oops, my bad
>
>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> > ---
>> >  tools/intel_gtt.c | 32 ++++++++++++++++++--------------
>> >  1 file changed, 18 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c
>> > index 311694ba..c0f3d16a 100644
>> > --- a/tools/intel_gtt.c
>> > +++ b/tools/intel_gtt.c
>> > @@ -96,6 +96,11 @@ static uint64_t get_phys(uint32_t pt_offset)
>> >       return (phys | pae) & ~0xfff;
>> >  }
>> >
>> > +static int get_pte_size(void)
>> > +{
>> > +     return intel_gen(devid) < 8 ? 4 : 8;
>> > +}
>> > +
>> >  static void pte_dump(int size, uint32_t offset) {
>> >       int pte_size;
>> >       int entries;
>> > @@ -105,11 +110,7 @@ static void pte_dump(int size, uint32_t offset) {
>> >       if (size % 16)
>> >               size = (size + 16) & ~0xffff;
>> >
>> > -     if (intel_gen(devid) < 8)
>> > -             pte_size = 4;
>> > -     else
>> > -             pte_size = 8;
>> > -
>> > +     pte_size = get_pte_size();
>> >       entries = size / pte_size;
>> >
>> >       printf("GTT offset   |                 %d PTEs (%d MB)\n",
>> entries,
>> > @@ -139,7 +140,8 @@ static void pte_dump(int size, uint32_t offset) {
>> >  int main(int argc, char **argv)
>> >  {
>> >       struct pci_device *pci_dev;
>> > -     unsigned int start, gtt_size;
>> > +     unsigned gtt_size;
>> > +     uint64_t start, gtt_max_addr;
>> >       int flag[] = {
>> >               PCI_DEV_MAP_FLAG_WRITE_COMBINE,
>> >               PCI_DEV_MAP_FLAG_WRITABLE,
>> > @@ -190,14 +192,15 @@ int main(int argc, char **argv)
>> >               return 0;
>> >       }
>> >
>> > -     for (start = 0; start < gtt_size; start += KB(4)) {
>> > -             uint64_t start_phys = get_phys(start);
>> > -             uint32_t end;
>> > +     gtt_max_addr = (gtt_size / get_pte_size()) * KB(4ull);
>> > +
>> > +     for (start = 0; start < gtt_max_addr; start += KB(4)) {
>> > +             uint64_t end, start_phys = get_phys(start);
>> >               int constant_length = 0;
>> >               int linear_length = 0;
>> >
>> >               /* Check if it's a linear sequence */
>> > -             for (end = start + KB(4); end < gtt_size; end += KB(4)) {
>> > +             for (end = start + KB(4); end < gtt_max_addr; end +=
>> KB(4)) {
>> >                       uint64_t end_phys = get_phys(end);
>> >                       if (end_phys == start_phys + (end - start))
>> >                               linear_length++;
>> > @@ -205,7 +208,7 @@ int main(int argc, char **argv)
>> >                               break;
>> >               }
>> >               if (linear_length > 0) {
>> > -                     printf("0x%08x - 0x%08x: linear from "
>> > +                     printf("0x%08" PRIx64 "- 0x%08" PRIx64 ": linear
>> from "
>> >                              "0x%" PRIx64 " to 0x%" PRIx64 "\n",
>> >                              start, end - KB(4),
>> >                              start_phys, start_phys + (end - start) -
>> KB(4));
>> > @@ -214,7 +217,7 @@ int main(int argc, char **argv)
>> >               }
>> >
>> >               /* Check if it's a constant sequence */
>> > -             for (end = start + KB(4); end < gtt_size; end += KB(4)) {
>> > +             for (end = start + KB(4); end < gtt_max_addr; end +=
>> KB(4)) {
>> >                       uint64_t end_phys = get_phys(end);
>> >                       if (end_phys == start_phys)
>> >                               constant_length++;
>> > @@ -222,13 +225,14 @@ int main(int argc, char **argv)
>> >                               break;
>> >               }
>> >               if (constant_length > 0) {
>> > -                     printf("0x%08x - 0x%08x: constant 0x%" PRIx64
>> "\n",
>> > +                     printf("0x%08" PRIx64 " - 0x%08" PRIx64
>> > +                             ": constant 0x%" PRIx64 "\n",
>> >                              start, end - KB(4), start_phys);
>> >                       start = end - KB(4);
>> >                       continue;
>> >               }
>> >
>> > -             printf("0x%08x: 0x%" PRIx64 "\n", start, start_phys);
>> > +             printf("0x%08" PRIx64 ": 0x%" PRIx64 "\n", start,
>> start_phys);
>> >       }
>> >
>> >       return 0;
>> > --
>> > 2.36.1.windows.1
>> >
>
> Thanks!
>

--000000000000e442ab05ee8bf08a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 24, 2022 at 7:11 PM Daniel Tatianin &lt;<a=
 href=3D"mailto:99danilt@gmail.com">99danilt@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Nov 23, 2022 at 2:46 PM Kamil Konieczny &lt;<a href=3D=
"mailto:kamil.konieczny@linux.intel.com" target=3D"_blank">kamil.konieczny@=
linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Daniil,<br>
<br>
On 2022-11-18 at 01:59:07 +0300, Daniil Tatianin wrote:<br>
&gt; The GTT iteration loop would erroneously check &quot;&lt; gtt_size&quo=
t; as an<br>
&gt; indicator for when it should stop, which would make it exit the loop<b=
r>
&gt; right after dumping 2-8 mib of address space depending on the<br>
&gt; GPU generation.<br>
&gt; <br>
&gt; Calculate the actual size of GTT in &#39;gtt_max_addr&#39;, and rewrit=
e the<br>
&gt; iteration loop to use it. While at it, also make virtual addresses<br>
&gt; 64-bit so that they don&#39;t wrap around at the 4GiB mark.<br>
&gt; <br>
&gt; Signed-off-by: Daniil Tatianin &lt;<a href=3D"mailto:99danilt@gmail.co=
m" target=3D"_blank">99danilt@gmail.com</a>&gt;<br>
<br>
There is only one concern - this programm assumes 4KB page size<br></blockq=
uote><div>Right, I think this entire utility assumes 4KB page size. Is that=
 not always the case?<br>I think that it should be a separate patch if we&#=
39;re going to get rid of that assumption, as<br>it basically has that cons=
tant all over the place.<br>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
and uses unsigned instead of unsigned int (or uint64_t).<br></blockquote><d=
iv>Oops, my bad</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Reviewed-by: Kamil Konieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.in=
tel.com" target=3D"_blank">kamil.konieczny@linux.intel.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 tools/intel_gtt.c | 32 ++++++++++++++++++--------------<br>
&gt;=C2=A0 1 file changed, 18 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c<br>
&gt; index 311694ba..c0f3d16a 100644<br>
&gt; --- a/tools/intel_gtt.c<br>
&gt; +++ b/tools/intel_gtt.c<br>
&gt; @@ -96,6 +96,11 @@ static uint64_t get_phys(uint32_t pt_offset)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (phys | pae) &amp; ~0xfff;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; +static int get_pte_size(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return intel_gen(devid) &lt; 8 ? 4 : 8;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void pte_dump(int size, uint32_t offset) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int pte_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int entries;<br>
&gt; @@ -105,11 +110,7 @@ static void pte_dump(int size, uint32_t offset) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size % 16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (size +=
 16) &amp; ~0xffff;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (intel_gen(devid) &lt; 8)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_size =3D 4;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_size =3D 8;<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pte_size =3D get_pte_size();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0entries =3D size / pte_size;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;GTT offset=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%d PTEs (%d MB)\n&qu=
ot;, entries,<br>
&gt; @@ -139,7 +140,8 @@ static void pte_dump(int size, uint32_t offset) {<=
br>
&gt;=C2=A0 int main(int argc, char **argv)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_device *pci_dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned int start, gtt_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned gtt_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint64_t start, gtt_max_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int flag[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_DEV_MAP_FLAG=
_WRITE_COMBINE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_DEV_MAP_FLAG=
_WRITABLE,<br>
&gt; @@ -190,14 +192,15 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (start =3D 0; start &lt; gtt_size; start +=3D=
 KB(4)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t start_phys =
=3D get_phys(start);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t end;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gtt_max_addr =3D (gtt_size / get_pte_size()) * KB=
(4ull);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (start =3D 0; start &lt; gtt_max_addr; start =
+=3D KB(4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t end, start_p=
hys =3D get_phys(start);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int constant_len=
gth =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int linear_lengt=
h =3D 0;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if it&#=
39;s a linear sequence */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (end =3D start + =
KB(4); end &lt; gtt_size; end +=3D KB(4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (end =3D start + =
KB(4); end &lt; gtt_max_addr; end +=3D KB(4)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint64_t end_phys =3D get_phys(end);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (end_phys =3D=3D start_phys + (end - start))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linear_length++;<br>
&gt; @@ -205,7 +208,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (linear_lengt=
h &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0printf(&quot;0x%08x - 0x%08x: linear from &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0printf(&quot;0x%08&quot; PRIx64 &quot;- 0x%08&quot; PRIx64 &quot;: l=
inear from &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0x%&quot; PRIx64 &quot; to 0x%&quo=
t; PRIx64 &quot;\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start, end - KB(4),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_phys, start_phys + (end - start) -=
 KB(4));<br>
&gt; @@ -214,7 +217,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if it&#=
39;s a constant sequence */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (end =3D start + =
KB(4); end &lt; gtt_size; end +=3D KB(4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (end =3D start + =
KB(4); end &lt; gtt_max_addr; end +=3D KB(4)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint64_t end_phys =3D get_phys(end);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (end_phys =3D=3D start_phys)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0constant_length++;<br>
&gt; @@ -222,13 +225,14 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (constant_len=
gth &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0printf(&quot;0x%08x - 0x%08x: constant 0x%&quot; PRIx64 &quot;\n&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0printf(&quot;0x%08&quot; PRIx64 &quot; - 0x%08&quot; PRIx64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;: constant 0x%&quot; PRIx64 &quot;=
\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start, end - KB(4), start_phys);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0start =3D end - KB(4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;0x%08x: =
0x%&quot; PRIx64 &quot;\n&quot;, start, start_phys);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;0x%08&qu=
ot; PRIx64 &quot;: 0x%&quot; PRIx64 &quot;\n&quot;, start, start_phys);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; --<br>
&gt; 2.36.1.windows.1<br>
&gt;</blockquote><div>Thanks!=C2=A0</div></div></div>
</blockquote></div>

--000000000000e442ab05ee8bf08a--
