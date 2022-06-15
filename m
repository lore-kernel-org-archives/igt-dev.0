Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0754610E347
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 08:21:56 +0000 (UTC)
Date: Wed, 15 Jun 2022 11:19:56 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <YqmWLK1rB5h5bukr@platvala-desk.ger.corp.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
 <87edzqxw6t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87edzqxw6t.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 00/23] tools/intel_vbt_decode: Improve
 the parser
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

On Wed, Jun 15, 2022 at 09:44:26AM +0300, Jani Nikula wrote:
> On Wed, 15 Jun 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Change the igt VBT parser to make copies of the BDB data blocks
> > (just as we do in the kernel parser now). This makes it less
> > hazardous/confusing if your block definition don't happent to
> > match reality. 
> >
> > Eg. with the current scheme we could very easily misinterpret
> > random bits from other blocks/etc. as our block data by just
> > using an overly large structure for decoding. With the block
> > copies being  at least as big as out struct definitions the
> > worst that can happen is that we just decode some extra zeroes
> > rather than some random other bits.
> >
> > The other thing I'm bringing over is the data pointer generation
> > stuff for modern VBTS (which lack the LFP data table pointes block).
> > That lets us keep decoding the LFP data block in exactly the
> > same way on old and new VBTs.
> >
> > And naturally we have massive gaps in what data the tool actually
> > parses from the VBT. So lots of patches to just parse more stuff.
> > I didn't do an exhaustive study on this topic, so still probably
> > missing some useful things.
> 
> I glanced through all this, and it LGTM, but can't claim I did a
> detailed, thorough review. I also don't think it should really be
> necessary for this particular tool. If the changes work for you, it's
> good enough for me.
> 
> Cc: Petri, good to go with that?

Yeah, ack.


-- 
Petri Latvala
