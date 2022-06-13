Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E17E10E77F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 06:28:02 +0000 (UTC)
Date: Mon, 13 Jun 2022 09:23:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YqbX9Qx0l0XH8RM8@platvala-desk.ger.corp.intel.com>
References: <20220607052411.7357-1-zbigniew.kempczynski@intel.com>
 <20220607052411.7357-3-zbigniew.kempczynski@intel.com>
 <YqHA61LytW1GZN6h@platvala-desk.ger.corp.intel.com>
 <YqLVl9UaFDnuJ7GC@zkempczy-mobl2>
 <YqL4jFC768/tsrDg@platvala-desk.ger.corp.intel.com>
 <Yqa1jljmBr1zlpQU@zkempczy-mobl2>
 <YqbKjBqo/I7vCslR@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqbKjBqo/I7vCslR@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_crc: Introduce common place
 for crc tables and functions
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

On Mon, Jun 13, 2022 at 08:26:36AM +0300, Petri Latvala wrote:
> On Mon, Jun 13, 2022 at 05:57:02AM +0200, Zbigniew Kempczyński wrote:
> > On Fri, Jun 10, 2022 at 10:53:48AM +0300, Petri Latvala wrote:
> > > On Fri, Jun 10, 2022 at 07:24:39AM +0200, Zbigniew Kempczyński wrote:
> > > > On Thu, Jun 09, 2022 at 12:44:11PM +0300, Petri Latvala wrote:
> > > > > On Tue, Jun 07, 2022 at 07:24:09AM +0200, Zbigniew Kempczyński wrote:
> > > > > > Add crc32 table for on-cpu crc calculation function. Other tables and
> > > > > > algorithms should be added here allowing reuse tables for in-gpu crc
> > > > > > calculation.
> > > > > > 
> > > > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > > > ---
> > > > > >  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
> > > > > >  lib/igt_crc.c                                 | 107 ++++++++++++++++++
> > > > > >  lib/igt_crc.h                                 |  31 +++++
> > > > > >  lib/meson.build                               |   1 +
> > > > > >  4 files changed, 140 insertions(+)
> > > > > >  create mode 100644 lib/igt_crc.c
> > > > > >  create mode 100644 lib/igt_crc.h
> > > > > > 
> > > > > > diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> > > > > > index 1774256530..b78f1eb6ff 100644
> > > > > > --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> > > > > > +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> > > > > > @@ -22,6 +22,7 @@
> > > > > >      <xi:include href="xml/igt_chamelium.xml"/>
> > > > > >      <xi:include href="xml/igt_collection.xml"/>
> > > > > >      <xi:include href="xml/igt_core.xml"/>
> > > > > > +    <xi:include href="xml/igt_crc.xml"/>
> > > > > >      <xi:include href="xml/igt_debugfs.xml"/>
> > > > > >      <xi:include href="xml/igt_device.xml"/>
> > > > > >      <xi:include href="xml/igt_device_scan.xml"/>
> > > > > > diff --git a/lib/igt_crc.c b/lib/igt_crc.c
> > > > > > new file mode 100644
> > > > > > index 0000000000..e634f5cf27
> > > > > > --- /dev/null
> > > > > > +++ b/lib/igt_crc.c
> > > > > > @@ -0,0 +1,107 @@
> > > > > > +/*-
> > > > > > + *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
> > > > > > + *  code or tables extracted from it, as desired without restriction.
> > > > > > + */
> > > > > > +
> > > > > > +/*
> > > > > > + *  First, the polynomial itself and its table of feedback terms.  The
> > > > > > + *  polynomial is
> > > > > > + *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
> > > > > > + *
> > > > > > + *  Note that we take it "backwards" and put the highest-order term in
> > > > > > + *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
> > > > > > + *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
> > > > > > + *  the MSB being 1
> > > > > > + *
> > > > > > + *  Note that the usual hardware shift register implementation, which
> > > > > > + *  is what we're using (we're merely optimizing it by doing eight-bit
> > > > > > + *  chunks at a time) shifts bits into the lowest-order term.  In our
> > > > > > + *  implementation, that means shifting towards the right.  Why do we
> > > > > > + *  do it this way?  Because the calculated CRC must be transmitted in
> > > > > > + *  order from highest-order term to lowest-order term.  UARTs transmit
> > > > > > + *  characters in order from LSB to MSB.  By storing the CRC this way
> > > > > > + *  we hand it to the UART in the order low-byte to high-byte; the UART
> > > > > > + *  sends each low-bit to hight-bit; and the result is transmission bit
> > > > > > + *  by bit from highest- to lowest-order term without requiring any bit
> > > > > > + *  shuffling on our part.  Reception works similarly
> > > > > > + *
> > > > > > + *  The feedback terms table consists of 256, 32-bit entries.  Notes
> > > > > > + *
> > > > > > + *      The table can be generated at runtime if desired; code to do so
> > > > > > + *      is shown later.  It might not be obvious, but the feedback
> > > > > > + *      terms simply represent the results of eight shift/xor opera
> > > > > > + *      tions for all combinations of data and CRC register values
> > > > > > + *
> > > > > > + *      The values must be right-shifted by eight bits by the "updcrc
> > > > > > + *      logic; the shift must be unsigned (bring in zeroes).  On some
> > > > > > + *      hardware you could probably optimize the shift in assembler by
> > > > > > + *      using byte-swap instructions
> > > > > > + *      polynomial $edb88320
> > > > > 
> > > > > This is also in the original code but... what?
> > > > 
> > > > For of writing coefficients:
> > > > 
> > > > X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
> > > > 
> > > > bin(0xedb88320)
> > > > 0b 1110 1101 1011 1000 1000 0011 0010 0000
> > > >    012  45 7 8                22 23   26
> > > >                10 
> > > > 	        11
> > > > 		  12   16
> > > > 
> > > > Here it is well explained:
> > > > https://www.greenend.org.uk/rjk/tech/crc.html
> > > 
> > > Can the last sentence of the comment be restructured to be more
> > > English? In the current form it's like
> > 
> > You mean in-code comment or my comment? If above I just copied it 1:1
> > and I would like to keep this intact. If mine I will send this in
> > next version.
> 
> The comment in the code.

Meh, everyone who copies the code seems to be just carrying the
comment as is. Might as well do the same here.


-- 
Petri Latvala
