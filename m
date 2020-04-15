Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 15 Apr 2020 13:08:51 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200415100851.GS9497@platvala-desk.ger.corp.intel.com>
References: <20191022005910.siuiwfikmr76qpg3@smtp.gmail.com>
 <20200415094649.2tgelyotjliao2dk@gilmour.lan>
 <0kwho152-gzRe09N-ECBh9KepTGX-b_MU8X-TtBnTdWAQP9o5ni7tOVqGn9LK2U2ormexeYvS8U1uVcBMY5Lv-Le4z0dnnMnRaSbb29xjqo=@emersion.fr>
 <20200415100618.dffhwxhctgarqleq@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415100618.dffhwxhctgarqleq@gilmour.lan>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v7 i-g-t 2/4] kms_writeback: Add
 initial writeback tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Liviu Dudau <Liviu.Dudau@arm.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, nd <nd@arm.com>, Brian Starkey <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 12:06:18PM +0200, Maxime Ripard wrote:
> On Wed, Apr 15, 2020 at 09:49:46AM +0000, Simon Ser wrote:
> > > > +   igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR, (uint64_t)out_fence_ptr);
> > >
> > > On ARM (32bits), this cast creates a compilation error since the
> > > pointer size isn't an uint64_t.
> >
> > Does casting to uintptr_t before uint64_t fix it?
> 
> It does yep. Casting to uintptr_t alone also works


to_user_pointer(out_fence_ptr)

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
