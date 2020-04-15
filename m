Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 15 Apr 2020 09:49:46 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <0kwho152-gzRe09N-ECBh9KepTGX-b_MU8X-TtBnTdWAQP9o5ni7tOVqGn9LK2U2ormexeYvS8U1uVcBMY5Lv-Le4z0dnnMnRaSbb29xjqo=@emersion.fr>
In-Reply-To: <20200415094649.2tgelyotjliao2dk@gilmour.lan>
References: <20191022005910.siuiwfikmr76qpg3@smtp.gmail.com>
 <20200415094649.2tgelyotjliao2dk@gilmour.lan>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v7 i-g-t 2/4] kms_writeback: Add initial
 writeback tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Brian Starkey <rodrigosiqueiramelo@gmail.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

> > +   igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR, (uint64_t)out_fence_ptr);
>
> On ARM (32bits), this cast creates a compilation error since the
> pointer size isn't an uint64_t.

Does casting to uintptr_t before uint64_t fix it?
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
